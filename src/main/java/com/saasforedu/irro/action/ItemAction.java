package com.saasforedu.irro.action;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.ListIterator;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.saasforedu.irro.article.action.MenuBaseAction;
import com.saasforedu.irro.article.bean.AttachmentBean;
import com.saasforedu.irro.bean.ItemBean;
import com.saasforedu.irro.service.ItemService;
import com.saasforedu.irro.util.IConstants;

public class ItemAction extends MenuBaseAction implements ServletRequestAware {
	
	private static final long serialVersionUID = -6994364128717519786L;

	private ItemService itemService;
	
	HttpServletRequest httpServletRequest;

	private ItemBean bean = new ItemBean();
	
	private Long [] deletedItemIds;
	
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
	
	@Override
	public void setServletRequest(HttpServletRequest httpServletRequest) {
		this.httpServletRequest = httpServletRequest;
	}
	
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}

	public Long[] getDeletedItemIds() {
		return deletedItemIds;
	}

	public void setDeletedItemIds(Long[] deletedItemIds) {
		this.deletedItemIds = deletedItemIds;
	}

	public ItemBean getBean() {
		return bean;
	}

	public void setBean(ItemBean bean) {
		this.bean = bean;
	}

	public String createItem() throws Exception {
		if(!validateSlider(bean)) {
			List<AttachmentBean> uploadedFilesInSession = getUploadedFilesInSession();
			bean.setAttachmentBeans(uploadedFilesInSession);
			return ERROR;
		}
		
		setSliderAttributes(bean);	 	
		List<AttachmentBean> uploadedFilesInSession = getUploadedFilesInSession();
		bean.setAttachmentBeans(uploadedFilesInSession);
		Long newItemId = itemService.create(bean);
		getSession().removeAttribute(IConstants.UPLOADED_ITEMS_FILES_SESSION_ATTRIBUTE_NAME);
		return newItemId > 0 ? SUCCESS : ERROR;
	}
	
	public String loadItem() {
		super.loadTopMenu();
		getSession().removeAttribute(IConstants.UPLOADED_ITEMS_FILES_SESSION_ATTRIBUTE_NAME);
		ItemBean bean = 
				itemService.findItem(selectedItemId);
		getSession().setAttribute(IConstants.UPLOADED_ITEMS_FILES_SESSION_ATTRIBUTE_NAME, bean.getAttachmentBeans());
		this.bean = bean;
		return SUCCESS;
	}
	
	public String modifyItem() throws Exception {
		if(!validateSliderForSavedItem(bean)) {
			List<AttachmentBean> uploadedFiles = getUploadedFilesInSession();
			bean.setAttachmentBeans(uploadedFiles);
			return ERROR;
		}
		setSliderAttributesForSavedItem(bean);
		List<AttachmentBean> uploadedFilesInSession = getUploadedFilesInSession();
		bean.setAttachmentBeans(uploadedFilesInSession);
		itemService.updateItem(bean);
		getSession().removeAttribute(IConstants.UPLOADED_ITEMS_FILES_SESSION_ATTRIBUTE_NAME);
		return SUCCESS;
	}
	
	public String deleteItem() throws Exception {
		bean.setAttachmentBeans(getUploadedFilesInSession());
		List<Long> asList = Arrays.asList(this.deletedItemIds);
		itemService.deleteItem(asList, getServerPath());
		getSession().removeAttribute(IConstants.UPLOADED_ITEMS_FILES_SESSION_ATTRIBUTE_NAME);
		return SUCCESS;
	}
	
	public String doUploadItemFile() throws Exception {
		if(!validateUploadFiles(fileName)) {
			return ERROR;
		}
   	 	AttachmentBean attachmentBean = 
   	 			itemService.doUploadItemsFile(this.fileName, this.contentType, this.file, getServerPath());
   	 	List<AttachmentBean> uploadedFilesInSession = getUploadedFilesInSession();
   	    uploadedFilesInSession.add(attachmentBean);
		bean.setAttachmentBeans(uploadedFilesInSession);
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
		itemService.removeAttachment(selectedFileAttachment, getServerPath());
		removeAttachmentBean(selectedFileAttachment);
		List<AttachmentBean> files = getUploadedFilesInSession();
		bean.setAttachmentBeans(files);
		return SUCCESS;
	}
	
	public boolean validateSliderForSavedItem(ItemBean bean) {
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
	
	private void setSliderAttributesForSavedItem(ItemBean bean) {
		if(bean.isSliderSelected() && this.sliderFileName != null && sliderFile != null) {
			bean.setSliderImage(this.sliderFileName);
			bean.setSliderFile(sliderFile);
			bean.setSliderPath(getSliderPath());
		}
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
	
	@SuppressWarnings("unchecked")
	private List<AttachmentBean> getUploadedFilesInSession() {
		HttpSession session = getSession();
		List<AttachmentBean> uploadedFiles = (List<AttachmentBean>)session.getAttribute(IConstants.UPLOADED_ITEMS_FILES_SESSION_ATTRIBUTE_NAME);
		if(uploadedFiles == null || uploadedFiles.isEmpty()) {
			session.setAttribute(IConstants.UPLOADED_ITEMS_FILES_SESSION_ATTRIBUTE_NAME, new ArrayList<AttachmentBean>());
		}
		return (List<AttachmentBean>)session.getAttribute(IConstants.UPLOADED_ITEMS_FILES_SESSION_ATTRIBUTE_NAME);
	}
	
	private HttpSession getSession() {
		HttpSession session = httpServletRequest.getSession();
		return session;
	}
	
	@SuppressWarnings("deprecation")
	private String getServerPath() {
		return httpServletRequest.getRealPath("/");
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
	
	private void setSliderAttributes(ItemBean bean) {
		if(bean.isSliderSelected()) {
			bean.setSliderImage(this.sliderFileName);
			bean.setSliderFile(sliderFile);
			bean.setSliderPath(getSliderPath());
		}
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
		super.loadTopMenu();
		getSession().removeAttribute(IConstants.UPLOADED_ITEMS_FILES_SESSION_ATTRIBUTE_NAME);
		return SUCCESS;
	}
	
}
