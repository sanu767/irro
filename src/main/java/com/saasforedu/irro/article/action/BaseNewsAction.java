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

import com.saasforedu.irro.article.bean.AttachmentBean;
import com.saasforedu.irro.article.bean.MenuAttachmentBean;
import com.saasforedu.irro.article.service.IMenuAttachmentService;
import com.saasforedu.irro.article.service.INewsService;
import com.saasforedu.irro.bean.ItemBean;
import com.saasforedu.irro.model.IMenuMetadata;
import com.saasforedu.irro.util.IConstants;

public class BaseNewsAction extends MenuBaseAction implements ServletRequestAware {
	
	private static final long serialVersionUID = 161255011804368764L;
	
	private INewsService newsService;
	private IMenuAttachmentService menuAttachmentService;
	
	private HttpServletRequest httpServletRequest;
	
	/** Attributes For Articles **/
	
	private ItemBean bean = new ItemBean();
	
	private List<ItemBean> beans = new ArrayList<ItemBean>();
	
	List<MenuAttachmentBean> menuImages = new ArrayList<MenuAttachmentBean>();
	List<MenuAttachmentBean> menuVideos = new ArrayList<MenuAttachmentBean>();
	List<MenuAttachmentBean> menuOtherDocs = new ArrayList<MenuAttachmentBean>();
	
