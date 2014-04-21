package com.saasforedu.irro.article.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.saasforedu.irro.article.bean.ArticleBean;
import com.saasforedu.irro.article.bean.AttachmentBean;
import com.saasforedu.irro.article.bean.MenuAttachmentBean;
import com.saasforedu.irro.article.service.IArticleService;
import com.saasforedu.irro.article.service.IMenuAttachmentService;
import com.saasforedu.irro.util.IConstants;

public class ArticleAction extends MenuBaseAction implements ServletRequestAware {

	private static final long serialVersionUID = 2950862007911909772L;
	
	/** Service Injection **/
	
	private IArticleService articleService;
	private IMenuAttachmentService menuAttachmentService;
	
	private HttpServletRequest httpServletRequest;
	
	
	/** Attributes For Articles **/
	
	private ArticleBean bean = new ArticleBean();
	
	private List<ArticleBean> beans = new ArrayList<ArticleBean>();
	
	List<MenuAttachmentBean> menuImages = new ArrayList<MenuAttachmentBean>();
	List<MenuAttachmentBean> menuVideos = new ArrayList<MenuAttachmentBean>();
	List<MenuAttachmentBean> menuOtherDocs = new ArrayList<MenuAttachmentBean>();
	
	String type;
	Long id;
	
	private String selectedFileAttachmentName;
	
	/** Attachment Uploading relates to Articles **/
	
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

	public String loadArticles() {
		super.loadMenus();
		this.beans = articleService.findArticles(menuId, parentMenuId);
		loadAttachments(menuId, parentMenuId);
		return SUCCESS;
	}
	
	public String loadArticlesByName() {
		setMenuParametersFromMenuName();
		super.loadNonTreeMenus();
		this.beans = articleService.findArticles(menuId, parentMenuId);
		loadAttachments(menuId, parentMenuId);
		return SUCCESS;
	}

	public String loadSelectedArticle() throws Exception {
		super.loadMenus();
		getSession().removeAttribute(IConstants.UPLOADED_ARTICLE_FILES_SESSION_ATTRIBUTE_NAME);
		bean = articleService.findById(id);
		getSession().setAttribute(IConstants.UPLOADED_ARTICLE_FILES_SESSION_ATTRIBUTE_NAME, bean.getAttachmentBeans());
		loadAttachments(menuId, parentMenuId);
		return SUCCESS;
	}
	
	public String createArticle() throws Exception {
		super.loadMenus();
		//Create Article in DB
		List<AttachmentBean> uploadedFilesInSession = getUploadedFilesInSession();
		bean.setAttachmentBeans(uploadedFilesInSession);
		Long articleId = articleService.createArticle(bean, menuId, parentMenuId);
		getSession().removeAttribute(IConstants.UPLOADED_ARTICLE_FILES_SESSION_ATTRIBUTE_NAME);
		return articleId > 0 ? SUCCESS : ERROR;
	}
	
	public String saveArticle() throws Exception {
		super.loadMenus();
		List<AttachmentBean> uploadedFilesInSession = getUploadedFilesInSession();
		bean.setAttachmentBeans(uploadedFilesInSession);
		articleService.updateArticle(bean);
		getSession().removeAttribute(IConstants.UPLOADED_ARTICLE_FILES_SESSION_ATTRIBUTE_NAME);
		return SUCCESS;
	}
	
	public String deleteArticle()  throws Exception {
		super.loadMenus();
		bean = articleService.findById(id);
		articleService.deleteArticle(bean, menuId, parentMenuId, getServerPath());
		getSession().removeAttribute(IConstants.UPLOADED_ARTICLE_FILES_SESSION_ATTRIBUTE_NAME);
		return SUCCESS;
	}
	
	/** Methods for Creating articles **/	
	public String doUploadArticleFile() throws Exception {
		super.loadMenus();
		//Upload in Server
		if(!validateUploadFiles(fileName, getServerPath() )) {
			List<AttachmentBean> uploadedFiles = getUploadedFilesInSession();
			bean.setAttachmentBeans(uploadedFiles);
			return ERROR;
		}
		AttachmentBean uploadedArticleFile = 
				articleService.doUploadArticleFile(fileName, contentType, menuId, parentMenuId, file, getServerPath());
		List<AttachmentBean> uploadedFiles = getUploadedFilesInSession();
		uploadedFiles.add(uploadedArticleFile);
		bean.setAttachmentBeans(uploadedFiles);
		return SUCCESS;
	}

