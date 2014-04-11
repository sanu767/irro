package com.saasforedu.irro.article.service;

import java.io.File;
import java.util.List;

import com.saasforedu.irro.article.bean.MenuAttachmentBean;

public interface IMenuAttachmentService {
	
	public void createAttachments(String menuName, String parentMenuName, 
			List<File> sourceFiles, 
			List<String> fileNames,
			List<String> uploadContentTypes,
		    String serverPath);
	public List<MenuAttachmentBean> findAll(String menuName, String parentMenuName);
	public void deleteMenuAttachments(List<Long> itemIdsToDelete, String menuName, String parentMenuName, String serverPath);
	public void changeActivation(List<Long> menuAttachmentIds, boolean activate);
	public List<MenuAttachmentBean> getImages(String menuName, String parentMenuName);
	public List<MenuAttachmentBean> getVideos(String menuName, String parentMenuName);
	public List<MenuAttachmentBean> getOtherDocs(String menuName, String parentMenuName);
}
