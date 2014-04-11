package com.saasforedu.irro.article.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.saasforedu.irro.article.bean.MenuAttachmentBean;
import com.saasforedu.irro.article.service.IMenuAttachmentService;

public class MenuAttachmentAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = 2669886630825011186L;
	private String menuName;
	private String parentMenuName;
	
	private Long [] checkedId;
	
	private HttpServletRequest httpServletRequest;
	private IMenuAttachmentService menuAttachmentService;

	private List<File> uploads = new ArrayList<File>();
	private List<String> uploadFileNames = new ArrayList<String>();
	private List<String> uploadContentTypes = new ArrayList<String>();
	
	List<MenuAttachmentBean> menuImages = new ArrayList<MenuAttachmentBean>();
	List<MenuAttachmentBean> menuVideos = new ArrayList<MenuAttachmentBean>();
	List<MenuAttachmentBean> menuOtherDocs = new ArrayList<MenuAttachmentBean>();
	

	public String upload() throws Exception {
		String serverPath = getServerPath();
		menuAttachmentService.createAttachments(menuName, parentMenuName, uploads, uploadFileNames, uploadContentTypes, serverPath);
		return SUCCESS;
	}
	
	public String removeMenuAttachments() throws Exception {
		List<Long> deletedIds = Arrays.asList(checkedId);
		menuAttachmentService.deleteMenuAttachments(deletedIds, menuName, parentMenuName, getServerPath());
		return SUCCESS;
	}
	
	public String activateMenuAttachments() throws Exception {
		List<Long> deletedIds = Arrays.asList(checkedId);
		menuAttachmentService.changeActivation(deletedIds, true);
		return SUCCESS;
	}
	
	public String deActivateMenuAttachments() throws Exception {
		List<Long> deletedIds = Arrays.asList(checkedId);
		menuAttachmentService.changeActivation(deletedIds, false);
		return SUCCESS;
	}
	
	public String loadAllAttachments() throws Exception {
		loadAttachments(menuName, parentMenuName);
		return SUCCESS;
	}

	public String showImages() throws Exception {
		List<MenuAttachmentBean> images = menuAttachmentService.getImages(menuName, parentMenuName);
		this.menuImages = images;
		return SUCCESS;
	}
	
	public String showVideos() throws Exception {
		List<MenuAttachmentBean> videos = menuAttachmentService.getVideos(menuName, parentMenuName);
		this.menuVideos = videos;
		return SUCCESS;
	}
	
	public String showOtherDocs() throws Exception {
		List<MenuAttachmentBean> otherDocs = menuAttachmentService.getOtherDocs(menuName, parentMenuName);
		this.menuOtherDocs = otherDocs;
		return SUCCESS;
	}
	
	private void loadAttachments(String menuName, String parentMenuName) {
		this.menuImages = menuAttachmentService.getImages(menuName, parentMenuName);
		this.menuVideos = menuAttachmentService.getVideos(menuName, parentMenuName);
		this.menuOtherDocs = menuAttachmentService.getOtherDocs(menuName, parentMenuName);
	}
	
	@Override
	public void setServletRequest(HttpServletRequest httpServletRequest) {
		this.httpServletRequest = httpServletRequest;
	}
	
	public List<File> getUpload() {
		return this.uploads;
	}
	
	public void setUpload(List<File> uploads) {
		this.uploads = uploads;
	}

	public List<String> getUploadFileName() {
		return this.uploadFileNames;
	}
	
	public void setUploadFileName(List<String> uploadFileNames) {
		this.uploadFileNames = uploadFileNames;
	}

	public List<String> getUploadContentType() {
		return this.uploadContentTypes;
	}
	
	public void setUploadContentType(List<String> contentTypes) {
		this.uploadContentTypes = contentTypes;
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

	public void setMenuAttachmentService(IMenuAttachmentService menuAttachmentService) {
		this.menuAttachmentService = menuAttachmentService;
	}
	
	@SuppressWarnings("deprecation")
	private String getServerPath() {
		return httpServletRequest.getRealPath("/");
	}

	public Long[] getCheckedId() {
		return checkedId;
	}

	public void setCheckedId(Long[] checkedId) {
		this.checkedId = checkedId;
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
}
