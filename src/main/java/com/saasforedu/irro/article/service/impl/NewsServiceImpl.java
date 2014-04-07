package com.saasforedu.irro.article.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;

import com.saasforedu.irro.article.bean.ArticleBean;
import com.saasforedu.irro.article.bean.AttachmentBean;
import com.saasforedu.irro.article.dao.INewsDAO;
import com.saasforedu.irro.article.entity.INews;
import com.saasforedu.irro.article.entity.impl.News;
import com.saasforedu.irro.article.service.INewsService;
import com.saasforedu.irro.bean.ItemBean;
import com.saasforedu.irro.enums.EventType;
import com.saasforedu.irro.model.IMenuMetadata;
import com.saasforedu.irro.model.INewsAttachment;
import com.saasforedu.irro.model.impl.NewsAttachment;
import com.saasforedu.irro.service.IFileUploadService;
import com.saasforedu.irro.service.MenuMetadataService;
import com.saasforedu.irro.util.IConstants;

public class NewsServiceImpl implements INewsService {

	private INewsDAO newsDAO;
	private MenuMetadataService menuMetadataService;
	private IFileUploadService fileUploadService;

	public void setNewsDAO(INewsDAO newsDAO) {
		this.newsDAO = newsDAO;
	}

	public void setMenuMetadataService(MenuMetadataService menuMetadataService) {
		this.menuMetadataService = menuMetadataService;
	}
	
	public void setFileUploadService(IFileUploadService fileUploadService) {
		this.fileUploadService = fileUploadService;
	}
	
	@Override
	public List<ItemBean> getNewssForHomePage() {
		List<INews> items = newsDAO.getNewssForHomePage(5);
		return convertToItemBeans(items);
	}
	
	@Override
	public List<ItemBean> getNewssForSlider(final int numberOfItems) {
		List<INews> items = newsDAO.getNewssForSlider(5);
		return convertToItemBeans(items);
	}

	@Override
	public List<ItemBean> findNews(String menuName, String parentMenuName) {
		Long referenceArticleId = getReferenceArticleId(menuName, parentMenuName);
		List<INews> news = newsDAO.findByRefereceArticleId(referenceArticleId);
		List<ItemBean> itemBeans = convertToItemBeans(news);
		return itemBeans;
	}

	@Override
	public Long createNews(ItemBean newsBean, String menuName, String parentName) {
		if(newsBean.isSliderSelected()) {
			uploadSliderImageInServer(newsBean);
		}
		Long referenceArticleId = getReferenceArticleId(menuName, parentName);
		INews newNews = new News();
		copyProperties(newsBean, newNews);
		newNews.setReferenceArticleId(referenceArticleId);
		List<INewsAttachment> newNewsAttachments = getNewNewsAttachments(newsBean.getAttachmentBeans(), newNews);
		newNews.setNewsAttachments(newNewsAttachments);
		Long newsId =  (Long)newsDAO.create((News)newNews);
		return newsId;
	}

	@Override
	public void updateNews(ItemBean newsBean) {
		INews news = newsDAO.findById(News.class, newsBean.getId());
		if(newsBean.isSliderSelected()) {
			uploadSliderImageInServer(newsBean);
		}
		copyProperties(newsBean, news);
		List<INewsAttachment> deletedAttachments = setAttachmentsForNewsUpdate(newsBean, news);
		newsDAO.update(news, deletedAttachments);
	}

	@Override
	public void deleteNews(ItemBean newsBean, String menuName, String parentMenuName, String serverPath) {
		INews news =  newsDAO.findById(News.class, newsBean.getId());
		IMenuMetadata menuMetadata = getMenuMetadata(menuName, parentMenuName);
		String fullArticlePath = getFullArticlePath(serverPath, menuMetadata.getDocumentLocation());
		fileUploadService.deleteFiles(newsBean.getAttachmentBeans(), fullArticlePath);
		newsDAO.deleteNews(news);
	}
	
	@Override
	public void removeAttachment(AttachmentBean attachmentBean, String serverPath, String menuName, String parentMenuName) {
		IMenuMetadata menuMetadata = getMenuMetadata(menuName, parentMenuName);
		String fullArticlePath = getFullArticlePath(serverPath, menuMetadata.getDocumentLocation());
		fileUploadService.removeAttachment(attachmentBean, fullArticlePath);
	}
	
	@Override
	public ItemBean findById(Long newsId) {
		INews news = newsDAO.findById(News.class, newsId);
		ItemBean newsBean = new ItemBean();
		convertToItemBean(news, newsBean);
		return newsBean;
	}
	
