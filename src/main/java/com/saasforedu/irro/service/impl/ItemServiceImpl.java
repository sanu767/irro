package com.saasforedu.irro.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;

import com.saasforedu.irro.article.bean.ArticleBean;
import com.saasforedu.irro.article.bean.AttachmentBean;
import com.saasforedu.irro.bean.ItemBean;
import com.saasforedu.irro.dao.ItemDAO;
import com.saasforedu.irro.enums.EventType;
import com.saasforedu.irro.model.IItem;
import com.saasforedu.irro.model.IItemAttachment;
import com.saasforedu.irro.model.impl.Item;
import com.saasforedu.irro.model.impl.ItemAttachment;
import com.saasforedu.irro.service.IFileUploadService;
import com.saasforedu.irro.service.ItemService;
import com.saasforedu.irro.util.IConstants;

public class ItemServiceImpl implements ItemService {

	private ItemDAO itemDAO;
	
	private IFileUploadService fileUploadService;

	public void setItemDAO(ItemDAO itemDAO) {
		this.itemDAO = itemDAO;
	}
	
	public void setFileUploadService(IFileUploadService fileUploadService) {
		this.fileUploadService = fileUploadService;
	}

	@Override
	public Long create(ItemBean itemBean) {
		Item newItem = new Item();
		if(itemBean.isSliderSelected()) {
			uploadSliderImageInServer(itemBean);
		}
		copyProperties(itemBean, newItem);
		List<IItemAttachment> itemAttachments = getNewItemsAttachments(itemBean.getAttachmentBeans(), newItem);
		newItem.setItemAttachments(itemAttachments);
		return (Long)itemDAO.create(newItem);
	}

	@Override
	public void updateItem(ItemBean itemBean) {
		IItem item = itemDAO.findById(Item.class, itemBean.getId());
		if(itemBean.isSliderSelected()) {
			uploadSliderImageInServer(itemBean);
		}
		copyProperties(itemBean, item);
		List<IItemAttachment> removedAttchments = setAttachmentsForItemsUpdate(itemBean, item);
		itemDAO.update(item, removedAttchments);
	}

	@Override
	public void deleteItem(List<Long> itemIdsToDelete, String serverPath) {
		List<IItem> itemsToDelete = itemDAO.findAll(itemIdsToDelete);
		String fullArticlePath = getFullArticlePath(serverPath);
		
		List<IItemAttachment> itemAttachments = new ArrayList<IItemAttachment>();
		for (IItem item : itemsToDelete) {
			itemAttachments.addAll(item.getItemAttachments());
		}
		
		List<AttachmentBean> attachmentBeans = new ArrayList<AttachmentBean>();
		for (IItemAttachment itemAttachment : itemAttachments) {
			AttachmentBean fileAttachment = getFileAttachment(itemAttachment.getFileName(), 
					itemAttachment.getFileType());
			attachmentBeans.add(fileAttachment);
		}
	
		fileUploadService.deleteFiles(attachmentBeans, fullArticlePath);
		itemDAO.deleteItem(itemsToDelete);
	}
	
	@Override
	public ItemBean findItem(Long itemId) {
		IItem item = itemDAO.findById(Item.class, itemId);
		ItemBean itemBean = new ItemBean();
		convertToItemBean(item, itemBean);
		return itemBean;
	}

	@Override
	public List<ItemBean> getSliderItems(int numberOfItems) {
		List<IItem> items = itemDAO.getSliderItems(numberOfItems);
		return convertToItemBeans(items);
	}
	
	@Override
	public List<ItemBean> searchItems(String itemSearchText) {
		List<IItem> items = itemDAO.searchItems(itemSearchText);
		return convertToItemBeans(items);
	}
	
	@Override
	public List<ItemBean> searchItems(ItemBean itemBean) {
		List<IItem> searchItems = itemDAO.searchItems(itemBean);
		List<ItemBean> itemBeans = convertToItemBeans(searchItems);
		return itemBeans;
	}
	
	@Override
	public AttachmentBean doUploadItemsFile(String fileName, String contentType, File file, String serverPath)
			throws IOException {
		AttachmentBean fileArticle = getFileAttachment(fileName, contentType);
		
		String directoryPath = getFullArticlePath(serverPath);
		//Upload in Server
		fileUploadService.doFileUpload(fileArticle.getName(), file, directoryPath);
		return fileArticle;
	}

	@Override
	public void removeAttachment(AttachmentBean attachmentBean, String serverPath) {
		String fullArticlePath = getFullArticlePath(serverPath);
		fileUploadService.removeAttachment(attachmentBean, fullArticlePath);		
	}
	
	private void copyProperties(ItemBean itemBean, IItem newItem) {
		newItem.setTitle(itemBean.getTitle());
		newItem.setEndDate(itemBean.getEndDate());
		newItem.setStartDate(itemBean.getStartDate());
		newItem.setShortDescription(itemBean.getDescription());
		newItem.setShowInHomePage(itemBean.isShowInHomePage());
		newItem.setSliderImage(itemBean.getSliderImage());
		newItem.setSliderItem(itemBean.isSliderSelected());
		newItem.setUrl(itemBean.getUrl());
		newItem.setMainContent(itemBean.getContent());
	}
	
