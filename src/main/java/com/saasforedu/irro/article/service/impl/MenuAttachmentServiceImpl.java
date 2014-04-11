package com.saasforedu.irro.article.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.saasforedu.irro.article.bean.MenuAttachmentBean;
import com.saasforedu.irro.article.dao.IMenuAttachmentDAO;
import com.saasforedu.irro.article.service.IMenuAttachmentService;
import com.saasforedu.irro.model.IMenuAttachment;
import com.saasforedu.irro.model.IMenuMetadata;
import com.saasforedu.irro.model.impl.MenuAttachment;
import com.saasforedu.irro.service.IFileUploadService;
import com.saasforedu.irro.service.MenuMetadataService;
import com.saasforedu.irro.util.IConstants;
import com.saasforedu.irro.util.IrroUtils;

public class MenuAttachmentServiceImpl implements IMenuAttachmentService {
	
	private IMenuAttachmentDAO menuAttachmentDAO;
	private MenuMetadataService menuMetadataService;
	private IFileUploadService fileUploadService;
	
	@Override
	public void createAttachments(String menuName, String parentMenuName, 
			List<File> sourceFiles, 
			List<String> fileNames,
			List<String> uploadContentTypes,
		    String serverPath) {
		
		IMenuMetadata menuMetadata = menuMetadataService.getMenuMetadata(menuName, parentMenuName);
		String documentLocation = menuMetadata.getDocumentLocation();
		String directoryPath = getFullAttachmentPath(serverPath, documentLocation);
		
		if(CollectionUtils.isNotEmpty(sourceFiles))  {
			uploadFilesInServer(fileNames, sourceFiles, directoryPath);
			List<IMenuAttachment> newMenuAttachments = new ArrayList<IMenuAttachment>();
			for (int i = 0; i < sourceFiles.size(); i++) {
				IMenuAttachment newMenuAttachment = new MenuAttachment();
				newMenuAttachment.setReferenceMenuId(menuMetadata.getId());
				newMenuAttachment.setFileName(fileNames.get(i));
				newMenuAttachment.setFileType(uploadContentTypes.get(i));
				newMenuAttachment.setLocation(getAttachmentPath(documentLocation));
				newMenuAttachment.setActive(true);
				newMenuAttachment.setExternal(false);
				newMenuAttachment.setModificationDate(new Date());
				newMenuAttachments.add(newMenuAttachment);
			}
			menuAttachmentDAO.createAttachments(newMenuAttachments);
		}
	}

	@Override
	public List<MenuAttachmentBean> findAll(String menuName, String parentMenuName) {
		IMenuMetadata menuMetadata = menuMetadataService.getMenuMetadata(menuName, parentMenuName);
		List<IMenuAttachment> menuAttachments = menuAttachmentDAO.findByReferenceMenuId(menuMetadata.getId());
		List<MenuAttachmentBean> newMenuAttachments = new ArrayList<MenuAttachmentBean>();
		if(CollectionUtils.isNotEmpty(menuAttachments)) {
			for (IMenuAttachment menuAttachment : menuAttachments) {
				MenuAttachmentBean newMenuAttachment = new MenuAttachmentBean();
				copyAttachmentProperties(menuAttachment, newMenuAttachment);
				newMenuAttachments.add(newMenuAttachment);
				
			}
		}
		return newMenuAttachments;
	}
	
	@Override
	public void deleteMenuAttachments(List<Long> itemIdsToDelete, String menuName, String parentMenuName, String serverPath) {
		IMenuMetadata menuMetadata = menuMetadataService.getMenuMetadata(menuName, parentMenuName);
		String documentLocation = menuMetadata.getDocumentLocation();
		String fullPath = getFullAttachmentPath(serverPath, documentLocation);
		
		List<IMenuAttachment> removedAttachments = menuAttachmentDAO.findAll(itemIdsToDelete);
		if(CollectionUtils.isNotEmpty(removedAttachments)) {
			List<MenuAttachmentBean> removedAttachmentBeans = new ArrayList<MenuAttachmentBean>();
			for (IMenuAttachment removedAttachment : removedAttachments) {
				MenuAttachmentBean menuAttachmentBean = new MenuAttachmentBean();
				copyAttachmentProperties(removedAttachment, menuAttachmentBean);
				removedAttachmentBeans.add(menuAttachmentBean);
			}
			fileUploadService.deleteMenuAttachmentFiles(removedAttachmentBeans, fullPath);			
			menuAttachmentDAO.deleteAll(removedAttachments);
		}
	}
	