	private String selectedFileAttachmentName;
	

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
		this.beans = newsService.findNews(menuId, parentMenuId);
		loadAttachments(menuId, parentMenuId);
		return SUCCESS;
	}
	
	public String loadSelectedNews() throws Exception {
		getSession().removeAttribute(IConstants.UPLOADED_NEWS_FILES_SESSION_ATTRIBUTE_NAME);
		bean = newsService.findById(selectedItemId);
		getSession().setAttribute(IConstants.UPLOADED_NEWS_FILES_SESSION_ATTRIBUTE_NAME, bean.getAttachmentBeans());
		super.setMenuParametersForNews(bean.getReferenceArticleId());
		loadAttachments(super.menuId, super.parentMenuId);
		super.loadMenus();
		return SUCCESS;
	}
	
	public String createNews() throws Exception {
		if(!validateSlider(bean)) {
			List<AttachmentBean> uploadedFilesInSession = getUploadedFilesInSession();
			bean.setAttachmentBeans(uploadedFilesInSession);
			return ERROR;
		}
		setSliderAttributes(bean);
		bean.setUrl(getURL());
		List<AttachmentBean> uploadedFilesInSession = getUploadedFilesInSession();
		bean.setAttachmentBeans(uploadedFilesInSession);
		Long newsId = newsService.createNews(bean, menuId, parentMenuId);
		getSession().removeAttribute(IConstants.UPLOADED_NEWS_FILES_SESSION_ATTRIBUTE_NAME);
		return newsId > 0 ? SUCCESS : ERROR;
	}
	
	public String createNewsFromAdmin() throws Exception {
		if(!validateSlider(bean)) {
			List<AttachmentBean> uploadedFilesInSession = getUploadedFilesInSession();
			bean.setAttachmentBeans(uploadedFilesInSession);
			return ERROR;
		}
		setSliderAttributes(bean);
		bean.setUrl(getURL());
		List<AttachmentBean> uploadedFilesInSession = getUploadedFilesInSession();
		bean.setAttachmentBeans(uploadedFilesInSession);
		IMenuMetadata mainNewsMenuparameters = super.getMainNewsMenuparameters();
		Long newsId = newsService.createNews(bean, mainNewsMenuparameters.getId(), mainNewsMenuparameters.getParentId());
		getSession().removeAttribute(IConstants.UPLOADED_NEWS_FILES_SESSION_ATTRIBUTE_NAME);
		return newsId > 0 ? SUCCESS : ERROR;
	}
	
	public String loadCreateNewsFromAdmin() throws Exception {
		getSession().removeAttribute(IConstants.UPLOADED_NEWS_FILES_SESSION_ATTRIBUTE_NAME);
		IMenuMetadata mainNewsMenuparameters = super.getMainNewsMenuparameters();
		this.menuId  = mainNewsMenuparameters.getId();
		this.parentMenuId = mainNewsMenuparameters.getParentId();
		return SUCCESS;
	}
	
	public String loadEditNewsFromAdmin() throws Exception {
		getSession().removeAttribute(IConstants.UPLOADED_NEWS_FILES_SESSION_ATTRIBUTE_NAME);
		IMenuMetadata mainNewsMenuparameters = super.getMainNewsMenuparameters();
		this.menuId  = mainNewsMenuparameters.getId();
		this.parentMenuId = mainNewsMenuparameters.getParentId();
		return SUCCESS;
	}

	public String saveNews() throws Exception {
		if(!validateSliderForSavedNews(bean)) {
			List<AttachmentBean> uploadedFiles = getUploadedFilesInSession();
			bean.setAttachmentBeans(uploadedFiles);
			return ERROR;
		}
		
		setSliderAttributesForSavedNews(bean);
		List<AttachmentBean> uploadedFilesInSession = getUploadedFilesInSession();
		bean.setAttachmentBeans(uploadedFilesInSession);
		newsService.updateNews(bean);
		getSession().removeAttribute(IConstants.UPLOADED_NEWS_FILES_SESSION_ATTRIBUTE_NAME);
		return SUCCESS;
	}
	
	public String deleteNews()  throws Exception {
		bean.setAttachmentBeans(getUploadedFilesInSession());
		newsService.deleteNews(bean, menuId, parentMenuId, getServerPath());
		getSession().removeAttribute(IConstants.UPLOADED_NEWS_FILES_SESSION_ATTRIBUTE_NAME);
		return SUCCESS;
	}
	
    /** Methods for Creating articles **/
	
	public String doUploadNewsFile() throws Exception {
		//Upload in Server
		if(!validateUploadFiles(fileName, getServerPath() )) {
			List<AttachmentBean> uploadedFiles = getUploadedFilesInSession();
			bean.setAttachmentBeans(uploadedFiles);
			return ERROR;
		}
		
		AttachmentBean uploadedArticleFile = 
				newsService.doUploadNewsFile(fileName, contentType, menuId, parentMenuId, file, getServerPath());
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
		newsService.removeAttachment(selectedFileAttachment, getServerPath(), menuId, parentMenuId);
		removeAttachmentBean(selectedFileAttachment);
		List<AttachmentBean> files = getUploadedFilesInSession();
		bean.setAttachmentBeans(files);
		return SUCCESS;
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
	public String execute() throws Exception {
		getSession().removeAttribute(IConstants.UPLOADED_NEWS_FILES_SESSION_ATTRIBUTE_NAME);
		return SUCCESS;
	}
	
	private void loadAttachments(Long menuId, Long parentMenuId) {
		this.menuImages = menuAttachmentService.getImages(menuId, parentMenuId);
		this.menuVideos = menuAttachmentService.getVideos(menuId, parentMenuId);
		this.menuOtherDocs = menuAttachmentService.getOtherDocs(menuId, parentMenuId);
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
	
	public boolean validateSliderForSavedNews(ItemBean bean) {
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
	
	public boolean validateUploadFiles(String fileName, String serverPath) {
		if(StringUtils.isEmpty(fileName)) {
			addActionError("Please choose file to upload");
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
	
	private void setSliderAttributesForSavedNews(ItemBean bean) {
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

	public List<MenuAttachmentBean> getMenuImages() {
		return menuImages;
	}

	public void setMenuImages(List<MenuAttachmentBean> menuImages) {
		this.menuImages = menuImages;
	}

	public List<MenuAttachmentBean> getMenuVideos() {
		return menuVideos;
	}

	public void setMenuVideos(List<MenuAttachmentBean> menuVideos) {
		this.menuVideos = menuVideos;
	}

	public List<MenuAttachmentBean> getMenuOtherDocs() {
		return menuOtherDocs;
	}

	public void setMenuOtherDocs(List<MenuAttachmentBean> menuOtherDocs) {
		this.menuOtherDocs = menuOtherDocs;
	}

	public void setMenuAttachmentService(
			IMenuAttachmentService menuAttachmentService) {
		this.menuAttachmentService = menuAttachmentService;
	}
}