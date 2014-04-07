package com.saasforedu.irro.article.action;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.saasforedu.irro.article.bean.AttachmentBean;
import com.saasforedu.irro.article.service.INewsService;
import com.saasforedu.irro.bean.ItemBean;
import com.saasforedu.irro.util.IConstants;

public class NewsAction extends ActionSupport implements ServletRequestAware {
	
	private static final long serialVersionUID = 161255011804368764L;
	
	private INewsService newsService;
	
	private HttpServletRequest httpServletRequest;
	
	/** Attributes For Articles **/
	
	private ItemBean bean = new ItemBean();
	
	private List<ItemBean> beans = new ArrayList<ItemBean>();
	
	private String selectedFileAttachmentName;
	
	String menuName;
	String parentMenuName;

	Long selectedItemId;
	
	/** Attachment Uploading relates to News **/
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
	
	
	/** Slider Attachment Uploading relates to news **/
	
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

	public void setNewsService(INewsService newsService) {
		this.newsService = newsService;
	}

	public ItemBean getBean() {
		return bean;
	}

	public void setBean(ItemBean bean) {
		this.bean = bean;
	}

	public List<ItemBean> getBeans() {
		return beans;
	}

	public void setBeans(List<ItemBean> beans) {
		this.beans = beans;
	}

	public String loadAllNews() {
		this.beans = newsService.findNews(menuName, parentMenuName);
		return SUCCESS;
	}
	
	public String loadSelectedNews() throws Exception {
		getSession().removeAttribute(IConstants.UPLOADED_NEWS_FILES_SESSION_ATTRIBUTE_NAME);
		bean = newsService.findById(selectedItemId);
		getSession().setAttribute(IConstants.UPLOADED_NEWS_FILES_SESSION_ATTRIBUTE_NAME, bean.getAttachmentBeans());
		return SUCCESS;
	}
	
	public String createNews() throws Exception {
		if(!validateSlider(bean)) {
			return ERROR;
		}
		
		setSliderAttributes(bean);
		List<AttachmentBean> uploadedFilesInSession = getUploadedFilesInSession();
		bean.setAttachmentBeans(uploadedFilesInSession);
		Long newsId = newsService.createNews(bean, menuName, parentMenuName);
		getSession().removeAttribute(IConstants.UPLOADED_NEWS_FILES_SESSION_ATTRIBUTE_NAME);
		return newsId > 0 ? SUCCESS : ERROR;
	}

	public String saveNews() throws Exception {
		
		if(!validateSlider(bean)) {
			return ERROR;
		}
		
		setSliderAttributes(bean);
		List<AttachmentBean> uploadedFilesInSession = getUploadedFilesInSession();
		bean.setAttachmentBeans(uploadedFilesInSession);
		newsService.updateNews(bean);
		getSession().removeAttribute(IConstants.UPLOADED_NEWS_FILES_SESSION_ATTRIBUTE_NAME);
		return SUCCESS;
	}
	
	public String deleteNews()  throws Exception {
		bean.setAttachmentBeans(getUploadedFilesInSession());
		newsService.deleteNews(bean, menuName, parentMenuName, getServerPath());
		getSession().removeAttribute(IConstants.UPLOADED_NEWS_FILES_SESSION_ATTRIBUTE_NAME);
		return SUCCESS;
	}
	
    /** Methods for Creating articles **/
	
	public String doUploadNewsFile() throws Exception {
		//Upload in Server
		if(!validateUploadFiles(fileName,menuName, parentMenuName, getServerPath() )) {
			return ERROR;
		}
		AttachmentBean uploadedArticleFile = 
				newsService.doUploadNewsFile(fileName, contentType, menuName, parentMenuName, file, getServerPath());
		List<AttachmentBean> uploadedFiles = getUploadedFilesInSession();
		uploadedFiles.add(uploadedArticleFile);
		bean.setAttachmentBeans(uploadedFiles);
		return SUCCESS;
	}
	
	public String activateAttachment() throws Exception {
		AttachmentBean selectedFileAttachment = getSelectedAttachmentBean(selectedFileAttachmentName);
		selectedFileAttachment.setActive(true);
		replaceAttachmentBean(selectedFileAttachment);
		List<AttachmentBean> uploadedFiles = getUploadedFilesInSession();
		bean.setAttachmentBeans(uploadedFiles);
		return SUCCESS;
	}
	
	public String deActivateAttachment() throws Exception  {
		AttachmentBean selectedFileAttachment = getSelectedAttachmentBean(selectedFileAttachmentName);
		selectedFileAttachment.setActive(false);
		replaceAttachmentBean(selectedFileAttachment);
		List<AttachmentBean> uploadedFiles = getUploadedFilesInSession();
		bean.setAttachmentBeans(uploadedFiles);
		return SUCCESS;
	}
	
	public String removeAttachment() throws Exception  {
		AttachmentBean selectedFileAttachment = getSelectedAttachmentBean(selectedFileAttachmentName);
		newsService.removeAttachment(selectedFileAttachment, getServerPath(), menuName, parentMenuName);
		removeAttachmentBean(selectedFileAttachment);
		List<AttachmentBean> files = getUploadedFilesInSession();
		bean.setAttachmentBeans(files);
		return SUCCESS;
	}
	
	
	@Override
	public String execute() throws Exception {
		getSession().removeAttribute(IConstants.UPLOADED_NEWS_FILES_SESSION_ATTRIBUTE_NAME);
		return SUCCESS;
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
	
	public boolean validateUploadFiles(String fileName, String menuName, String parentMenuName, String serverPath) {
		if(StringUtils.isEmpty(fileName)) {
			addActionError("Please choose file to upload");
			return false;
		}
		if(StringUtils.contains(fileName, " ")) {
			addActionError("File Name can not spaces.");
			return false;
		}
		//TODO Check this file already exists
		return true;
	}
	
	private void setSliderAttributes(ItemBean bean) {
		if(bean.isSliderSelected()) {
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
		List<AttachmentBean> uploadedFiles = (List<AttachmentBean>)session.getAttribute(IConstants.UPLOADED_NEWS_FILES_SESSION_ATTRIBUTE_NAME);
		if(uploadedFiles == null || uploadedFiles.isEmpty()) {
			session.setAttribute(IConstants.UPLOADED_NEWS_FILES_SESSION_ATTRIBUTE_NAME, new ArrayList<AttachmentBean>());
		}
		return (List<AttachmentBean>)session.getAttribute(IConstants.UPLOADED_NEWS_FILES_SESSION_ATTRIBUTE_NAME);
	}
	
	private HttpSession getSession() {
		HttpSession session = httpServletRequest.getSession();
		return session;
	}
	
	@SuppressWarnings("deprecation")
	private String getServerPath() {
		return httpServletRequest.getRealPath("/");
	}
	
	@SuppressWarnings("deprecation")
	private String getSliderPath() {
		StringBuilder sliderLocationBuilder = new StringBuilder(httpServletRequest.getRealPath("/"));
		sliderLocationBuilder.append(IConstants.SLIDER);
		return sliderLocationBuilder.toString();
	}
	
	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getParentMenuName() {
		return parentMenuName;
	}

	public void setParentMenuName(String parentMenuName) {
		this.parentMenuName = parentMenuName;
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
	
	
	
}