package com.saasforedu.irro.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.saasforedu.irro.article.bean.AttachmentBean;
import com.saasforedu.irro.bean.ItemBean;

public interface ItemService {
	public Long create(final ItemBean itemBean);
	public void updateItem(ItemBean itemBean);
	public void deleteItem(List<Long> itemIdsToDelete, String serverPath);
	public ItemBean findItem(Long itemId);
	public List<ItemBean> getSliderItems(final int numberOfItems);
	public List<ItemBean> searchItems(String itemSearchText);
	public List<ItemBean> searchItems(ItemBean itemBean);
	
	/** Attachment Methods */
	public AttachmentBean doUploadItemsFile(String fileName, String contentType, File file, String serverPath) throws IOException;	
	public void removeAttachment(AttachmentBean attachmentBean, String serverPath);
}