	@Override
	public AttachmentBean doUploadNewsFile(String fileName, String contentType, String menuName, String parentMenuName, 
			File file, String serverPath) throws IOException {
		
		IMenuMetadata menuMetadata = getMenuMetadata(menuName, parentMenuName);
		
		String documentLocation = menuMetadata.getDocumentLocation();
		AttachmentBean fileArticle = getFileAttachment(fileName, contentType, documentLocation);
		
		String directoryPath = getFullArticlePath(serverPath, documentLocation);
		//Upload in Server
		fileUploadService.doFileUpload(fileArticle.getName(), file, directoryPath);
		return fileArticle;
	}
	
	private List<INewsAttachment> setAttachmentsForNewsUpdate(ArticleBean newsBean, INews news) {
		List<INewsAttachment> dbAttachments = news.getNewsAttachments();
		List<AttachmentBean> newAttachmentBeans = newsBean.getAttachmentBeans();
		
		Map<Long, AttachmentBean> updatedIds = new HashMap<Long, AttachmentBean>();
		List<INewsAttachment> newAttachments = new ArrayList<INewsAttachment>();
		List<INewsAttachment> deletedAttachments = new ArrayList<INewsAttachment>();
		
		for (AttachmentBean attachmentBean : newAttachmentBeans) {
			Long attachmentId = attachmentBean.getAttachmentId();
			if(attachmentId == null ) {
				INewsAttachment newsAttachment = new NewsAttachment();
				copyAttachmentProperties(attachmentBean, newsAttachment);
				newsAttachment.setNews(news);
				newAttachments.add(newsAttachment);
			} else {
				updatedIds.put(attachmentId, attachmentBean);
			}
		}
		
		for (INewsAttachment dbAttachment : dbAttachments) {
			AttachmentBean dbAttachmentBean = updatedIds.get(dbAttachment.getId());
			if(dbAttachmentBean != null ) {
				copyAttachmentProperties(dbAttachmentBean, dbAttachment);
				dbAttachment.setNews(news);
			} else {
				deletedAttachments.add(dbAttachment);
			}
		}
		
		if(CollectionUtils.isNotEmpty(deletedAttachments)) {
			dbAttachments.removeAll(deletedAttachments);
		}
		
		if(CollectionUtils.isNotEmpty(newAttachments)) {
			dbAttachments.addAll(newAttachments);
		}
		
		news.setNewsAttachments(dbAttachments);
		return deletedAttachments;
	}
	
	private void copyAttachmentProperties(INewsAttachment newsAttachment, AttachmentBean attachmentBean) {
		attachmentBean.setActive(newsAttachment.isActive());
		attachmentBean.setName(newsAttachment.getFileName());
		attachmentBean.setType(newsAttachment.getFileType());
		attachmentBean.setAttachmentId(newsAttachment.getId());
		attachmentBean.setLocation(newsAttachment.getLocation());
	}
	
	private void copyAttachmentProperties(AttachmentBean attachmentBean, INewsAttachment newsAttachment) {
		newsAttachment.setActive(attachmentBean.isActive());
		newsAttachment.setFileName(attachmentBean.getName());
		newsAttachment.setFileType(attachmentBean.getType());
		newsAttachment.setId(attachmentBean.getAttachmentId());
		newsAttachment.setLocation(attachmentBean.getLocation());
	}
	
	private String getFullArticlePath(String serverPath,
			String documentLocation) {
		//Save the File in Server
		StringBuilder directoryPath = new StringBuilder(serverPath);
		directoryPath.append(IConstants.NEWS_DOCUMENT_PATH);
		directoryPath.append(documentLocation);
		return directoryPath.toString();
	}
	
