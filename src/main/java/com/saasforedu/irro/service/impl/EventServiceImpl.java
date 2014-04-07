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
import com.saasforedu.irro.dao.IEventDAO;
import com.saasforedu.irro.enums.EventType;
import com.saasforedu.irro.model.IEvent;
import com.saasforedu.irro.model.IEventAttachment;
import com.saasforedu.irro.model.impl.Event;
import com.saasforedu.irro.model.impl.EventAttachment;
import com.saasforedu.irro.service.EventService;
import com.saasforedu.irro.service.IFileUploadService;
import com.saasforedu.irro.util.IConstants;
import com.saasforedu.irro.xmlelements.EventElement;

public class EventServiceImpl implements EventService {

	private IEventDAO eventDAO;
	private IFileUploadService fileUploadService;
	
	public void setEventDAO(IEventDAO eventDAO) {
		this.eventDAO = eventDAO;
	}
	
	public void setFileUploadService(IFileUploadService fileUploadService) {
		this.fileUploadService = fileUploadService;
	}

	@Override
	public void create(List<EventElement> elements) {
		List<IEvent> events = new ArrayList<IEvent>(elements.size());
		for (EventElement element : elements) {
			Event event = new Event();
			copyProperties(element, event);
			events.add(event);
		}
		eventDAO.saveAll(events);
	}

	@Override
	public List<Event> getEventsForPeriod(int numberOfMonths) {
		return eventDAO.findEventsForPeriod(6);
	}	
	
	@Override
	public Long create(ItemBean eventBean) {
		IEvent newEvent = new Event();
		if(eventBean.isSliderSelected()) {
			uploadSliderImageInServer(eventBean);
		}
		copyProperties(eventBean, newEvent);
		List<IEventAttachment> eventAttachments = getNewEventsAttachments(eventBean.getAttachmentBeans(), newEvent);
		newEvent.setEventAttachments(eventAttachments);
		return (Long)eventDAO.create((Event)newEvent);
	}

	@Override
	public void updateItem(ItemBean eventBean) {
		IEvent event = eventDAO.findById(Event.class, eventBean.getId());
		if(eventBean.isSliderSelected()) {
			uploadSliderImageInServer(eventBean);
		}
		copyProperties(eventBean, event);
		List<IEventAttachment> removedAttachments = setAttachmentsForEventsUpdate(eventBean, event);
		eventDAO.update(event, removedAttachments);
	}

	@Override
	public void deleteItem(List<Long> itemIdsToDelete, String serverPath) {
		
		List<IEvent> itemsToDelete = eventDAO.findAll(itemIdsToDelete);
		String fullArticlePath = getFullArticlePath(serverPath);
		
		List<IEventAttachment> eventAttachments = new ArrayList<IEventAttachment>();
		for (IEvent event : itemsToDelete) {
			eventAttachments.addAll(event.getEventAttachments());
		}
		
		List<AttachmentBean> attachmentBeans = new ArrayList<AttachmentBean>();
		for (IEventAttachment eventAttachment : eventAttachments) {
			AttachmentBean fileAttachment = getFileAttachment(eventAttachment.getFileName(), eventAttachment.getFileType());
			attachmentBeans.add(fileAttachment);
		}
	
		fileUploadService.deleteFiles(attachmentBeans, fullArticlePath);
		eventDAO.deleteItem(itemsToDelete);
	}
	
	@Override
	public ItemBean findEvent(Long itemId) {
		IEvent event = eventDAO.findById(Event.class, itemId);
		ItemBean eventBean = new ItemBean();
		convertToItemBean(event, eventBean);
		return eventBean;
	}
	
	@Override
	public List<ItemBean> getEventsForHomePage() {
		List<IEvent> items = eventDAO.getEventsForHomePage(5);
		return convertToItemBeans(items);
	}
	
	@Override
	public List<ItemBean> getEventsForSlider(int numberOfItems) {
		List<IEvent> items = eventDAO.getEventsForSlider(5);
		return convertToItemBeans(items);
	}
	
	@Override
	public List<ItemBean> searchItems(String itemSearchText) {
		List<IEvent> items = eventDAO.searchItems(itemSearchText);
		return convertToItemBeans(items);
	}
	
	@Override
	public List<ItemBean> searchItems(ItemBean itemBean) {
		List<IEvent> searchItems = eventDAO.searchItems(itemBean);
		List<ItemBean> itemBeans = convertToItemBeans(searchItems);
		return itemBeans;
	}
	
	@Override
	public AttachmentBean doUploadEventsFile(String fileName, String contentType, File file, String serverPath)
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
	
