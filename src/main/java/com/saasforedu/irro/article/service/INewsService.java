package com.saasforedu.irro.article.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.saasforedu.irro.article.bean.AttachmentBean;
import com.saasforedu.irro.bean.ItemBean;

public interface INewsService {
	public List<ItemBean> getNewssForSlider(final int numberOfItems);
	public List<ItemBean> getNewssForHomePage();
	
	public Long createNews(ItemBean news, String menuName, String parentName);
	public void updateNews(ItemBean news);
	public void deleteNews(ItemBean news, String menuName, String parentMenuName, String serverPath);
	public List<ItemBean> findNews(String menuName, String parentMenuName);
	public ItemBean findById(Long newsId);
	
	public void deleteItem(List<Long> itemIdsToDelete, String serverPath);
	
	public List<ItemBean> searchItems(String itemSearchText);
	public List<ItemBean> searchItems(ItemBean itemBean);
	
	/** Attachment Methods */
	public AttachmentBean doUploadNewsFile(String fileName, String contentType, String menuName, String parentMenuName, 
			File file, String serverPath) throws IOException;	
	public void removeAttachment(AttachmentBean attachmentBean, String serverPath, String menuName, String parentMenuName);

}