	private void uploadSliderImageInServer(ItemBean newsBean) {
		String sliderImage = newsBean.getSliderImage();
		File sliderFile = newsBean.getSliderFile();
		String sliderPath = newsBean.getSliderPath();
		try {
			fileUploadService.doFileUpload(sliderImage, sliderFile, sliderPath);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private AttachmentBean getFileAttachment(String fileName, String contentType, String location) {
		AttachmentBean fileArticle = new AttachmentBean();
   	 	fileArticle.setActive(true);
   	 	fileArticle.setName(fileName);
   	 	fileArticle.setType(contentType);
   	 	StringBuilder newsPath = new StringBuilder(IConstants.NEWS_DOCUMENT_PATH);
   	 	newsPath.append(location);
   	 	fileArticle.setLocation(newsPath.toString());
		return fileArticle;
	}

	private IMenuMetadata getMenuMetadata(String menuName, String parentMenuName) {
		IMenuMetadata menuMetadata = menuMetadataService.getMenuMetadata(menuName, parentMenuName);
		return menuMetadata;
	}
	
	private Long getReferenceArticleId(String menuName, String parentMenuName) {
		IMenuMetadata menuMetadata = getMenuMetadata(menuName, parentMenuName);
		if(menuMetadata == null) {
			return 0L;
		}
		return menuMetadata.getReferenceArticleId();
	}
	
	private List<INewsAttachment> getNewNewsAttachments(List<AttachmentBean> attachmentBeans, INews news) {
		List<INewsAttachment> newNewsAttachments = new ArrayList<INewsAttachment>();
		for (AttachmentBean attachmentBean : attachmentBeans) {
			INewsAttachment newsAttachment = new NewsAttachment();
			copyAttachmentProperties(attachmentBean, newsAttachment);
			newsAttachment.setNews(news);
			newNewsAttachments.add(newsAttachment);
		}
		return newNewsAttachments;
	}
	
	private void copyProperties(ItemBean itemBean, INews newItem) {
		newItem.setEndDate(itemBean.getEndDate());
		newItem.setMainContent(itemBean.getContent());
		newItem.setShortDescription(itemBean.getDescription());
		newItem.setShowInHomePage(itemBean.isShowInHomePage());
		newItem.setSliderImage(itemBean.getSliderImage());
		newItem.setSliderItem(itemBean.isSliderSelected());
		newItem.setStartDate(itemBean.getStartDate());
		newItem.setTitle(itemBean.getTitle());
	}
	
	private List<ItemBean> convertToItemBeans(List<INews> news) {
		List<ItemBean> itemBeans = new ArrayList<ItemBean>();
		for(INews eachNews : news) {
			ItemBean newsBean = new ItemBean();
			convertToItemBean(eachNews, newsBean);
			itemBeans.add(newsBean);
		}
		return itemBeans;
	}
	
	private void convertToItemBean(INews news, ItemBean newsBean) {
		copyProperties(news, newsBean);
		List<INewsAttachment> newsAttachments = news.getNewsAttachments();
		List<AttachmentBean> newsAttachmentBeans = new ArrayList<AttachmentBean>();
		for(INewsAttachment newsAttachment : newsAttachments) {
			AttachmentBean newsAttachmentBean = new AttachmentBean();
			copyAttachmentProperties(newsAttachment, newsAttachmentBean);
			newsAttachmentBeans.add(newsAttachmentBean);			
		}
		newsBean.setAttachmentBeans(newsAttachmentBeans);
	}
	
	private void copyProperties(INews item, ItemBean itemBean) {
		itemBean.setEndDate(item.getEndDate());
		itemBean.setContent(item.getMainContent());
		itemBean.setDescription(item.getShortDescription());
		itemBean.setShowInHomePage(item.isShowInHomePage());
		itemBean.setSliderImage(item.getSliderImage());
		itemBean.setSliderSelected(item.isSliderItem());
		itemBean.setStartDate(item.getStartDate());
		itemBean.setTitle(item.getTitle());
		itemBean.setId(item.getId());
		itemBean.setEventType(EventType.NEWS);
	}

	@Override
	public List<ItemBean> searchItems(String itemSearchText) {
		List<INews> items = newsDAO.searchItems(itemSearchText);
		return convertToItemBeans(items);
	}

	@Override
	public List<ItemBean> searchItems(ItemBean itemBean) {
		List<INews> items = newsDAO.searchItems(itemBean);
		return convertToItemBeans(items);
	}

	@Override
	public void deleteItem(List<Long> itemIdsToDelete, String serverPath) {
		List<INews> itemsToDelete = newsDAO.findAll(itemIdsToDelete);
		
		Map<String, List<AttachmentBean>> newsFileMap = new HashMap<String, List<AttachmentBean>>();
		
		List<INewsAttachment> itemAttachments = new ArrayList<INewsAttachment>();
		for (INews item : itemsToDelete) {
			itemAttachments.addAll(item.getNewsAttachments());
		}
		
		for (INewsAttachment itemAttachment : itemAttachments) {
			AttachmentBean fileAttachment = getFileAttachment(itemAttachment.getFileName(), 
					itemAttachment.getFileType(), itemAttachment.getLocation());
			String location = fileAttachment.getLocation();
			if(newsFileMap.containsKey(location)) {
				List<AttachmentBean> list = newsFileMap.get(location);
				list.add(fileAttachment);
			} else {
				List<AttachmentBean> newList = new ArrayList<AttachmentBean>();
				newList.add(fileAttachment);
				newsFileMap.put(location, newList);
			}
		}
		
		for(String locationKey : newsFileMap.keySet()) {
			fileUploadService.deleteFiles(newsFileMap.get(locationKey), getFullArticlePath(serverPath,locationKey));
		}
		
		newsDAO.deleteAllNews(itemsToDelete);
	}
	
	
}
