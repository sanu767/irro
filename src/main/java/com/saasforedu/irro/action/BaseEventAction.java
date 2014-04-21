package com.saasforedu.irro.action;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.saasforedu.irro.article.action.MenuBaseAction;
import com.saasforedu.irro.article.bean.AttachmentBean;
import com.saasforedu.irro.bean.ItemBean;
import com.saasforedu.irro.service.EventService;
import com.saasforedu.irro.util.IConstants;
import com.saasforedu.irro.util.IrroUtils;
import com.saasforedu.irro.xmlelements.EventElement;
import com.saasforedu.irro.xmlelements.EventsRootElement;

public class BaseEventAction extends MenuBaseAction implements ServletRequestAware {
	
	private static final long serialVersionUID = 161255011804368764L;

	private static final String PATH = "E:\\Data";

	private EventService eventService;
	
	private HttpServletRequest httpServletRequest;
	
	private ItemBean bean = new ItemBean();
	
	private String [] deletedItemIds;
	
	private Long selectedItemId;
	
	private String selectedFileAttachmentName;
	
	/** Attachment Uploading relates to event **/
	File file;
	String contentType;
	String fileName;

	public void setUpload(File file) {
		this.file = file;
	}
	
	public void setUploadFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public void setUploadContentType(String contentType) {
		this.contentType = contentType;
	}
	
	
	/** Slider Attachment Uploading relates to event **/
	File sliderFile;
	String sliderContentType;
	String sliderFileName;

	public void setUploadSlider(File file) {
		this.sliderFile = file;
	}
	
	public void setUploadSliderFileName(String fileName) {
		this.sliderFileName = fileName;
	}
	
	public void setUploadSliderContentType(String contentType) {
		this.sliderContentType = contentType;
	}
	
	public void setEventService(EventService eventService) {
		this.eventService = eventService;
	}
	
	public String[] getDeletedItemIds() {
		return deletedItemIds;
	}

	public void setDeletedItemIds(String[] deletedItemIds) {
		this.deletedItemIds = deletedItemIds;
	}
	
	public String createEvent() throws Exception {
		List<EventElement> elements = new ArrayList<EventElement>();
		try {
			File folder = new File(PATH);
			for (final File file : folder.listFiles()) {
				if (!file.isDirectory()) {
					
					JAXBContext jaxbContext = 
							JAXBContext.newInstance(EventsRootElement.class);
					Unmarshaller jaxbUnmarshaller = 
							jaxbContext.createUnmarshaller();
					EventsRootElement events = 
							(EventsRootElement) jaxbUnmarshaller.unmarshal(file);

					for (EventElement elem : events.getListOfEvents()) {
						elements.add(elem);
					}
				}
			}
		} catch (JAXBException e) {
			e.printStackTrace();
		}

		eventService.create(elements);
		return SUCCESS;
	}

	public String createItem() throws Exception {
		if(!validateSlider(bean)) {
			return ERROR;
		}
		setSliderAttributes(bean);
		bean.setUrl(getURL());
		List<AttachmentBean> uploadedFilesInSession = getUploadedFilesInSession();
		bean.setAttachmentBeans(uploadedFilesInSession);
		Long newItemId = eventService.create(bean);
		getSession().removeAttribute(IConstants.UPLOADED_EVENTS_FILES_SESSION_ATTRIBUTE_NAME);
		return newItemId > 0 ? SUCCESS : ERROR;
	}
	
	public String createItemFromAdmin() throws Exception {
		if(!validateSlider(bean)) {
			return ERROR;
		}
		setSliderAttributes(bean);
		bean.setUrl(getURL());
		List<AttachmentBean> uploadedFilesInSession = getUploadedFilesInSession();
		bean.setAttachmentBeans(uploadedFilesInSession);
		Long newItemId = eventService.create(bean);
		getSession().removeAttribute(IConstants.UPLOADED_EVENTS_FILES_SESSION_ATTRIBUTE_NAME);
		return newItemId > 0 ? SUCCESS : ERROR;
	}

	public String doUploadEventFile() throws Exception {
		if(!validateUploadFiles(fileName)) {
			return ERROR;
		}
		AttachmentBean uploadedArticleFile = eventService.doUploadEventsFile(fileName, contentType, file, getServerPath());
		List<AttachmentBean> uploadedFiles = getUploadedFilesInSession();
		uploadedFiles.add(uploadedArticleFile);
		bean.setAttachmentBeans(uploadedFiles);
		return SUCCESS;
	}