	private void copyProperties(ItemBean itemBean, IEvent newEvent) {
		newEvent.setEndDate(itemBean.getEndDate());
		newEvent.setMainContent(itemBean.getContent());
		newEvent.setShortDescription(itemBean.getDescription());
		newEvent.setShowInHomePage(itemBean.isShowInHomePage());
		newEvent.setSliderImage(itemBean.getSliderImage());
		newEvent.setSliderItem(itemBean.isSliderSelected());
		newEvent.setStartDate(itemBean.getStartDate());
		newEvent.setTitle(itemBean.getTitle());
		newEvent.setUrl(itemBean.getUrl());
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
	
	private List<ItemBean> convertToItemBeans(List<IEvent> items) {
		List<ItemBean> itemBeans = new ArrayList<ItemBean>();
		for(IEvent item : items) {
			ItemBean itemBean = new ItemBean();
			convertToItemBean(item, itemBean);
			itemBeans.add(itemBean);
		}
		return itemBeans;
	}
	
	private void convertToItemBean(IEvent event, ItemBean eventBean) {
		copyProperties(event, eventBean);
		List<IEventAttachment> eventAttachments = event.getEventAttachments();
		List<AttachmentBean> eventAttachmentBeans = new ArrayList<AttachmentBean>();
		for(IEventAttachment eventAttachment : eventAttachments) {
			AttachmentBean eventAttachmentBean = new AttachmentBean();
			copyAttachmentProperties(eventAttachment, eventAttachmentBean);
			eventAttachmentBeans.add(eventAttachmentBean);			
		}
		eventBean.setAttachmentBeans(eventAttachmentBeans);
	}
	
	private void copyProperties(IEvent item, ItemBean itemBean) {
		itemBean.setEndDate(item.getEndDate());
		itemBean.setContent(item.getMainContent());
		itemBean.setDescription(item.getShortDescription());
		itemBean.setShowInHomePage(item.isShowInHomePage());
		itemBean.setSliderImage(item.getSliderImage());
		itemBean.setSliderSelected(item.isSliderItem());
		itemBean.setStartDate(item.getStartDate());
		itemBean.setTitle(item.getTitle());
		itemBean.setId(item.getId());
		itemBean.setUrl(item.getUrl());
		itemBean.setEventType(EventType.EVENTS);
	}
	
	private void copyProperties(EventElement element, Event event) {
		event.setStartDate(element.getDate());
		event.setMainContent(element.getDescription());
		event.setTitle(element.getTitle());
		event.setUrl(element.getUrl());
	}
	
	private List<IEventAttachment> getNewEventsAttachments(List<AttachmentBean> attachmentBeans, IEvent event) {
		List<IEventAttachment> newEventAttachments = new ArrayList<IEventAttachment>();
		for (AttachmentBean attachmentBean : attachmentBeans) {
			IEventAttachment eventAttachment = new EventAttachment();
			copyAttachmentProperties(attachmentBean, eventAttachment);
			eventAttachment.setEvent(event);
			newEventAttachments.add(eventAttachment);
		}
		return newEventAttachments;
	}
	
	private void copyAttachmentProperties(AttachmentBean attachmentBean, IEventAttachment eventAttachment) {
		eventAttachment.setActive(attachmentBean.isActive());
		eventAttachment.setFileName(attachmentBean.getName());
		eventAttachment.setFileType(attachmentBean.getType());
		eventAttachment.setId(attachmentBean.getAttachmentId());
		eventAttachment.setLocation(attachmentBean.getLocation());
	}
	
	private void copyAttachmentProperties(IEventAttachment eventAttachment, AttachmentBean attachmentBean) {
		attachmentBean.setActive(eventAttachment.isActive());
		attachmentBean.setName(eventAttachment.getFileName());
		attachmentBean.setType(eventAttachment.getFileType());
		attachmentBean.setAttachmentId(eventAttachment.getId());
		attachmentBean.setLocation(eventAttachment.getLocation());
	}
	
	private List<IEventAttachment> setAttachmentsForEventsUpdate(ArticleBean newsBean, IEvent event) {
		List<IEventAttachment> dbAttachments = event.getEventAttachments();
		List<AttachmentBean> newAttachmentBeans = newsBean.getAttachmentBeans();
		
		Map<Long, AttachmentBean> updatedIds = new HashMap<Long, AttachmentBean>();
		List<IEventAttachment> newAttachments = new ArrayList<IEventAttachment>();
		List<IEventAttachment> deletedAttachments = new ArrayList<IEventAttachment>();
		
		for (AttachmentBean attachmentBean : newAttachmentBeans) {
			Long attachmentId = attachmentBean.getAttachmentId();
			if(attachmentId == null ) {
				IEventAttachment eventAttachments = new EventAttachment();
				copyAttachmentProperties(attachmentBean, eventAttachments);
				eventAttachments.setEvent(event);
				newAttachments.add(eventAttachments);
			} else {
				updatedIds.put(attachmentId, attachmentBean);
			}
		}
		
		for (IEventAttachment dbAttachment : dbAttachments) {
			AttachmentBean dbAttachmentBean = updatedIds.get(dbAttachment.getId());
			if(dbAttachmentBean != null ) {
				copyAttachmentProperties(dbAttachmentBean, dbAttachment);
				dbAttachment.setEvent(event);
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
		event.setEventAttachments(dbAttachments);
		return deletedAttachments;
	}
	
	private AttachmentBean getFileAttachment(String fileName, String contentType) {
		AttachmentBean fileArticle = new AttachmentBean();
   	 	fileArticle.setActive(true);
   	 	fileArticle.setName(fileName);
   	 	fileArticle.setType(contentType);
   	 	StringBuilder newsPath = new StringBuilder(IConstants.EVENTS_DOCUMENT_PATH);
   	 	fileArticle.setLocation(newsPath.toString());
		return fileArticle;
	}
	
	private String getFullArticlePath(String serverPath) {
		//Save the File in Server
		StringBuilder directoryPath = new StringBuilder(serverPath);
		directoryPath.append(IConstants.EVENTS_DOCUMENT_PATH);
		return directoryPath.toString();
	}
}