	@Override
	public List<MenuAttachmentBean> getImages(String menuName, String parentMenuName) {
		IMenuMetadata menuMetadata = menuMetadataService.getMenuMetadata(menuName, parentMenuName);
		List<IMenuAttachment> menuAttachments = menuAttachmentDAO.findByReferenceMenuId(menuMetadata.getId());
		List<MenuAttachmentBean> imageDocs = new ArrayList<MenuAttachmentBean>();
		if(CollectionUtils.isNotEmpty(menuAttachments)) {
			for (IMenuAttachment menuAttachment : menuAttachments) {
				String fileType = menuAttachment.getFileType();
				if(IrroUtils.isImage(fileType)) {
					MenuAttachmentBean imageAttachmentBean = new MenuAttachmentBean();
					copyAttachmentProperties(menuAttachment, imageAttachmentBean);
					imageDocs.add(imageAttachmentBean);
				}
			}
		}
		return imageDocs;
	}

	@Override
	public List<MenuAttachmentBean> getVideos(String menuName, String parentMenuName) {
		IMenuMetadata menuMetadata = menuMetadataService.getMenuMetadata(menuName, parentMenuName);
		List<IMenuAttachment> menuAttachments = menuAttachmentDAO.findByReferenceMenuId(menuMetadata.getId());
		List<MenuAttachmentBean> videoAttachments = new ArrayList<MenuAttachmentBean>();
		if(CollectionUtils.isNotEmpty(menuAttachments)) {
			for (IMenuAttachment menuAttachment : menuAttachments) {
				String fileType = menuAttachment.getFileType();
				if(IrroUtils.isVideo(fileType)) {
					MenuAttachmentBean videoAttachment = new MenuAttachmentBean();
					copyAttachmentProperties(menuAttachment, videoAttachment);
					videoAttachments.add(videoAttachment);
				}
			}
		}
		return videoAttachments;
	}

	@Override
	public List<MenuAttachmentBean> getOtherDocs(String menuName,
			String parentMenuName) {
		IMenuMetadata menuMetadata = menuMetadataService.getMenuMetadata(menuName, parentMenuName);
		List<IMenuAttachment> menuAttachments = menuAttachmentDAO.findByReferenceMenuId(menuMetadata.getId());
		List<MenuAttachmentBean> otherDocs = new ArrayList<MenuAttachmentBean>();
		if(CollectionUtils.isNotEmpty(menuAttachments)) {
			for (IMenuAttachment menuAttachment : menuAttachments) {
				String fileType = menuAttachment.getFileType();
				if(IrroUtils.isOtherThanVideoAndImage(fileType)) {
					MenuAttachmentBean otherDocument = new MenuAttachmentBean();
					copyAttachmentProperties(menuAttachment, otherDocument);
					otherDocs.add(otherDocument);
				}
			}
		}
		return otherDocs;
	}
	
	@Override
	public void changeActivation(List<Long> menuAttachmentIds, boolean activate) {
		menuAttachmentDAO.changeActivation(menuAttachmentIds, activate);
	}
	
	private void copyAttachmentProperties(IMenuAttachment articleAttachment, MenuAttachmentBean attachmentBean ) {
		attachmentBean.setName(articleAttachment.getFileName());
		attachmentBean.setType(articleAttachment.getFileType());
		attachmentBean.setAttachmentId(articleAttachment.getId());
		attachmentBean.setLocation(articleAttachment.getLocation());
		attachmentBean.setExternal(articleAttachment.isExternal());
		attachmentBean.setActive(articleAttachment.isActive());
	}
	
	private String getFullAttachmentPath(String serverPath, String documentLocation) {
		StringBuilder directoryPath = new StringBuilder(serverPath);
		directoryPath.append(IConstants.MENU_ATTACHMENTS);
		directoryPath.append(documentLocation);
		return directoryPath.toString();
	}
	
	private String getAttachmentPath(String documentLocation) {
		StringBuilder directoryPath = new StringBuilder();
		directoryPath.append(IConstants.MENU_ATTACHMENTS);
		directoryPath.append(documentLocation);
		return directoryPath.toString();
	}
	
	private void uploadFilesInServer(List<String> fileNames, List<File> sourceFiles, String documentLocation) {
		try {
			fileUploadService.uploadFiles(fileNames, sourceFiles, documentLocation);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void setMenuAttachmentDAO(IMenuAttachmentDAO menuAttachmentDAO) {
		this.menuAttachmentDAO = menuAttachmentDAO;
	}

	public void setMenuMetadataService(MenuMetadataService menuMetadataService) {
		this.menuMetadataService = menuMetadataService;
	}

	public void setFileUploadService(IFileUploadService fileUploadService) {
		this.fileUploadService = fileUploadService;
	}
	
}