	public String activateAttachment() throws Exception {
		super.loadMenus();
		AttachmentBean selectedAttachment = getSelectedAttachmentBean(selectedFileAttachmentName);
		selectedAttachment.setActive(true);
		replaceAttachmentBean(selectedAttachment);
		List<AttachmentBean> uploadedFiles = getUploadedFilesInSession();
		bean.setAttachmentBeans(uploadedFiles);
		return SUCCESS;
	}
	
	public String deActivateAttachment() throws Exception  {
		super.loadMenus();
		AttachmentBean selectedAttachment = getSelectedAttachmentBean(selectedFileAttachmentName);
		selectedAttachment.setActive(false);
		replaceAttachmentBean(selectedAttachment);
		List<AttachmentBean> uploadedFiles = getUploadedFilesInSession();
		bean.setAttachmentBeans(uploadedFiles);
		return SUCCESS;
	}
	
	public String removeAttachment() throws Exception  {
		super.loadMenus();
		AttachmentBean selectedAttachment = getSelectedAttachmentBean(selectedFileAttachmentName);
		articleService.removeAttachment(selectedAttachment, getServerPath(), menuId, parentMenuId);
		removeAttachmentBean(selectedAttachment);
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
	
	public boolean validateUploadFiles(String fileName, String serverPath) {
		if(StringUtils.isEmpty(fileName)) {
			addActionError("Please choose file to upload");
			return false;
		}
		//TODO Check this file already exists
		return true;
	}
	
	private void loadAttachments(Long menuId, Long parentMenuId) {
		this.menuImages = menuAttachmentService.getImages(menuId, parentMenuId);
		this.menuVideos = menuAttachmentService.getVideos(menuId, parentMenuId);
		this.menuOtherDocs = menuAttachmentService.getOtherDocs(menuId, parentMenuId);
	}
	
	@SuppressWarnings("unchecked")
	private List<AttachmentBean> getUploadedFilesInSession() {
		HttpSession session = getSession();
		List<AttachmentBean> uploadedFiles = (List<AttachmentBean>)session.getAttribute(IConstants.UPLOADED_ARTICLE_FILES_SESSION_ATTRIBUTE_NAME);
		if(uploadedFiles == null || uploadedFiles.isEmpty()) {
			session.setAttribute(IConstants.UPLOADED_ARTICLE_FILES_SESSION_ATTRIBUTE_NAME, new ArrayList<AttachmentBean>());
		}
		return (List<AttachmentBean>)session.getAttribute(IConstants.UPLOADED_ARTICLE_FILES_SESSION_ATTRIBUTE_NAME);
	}
	
	private HttpSession getSession() {
		HttpSession session = httpServletRequest.getSession();
		return session;
	}
	
	@SuppressWarnings("deprecation")
	private String getServerPath() {
		return httpServletRequest.getRealPath("/");
	}

	public ArticleBean getBean() {
		return bean;
	}
	
	public void setBean(ArticleBean bean) {
		this.bean = bean;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<ArticleBean> getBeans() {
		return beans;
	}

	public void setBeans(List<ArticleBean> beans) {
		this.beans = beans;
	}

	@Override
	public String execute() throws Exception {
		super.loadMenus();
		getSession().removeAttribute(IConstants.UPLOADED_ARTICLE_FILES_SESSION_ATTRIBUTE_NAME);
		return SUCCESS;
	}

	public String getSelectedFileAttachmentName() {
		return selectedFileAttachmentName;
	}

	public void setSelectedFileAttachmentName(String selectedFileAttachmentName) {
		this.selectedFileAttachmentName = selectedFileAttachmentName;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest httpServletRequest) {
		this.httpServletRequest = httpServletRequest;
	}
	
	public void setArticleService(IArticleService articleService) {
		this.articleService = articleService;
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
