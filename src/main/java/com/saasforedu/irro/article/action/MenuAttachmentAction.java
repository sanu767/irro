package com.saasforedu.irro.article.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.saasforedu.irro.article.bean.MenuAttachmentBean;
import com.saasforedu.irro.article.service.IMenuAttachmentService;

public class MenuAttachmentAction extends MenuBaseAction implements ServletRequestAware {

	private static final long serialVersionUID = 2669886630825011186L;
	
	private Long [] checkedId;
	
	private HttpServletRequest httpServletRequest;
	private IMenuAttachmentService menuAttachmentService;

	private List<File> uploads = new ArrayList<File>();
	private List<String> uploadFileNames = new ArrayList<String>();
	private List<String> uploadContentTypes = new ArrayList<String>();
	private List<String> externalUrl = new ArrayList<String>();
	
	List<MenuAttachmentBean> menuImages = new ArrayList<MenuAttachmentBean>();
	List<MenuAttachmentBean> menuVideos = new ArrayList<MenuAttachmentBean>();
	List<MenuAttachmentBean> menuOtherDocs = new ArrayList<MenuAttachmentBean>();
	

	public String upload() throws Exception {
		super.loadMenus();
		String serverPath = getServerPath();
		if(CollectionUtils.isNotEmpty(uploads) || CollectionUtils.isNotEmpty(externalUrl) ) {
			menuAttachmentService.createAttachments(menuId, parentMenuId, uploads, uploadFileNames, uploadContentTypes, externalUrl, serverPath);
		}
		return SUCCESS;
	}
	
	public String removeMenuAttachments() throws Exception {
		super.loadMenus();
		if(ArrayUtils.isNotEmpty(checkedId)) {
			List<Long> deletedIds = Arrays.asList(checkedId);
			menuAttachmentService.deleteMenuAttachments(deletedIds, menuId, parentMenuId, getServerPath());
		}
		return SUCCESS;
	}
	
	public String activateMenuAttachments() throws Exception {
		super.loadMenus();
		if(ArrayUtils.isNotEmpty(checkedId)) {
			List<Long> deletedIds = Arrays.asList(checkedId);
			menuAttachmentService.changeActivation(deletedIds, true);
		}
		return SUCCESS;
	}
	
	public String deActivateMenuAttachments() throws Exception {
		super.loadMenus();
		if(ArrayUtils.isNotEmpty(checkedId)) {
			List<Long> deletedIds = Arrays.asList(checkedId);
			menuAttachmentService.changeActivation(deletedIds, false);
		}
		return SUCCESS;
	}
	
	public String loadAllAttachments() throws Exception {
		super.loadMenus();
		loadAttachments(menuId, parentMenuId);
		return SUCCESS;
	}

	public String showImages() throws Exception {
		loadAttachments(menuId, parentMenuId);
		return SUCCESS;
	}
	
	public String showVideos() throws Exception {
		loadAttachments(menuId, parentMenuId);
		super.loadMenus();
		return SUCCESS;
	}
	
	public String showOtherDocs() throws Exception {
		loadAttachments(menuId, parentMenuId);
		return SUCCESS;
	}
	
	private void loadAttachments(Long menuId, Long parentMenuId) {
		this.menuImages = menuAttachmentService.getImages(menuId, parentMenuId);
		this.menuVideos = menuAttachmentService.getVideos(menuId, parentMenuId);
		this.menuOtherDocs = menuAttachmentService.getOtherDocs(menuId, parentMenuId);
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

	public List<String> getExternalUrl() {
		return externalUrl;
	}

	public void setExternalUrl(List<String> externalUrl) {
		this.externalUrl = externalUrl;
	}
}