	private AttachmentBean getFileAttachment(String fileName, String contentType) {
		AttachmentBean fileArticle = new AttachmentBean();
   	 	fileArticle.setActive(true);
   	 	fileArticle.setName(fileName);
   	 	fileArticle.setType(contentType);
   	 	StringBuilder newsPath = new StringBuilder(IConstants.ITEMS_DOCUMENT_PATH);
   	 	fileArticle.setLocation(newsPath.toString());
		return fileArticle;
	}
	
	private String getFullArticlePath(String serverPath) {
		//Save the File in Server
		StringBuilder directoryPath = new StringBuilder(serverPath);
		directoryPath.append(IConstants.ITEMS_DOCUMENT_PATH);
		return directoryPath.toString();
	}
	
	private List<ItemBean> convertToItemBeans(List<IItem> items) {
		List<ItemBean> itemBeans = new ArrayList<ItemBean>();
		for(IItem item : items) {
			ItemBean itemBean = new ItemBean();
			convertToItemBean(item, itemBean);
			itemBeans.add(itemBean);
		}
		return itemBeans;
	}
	
	private void convertToItemBean(IItem item, ItemBean itemBean) {
		copyProperties(item, itemBean);
		List<IItemAttachment> itemAttachments = item.getItemAttachments();
		List<AttachmentBean> itemAttachmentBeans = new ArrayList<AttachmentBean>();
		for(IItemAttachment itemAttachment : itemAttachments) {
			AttachmentBean itemAttachmentBean = new AttachmentBean();
			copyAttachmentProperties(itemAttachment, itemAttachmentBean);
			itemAttachmentBeans.add(itemAttachmentBean);			
		}
		itemBean.setAttachmentBeans(itemAttachmentBeans);
	}
	
	private void copyProperties(IItem item, ItemBean itemBean) {
		itemBean.setEndDate(item.getEndDate());
		itemBean.setDescription(item.getShortDescription());
		itemBean.setShowInHomePage(item.isShowInHomePage());
		itemBean.setSliderImage(item.getSliderImage());
		itemBean.setSliderSelected(item.isSliderItem());
		itemBean.setUrl(item.getUrl());
		itemBean.setContent(item.getMainContent());		
		itemBean.setStartDate(item.getStartDate());
		itemBean.setTitle(item.getTitle());
		itemBean.setId(item.getId());		
		itemBean.setEventType(EventType.OTHERS);
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
	
	private List<IItemAttachment> getNewItemsAttachments(List<AttachmentBean> attachmentBeans, IItem item) {
		List<IItemAttachment> newItemAttachments = new ArrayList<IItemAttachment>();
		for (AttachmentBean attachmentBean : attachmentBeans) {
			IItemAttachment itemAttachment = new ItemAttachment();
			copyAttachmentProperties(attachmentBean, itemAttachment);
			itemAttachment.setItem(item);
			newItemAttachments.add(itemAttachment);
		}
		return newItemAttachments;
	}
	
	private void copyAttachmentProperties(AttachmentBean attachmentBean, IItemAttachment itemAttachment) {
		itemAttachment.setActive(attachmentBean.isActive());
		itemAttachment.setFileName(attachmentBean.getName());
		itemAttachment.setFileType(attachmentBean.getType());
		itemAttachment.setId(attachmentBean.getAttachmentId());
		itemAttachment.setLocation(attachmentBean.getLocation());
	}
	
	private void copyAttachmentProperties(IItemAttachment itemAttachment, AttachmentBean attachmentBean) {
		attachmentBean.setActive(itemAttachment.isActive());
		attachmentBean.setName(itemAttachment.getFileName());
		attachmentBean.setType(itemAttachment.getFileType());
		attachmentBean.setAttachmentId(itemAttachment.getId());
		attachmentBean.setLocation(itemAttachment.getLocation());
	}
	
	private List<IItemAttachment> setAttachmentsForItemsUpdate(ArticleBean newsBean, IItem item) {
		List<IItemAttachment> dbAttachments = item.getItemAttachments();
		List<AttachmentBean> newAttachmentBeans = newsBean.getAttachmentBeans();
		
		Map<Long, AttachmentBean> updatedIds = new HashMap<Long, AttachmentBean>();
		List<IItemAttachment> newAttachments = new ArrayList<IItemAttachment>();
		List<IItemAttachment> deletedAttachments = new ArrayList<IItemAttachment>();
		
		for (AttachmentBean attachmentBean : newAttachmentBeans) {
			Long attachmentId = attachmentBean.getAttachmentId();
			if(attachmentId == null ) {
				IItemAttachment itemAttachment = new ItemAttachment();
				copyAttachmentProperties(attachmentBean, itemAttachment);
				itemAttachment.setItem(item);
				newAttachments.add(itemAttachment);
			} else {
				updatedIds.put(attachmentId, attachmentBean);
			}
		}
		
		for (IItemAttachment dbAttachment : dbAttachments) {
			AttachmentBean dbAttachmentBean = updatedIds.get(dbAttachment.getId());
			if(dbAttachmentBean != null ) {
				copyAttachmentProperties(dbAttachmentBean, dbAttachment);
				dbAttachment.setItem(item);
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
		
		item.setItemAttachments(dbAttachments);
		return deletedAttachments;
	}

}
