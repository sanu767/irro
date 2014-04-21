package com.saasforedu.irro.article.service.impl;

import java.io.File;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;

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
	public void createAttachments(Long menuId, Long parentMenuId, 
			List<File> sourceFiles, 
			List<String> fileNames,
			List<String> uploadContentTypes,
		    List<String> externalUrl, String serverPath) {
		
		IMenuMetadata menuMetadata = menuMetadataService.getMenuMetadata(menuId, parentMenuId);
		String documentLocation = menuMetadata.getDocumentLocation();
		String directoryPath = getFullAttachmentPath(serverPath, documentLocation);
		
		List<IMenuAttachment> newMenuAttachments = new ArrayList<IMenuAttachment>();
		if(CollectionUtils.isNotEmpty(sourceFiles))  {
			uploadFilesInServer(fileNames, sourceFiles, directoryPath);
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
		}
		
		if(CollectionUtils.isNotEmpty(externalUrl))  {
			for (String eachExternalUrl : externalUrl) {
				if(StringUtils.isNotBlank(eachExternalUrl)) {
					IMenuAttachment newMenuAttachment = new MenuAttachment();
					newMenuAttachment.setReferenceMenuId(menuMetadata.getId());
					newMenuAttachment.setFileName(getNameExternalURL(eachExternalUrl));
					newMenuAttachment.setFileType(getContentOfExternalURL(eachExternalUrl));
					newMenuAttachment.setLocation(eachExternalUrl);
					newMenuAttachment.setActive(true);
					newMenuAttachment.setExternal(true);
					newMenuAttachment.setModificationDate(new Date());
					newMenuAttachments.add(newMenuAttachment);
				}
			}
		}
		
		if(CollectionUtils.isNotEmpty(newMenuAttachments)) {
			menuAttachmentDAO.createAttachments(newMenuAttachments);
		}
	}
	
	@Override
	public List<MenuAttachmentBean> findAll(Long menuId, Long parentMenuId) {
		IMenuMetadata menuMetadata = menuMetadataService.getMenuMetadata(menuId, parentMenuId);
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
	public void deleteMenuAttachments(List<Long> itemIdsToDelete, Long menuId, Long parentMenuId, String serverPath) {
		IMenuMetadata menuMetadata = menuMetadataService.getMenuMetadata(menuId, parentMenuId);
		String documentLocation = menuMetadata.getDocumentLocation();
		String fullPath = getFullAttachmentPath(serverPath, documentLocation);
		
		List<IMenuAttachment> removedAttachments = menuAttachmentDAO.findAll(itemIdsToDelete);
		List<MenuAttachmentBean> removeUploadedAttachmentBeans = new ArrayList<MenuAttachmentBean>();
		
		if(CollectionUtils.isNotEmpty(removedAttachments)) {
			for (IMenuAttachment removedAttachment : removedAttachments) {
				if(!removedAttachment.isExternal()) {
					MenuAttachmentBean menuAttachmentBean = new MenuAttachmentBean();
					copyAttachmentProperties(removedAttachment, menuAttachmentBean);
					removeUploadedAttachmentBeans.add(menuAttachmentBean);
				}
			}
		}
		
		if(CollectionUtils.isNotEmpty(removeUploadedAttachmentBeans)) {
			fileUploadService.deleteMenuAttachmentFiles(removeUploadedAttachmentBeans, fullPath);
		}
		
		if(CollectionUtils.isNotEmpty(removedAttachments)) {
			menuAttachmentDAO.deleteAll(removedAttachments);
		}
	}
	
	@Override
	public List<MenuAttachmentBean> getImages(Long menuId, Long parentMenuId) {
		IMenuMetadata menuMetadata = menuMetadataService.getMenuMetadata(menuId, parentMenuId);
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
	public List<MenuAttachmentBean> getVideos(Long menuId, Long parentMenuId) {
		IMenuMetadata menuMetadata = menuMetadataService.getMenuMetadata(menuId, parentMenuId);
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
	public List<MenuAttachmentBean> getOtherDocs(Long menuId,
			Long parentMenuId) {
		IMenuMetadata menuMetadata = menuMetadataService.getMenuMetadata(menuId, parentMenuId);
		List<IMenuAttachment> menuAttachments = menuAttachmentDAO.findByReferenceMenuId(menuMetadata.getId());
		List<MenuAttachmentBean> otherDocs = new ArrayList<MenuAttachmentBean>();
		if(CollectionUtils.isNotEmpty(menuAttachments)) {
			for (IMenuAttachment menuAttachment : menuAttachments) {
				String fileType = menuAttachment.getFileType();
				if(IrroUtils.isOtherThanVideoAndImage(fileType)) {
					MenuAttachmentBean otherDocument = new MenuAttachmentBean();
					copyAttachmentProperties(menuAttachment, otherDocument);
					otherDocument.setDisplayName(IrroUtils.getDisplayNameForOtherDocs(otherDocument.getName()));
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
	
	private String getContentOfExternalURL(String externalURL) {
		try {
			//Embed URL starts from iframe
			if(StringUtils.isNotBlank(externalURL) && 
					( externalURL.contains("youtube") )
					|| ( externalURL.contains("vimeo")) 
					|| ( externalURL.contains("video.mail.ru") ) ) {
				return "video/mp4";
			} 
			
			URL url = new URL(externalURL);
			HttpURLConnection connection = (HttpURLConnection)  url.openConnection();
			connection.setRequestMethod("HEAD");
			connection.connect();
			return connection.getContentType();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "OTHER_MIME";
	}
	
	private String getNameExternalURL(String externalURL) {
		//Embed URL starts from iframe
		if(StringUtils.isNotBlank(externalURL)) {
			if(externalURL.contains("iframe")) {
				int index = externalURL.indexOf("src=");
				if(index > 0 ) {
					String substring = externalURL.substring(index+5);
					String[] split = substring.split("\"");
					return split[0];
				}

			} 
			
			if(externalURL.contains("youtube")) {
				String[] split = externalURL.split("v=");
				String youtubeVideoId = split[1];
				StringBuilder stringBuilder = new StringBuilder("http://www.youtube.com/v/");
				return stringBuilder.append(youtubeVideoId).toString();
			}
		}
		return externalURL;
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
