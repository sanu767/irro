package com.saasforedu.irro.article.dao;

import java.util.List;

import com.saasforedu.irro.article.entity.INews;
import com.saasforedu.irro.article.entity.impl.News;
import com.saasforedu.irro.bean.ItemBean;
import com.saasforedu.irro.dao.IBaseDAO;
import com.saasforedu.irro.model.INewsAttachment;

public interface INewsDAO extends IBaseDAO<News> {

	public List<INews> getNewssForSlider(int numberOfItems);
	
	public List<INews> getNewssForHomePage(int numberOfItems);
	
	public void deleteNews(INews news);
	public void deleteAllNews(List<INews> news);
	
	public List<INews> findByRefereceArticleId(Long referenceArticleId);
	
	public List<INews> searchItems(String itemSearchText);
	
	public List<INews> searchItems(ItemBean itemBean);
	
	public List<INews> findAll(List<Long> itemIds);
	
	public void update(INews news, List<INewsAttachment> removedAttachments);
}