	public String loadEvent() {
		ItemBean bean = eventService.findEvent(selectedItemId);
		this.bean = bean;
		return SUCCESS;
	}
	
	public String modifyItem() throws Exception {
		if(!validateSliderForSavedEvents(bean)) {
			List<AttachmentBean> uploadedFiles = getUploadedFilesInSession();
			bean.setAttachmentBeans(uploadedFiles);
			return ERROR;
		}
		setSliderAttributesForSavedEvent(bean);
		List<AttachmentBean> uploadedFilesInSession = getUploadedFilesInSession();
		bean.setAttachmentBeans(uploadedFilesInSession);
		eventService.updateItem(bean);
		getSession().removeAttribute(IConstants.UPLOADED_EVENTS_FILES_SESSION_ATTRIBUTE_NAME);
		return SUCCESS;
	}
	
	public String deleteItem() throws Exception {
		eventService.deleteItem(IrroUtils.getLongListFromStringArray(deletedItemIds), getServerPath());
		return SUCCESS;
	}

	public String activateAttachment() {
		AttachmentBean selectedFileAttachment = getSelectedAttachmentBean(selectedFileAttachmentName);
		selectedFileAttachment.setActive(true);
		replaceAttachmentBean(selectedFileAttachment);
		List<AttachmentBean> uploadedFiles = getUploadedFilesInSession();
		bean.setAttachmentBeans(uploadedFiles);
		return SUCCESS;
	}
	
	public String deActivateAttachment() {
		AttachmentBean selectedFileAttachment = getSelectedAttachmentBean(selectedFileAttachmentName);
		selectedFileAttachment.setActive(false);
		replaceAttachmentBean(selectedFileAttachment);
		List<AttachmentBean> uploadedFiles = getUploadedFilesInSession();
		bean.setAttachmentBeans(uploadedFiles);
		return SUCCESS;
	}
	
	public String removeAttachment() {
		AttachmentBean selectedFileAttachment = getSelectedAttachmentBean(selectedFileAttachmentName);
		eventService.removeAttachment(selectedFileAttachment, getServerPath());
		removeAttachmentBean(selectedFileAttachment);
		List<AttachmentBean> files = getUploadedFilesInSession();
		bean.setAttachmentBeans(files);
		return SUCCESS;
	}
	
	private void replaceAttachmentBean(AttachmentBean newAttachmentBean) {
		List<AttachmentBean> attachedFiles = getUploadedFilesInSession();
		ListIterator<AttachmentBean> fileIterator = attachedFiles.listIterator();
		while (fileIterator.hasNext()) {
			AttachmentBean attachmentBean = (AttachmentBean) fileIterator.next();
			if(attachmentBean.getName().equals(selectedFileAttachmentName)) {
				fileIterator.set(newAttachmentBean);
			}
		}
	}
	
	private void removeAttachmentBean(AttachmentBean selectedAttachment) {
		List<AttachmentBean> attachedFiles = getUploadedFilesInSession();
		ListIterator<AttachmentBean> fileIterator = attachedFiles.listIterator();
		while (fileIterator.hasNext()) {
			AttachmentBean attachmentBean = (AttachmentBean) fileIterator.next();
			if(attachmentBean.equals(selectedAttachment)) {
				fileIterator.remove();
			}
		}		
	}
	
	private AttachmentBean getSelectedAttachmentBean(String selectedAttachmentName) {
		List<AttachmentBean> attachedFiles = getUploadedFilesInSession();
		ListIterator<AttachmentBean> fileIterator = attachedFiles.listIterator();
		while (fileIterator.hasNext()) {
			AttachmentBean attachmentBean = (AttachmentBean) fileIterator.next();
			if(attachmentBean.getName().equals(selectedAttachmentName)) {
				return attachmentBean;
			}
		}
		return null;
	}
	
