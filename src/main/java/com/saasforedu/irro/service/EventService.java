package com.saasforedu.irro.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.saasforedu.irro.article.bean.AttachmentBean;
import com.saasforedu.irro.bean.ItemBean;
import com.saasforedu.irro.model.impl.Event;
import com.saasforedu.irro.xmlelements.EventElement;

public interface EventService {
	public void create(List<EventElement> elements);
	public List<Event> getEventsForPeriod(int numberOfMonths);
	public Long create(final ItemBean itemBean);
	public void updateItem(ItemBean itemBean);
	public void deleteItem(List<Long> itemIdsToDelete, String serverPath);
	public ItemBean findEvent(Long itemId);
	public List<ItemBean> getEventsForSlider(final int numberOfItems);
	public List<ItemBean> getEventsForHomePage();
	public List<ItemBean> searchItems(String itemSearchText);
	public List<ItemBean> searchItems(ItemBean itemBean);
	
	/** Attachment Methods */
	public AttachmentBean doUploadEventsFile(String fileName, String contentType, File file, String serverPath) throws IOException;	
	public void removeAttachment(AttachmentBean attachmentBean, String serverPath);

}