package com.saasforedu.irro.article.service;

import java.io.File;
import java.util.List;

import com.saasforedu.irro.article.bean.MenuAttachmentBean;

public interface IMenuAttachmentService {
	
	public void createAttachments(Long menuId, Long parentMenuId, 
			List<File> sourceFiles, 
			List<String> fileNames,
			List<String> uploadContentTypes,
		    List<String> externalUrl, String serverPath);
	public List<MenuAttachmentBean> findAll(Long menuId, Long parentMenuId);
	public void deleteMenuAttachments(List<Long> itemIdsToDelete, Long menuId, Long parentMenuId, String serverPath);
	public void changeActivation(List<Long> menuAttachmentIds, boolean activate);
	public List<MenuAttachmentBean> getImages(Long menuId, Long parentMenuId);
	public List<MenuAttachmentBean> getVideos(Long menuId, Long parentMenuId);
	public List<MenuAttachmentBean> getOtherDocs(Long menuId, Long parentMenuId);
}