	public boolean validateSlider(ItemBean bean) {
		if(bean.isSliderSelected()) {
			if(sliderFile == null || sliderFileName == null) {
				addActionError("No Slider Image selected ");
				return false;
			}
			
			if(sliderFile != null) {
				BufferedImage bufferedImage;
				try {
					bufferedImage = ImageIO.read(sliderFile);
					int height = bufferedImage.getHeight();
					int width = bufferedImage.getWidth();
					if(height < 350 ) {
						addActionError(getText("errors.image.height"));
						return false;
					}
					if(width < 1000 ) {
						addActionError(getText("errors.image.width"));
						return false;
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return true;
	}
	
	public boolean validateSliderForSavedEvents(ItemBean bean) {
		if(bean.isSliderSelected()) {
			//New Slider selected
			if(sliderFile != null) {
				BufferedImage bufferedImage;
				try {
					bufferedImage = ImageIO.read(sliderFile);
					int height = bufferedImage.getHeight();
					int width = bufferedImage.getWidth();
					if(height < 350 ) {
						addActionError(getText("errors.image.height"));
						return false;
					}
					if(width < 1000 ) {
						addActionError(getText("errors.image.width"));
						return false;
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return true;
	}
	
	private void setSliderAttributesForSavedEvent(ItemBean bean) {
		if(bean.isSliderSelected() && this.sliderFileName != null && sliderFile != null) {
			bean.setSliderImage(this.sliderFileName);
			bean.setSliderFile(sliderFile);
			bean.setSliderPath(getSliderPath());
		}
	}
	
	public boolean validateUploadFiles(String fileName) {
		if(StringUtils.isEmpty(fileName)) {
			addActionError("Please choose file to upload");
			return false;
		}
		//TODO Check this file already exists
		return true;
	}

	@SuppressWarnings("deprecation")
	private String getSliderPath() {
		StringBuilder sliderLocationBuilder = new StringBuilder(httpServletRequest.getRealPath("/"));
		sliderLocationBuilder.append(IConstants.SLIDER);
		return sliderLocationBuilder.toString();
	}
	
	private String getURL() {
		String path = httpServletRequest.getContextPath();
		StringBuilder urlBuilder = new StringBuilder();
		urlBuilder.append(httpServletRequest.getScheme());
		urlBuilder.append("://");
		urlBuilder.append(httpServletRequest.getServerName());
		urlBuilder.append(":");
		urlBuilder.append(httpServletRequest.getServerPort());
		urlBuilder.append("/");
		if(path != null) {
			urlBuilder.append(path);
		}
		return urlBuilder.toString();
	}
	
	@Override
	public void setServletRequest(HttpServletRequest httpServletRequest) {
		this.httpServletRequest = httpServletRequest;
	}
	
	@SuppressWarnings("unchecked")
	private List<AttachmentBean> getUploadedFilesInSession() {
		HttpSession session = getSession();
		List<AttachmentBean> uploadedFiles = (List<AttachmentBean>)session.getAttribute(IConstants.UPLOADED_EVENTS_FILES_SESSION_ATTRIBUTE_NAME);
		if(uploadedFiles == null || uploadedFiles.isEmpty()) {
			session.setAttribute(IConstants.UPLOADED_EVENTS_FILES_SESSION_ATTRIBUTE_NAME, new ArrayList<AttachmentBean>());
		}
		return (List<AttachmentBean>)session.getAttribute(IConstants.UPLOADED_EVENTS_FILES_SESSION_ATTRIBUTE_NAME);
	}
	
	public HttpSession getSession() {
		HttpSession session = httpServletRequest.getSession();
		return session;
	}
	
	private void setSliderAttributes(ItemBean bean) throws IOException {
		if(bean.isSliderSelected()) {
			bean.setSliderImage(this.sliderFileName);
			bean.setSliderFile(sliderFile);
			bean.setSliderPath(getSliderPath());
		}
	}

	public ItemBean getBean() {
		return bean;
	}

	public void setBean(ItemBean bean) {
		this.bean = bean;
	}
	
	@SuppressWarnings("deprecation")
	private String getServerPath() {
		return httpServletRequest.getRealPath("/");
	}

	public String getSelectedFileAttachmentName() {
		return selectedFileAttachmentName;
	}

	public void setSelectedFileAttachmentName(String selectedFileAttachmentName) {
		this.selectedFileAttachmentName = selectedFileAttachmentName;
	}

	public Long getSelectedItemId() {
		return selectedItemId;
	}

	public void setSelectedItemId(Long selectedItemId) {
		this.selectedItemId = selectedItemId;
	}
	
	@Override
	public String execute() throws Exception {
		getSession().removeAttribute(IConstants.UPLOADED_EVENTS_FILES_SESSION_ATTRIBUTE_NAME);
		return SUCCESS;
	}
	
}