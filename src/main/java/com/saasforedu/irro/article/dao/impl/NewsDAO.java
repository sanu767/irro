package com.saasforedu.irro.article.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import com.saasforedu.irro.article.dao.INewsDAO;
import com.saasforedu.irro.article.entity.INews;
import com.saasforedu.irro.article.entity.impl.News;
import com.saasforedu.irro.bean.ItemBean;
import com.saasforedu.irro.dao.impl.BaseDAOimpl;
import com.saasforedu.irro.model.INewsAttachment;

public class NewsDAO extends BaseDAOimpl<News> implements INewsDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<INews> getNewssForSlider(int numberOfItems) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select i from News i where i.sliderItem = ?");
		queryBuilder.append(" order by i.startDate DESC");
		queryBuilder.append(" LIMIT " + Integer.toString(numberOfItems));
		return getHibernateTemplate().find(queryBuilder.toString(), true);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<INews> getNewssForHomePage(int numberOfItems) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select i from News i where i.showInHomePage = ?");
		queryBuilder.append(" order by i.startDate DESC");
		queryBuilder.append(" LIMIT " + Integer.toString(numberOfItems));
		return getHibernateTemplate().find(queryBuilder.toString(), true);
	}

	@Override
	public void deleteNews(INews article) {
		getHibernateTemplate().delete(article);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<INews> findByRefereceArticleId(Long referenceArticleId) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from News u where u.referenceArticleId =  ? ");
		List<INews> resultArticles = getHibernateTemplate().find(queryBuilder.toString(), referenceArticleId);
		return resultArticles;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<INews> searchItems(String itemSearchText) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select i from News i where i.title like  ");
		queryBuilder.append(" '%" + itemSearchText +"%' ");
		queryBuilder.append(" or i.shortDescription like  ");
		queryBuilder.append(" '%" + itemSearchText +"%' ");
		queryBuilder.append(" or i.mainContent like  ");
		queryBuilder.append(" '%" + itemSearchText +"%' ");
		queryBuilder.append(" order by i.startDate DESC");
		
		List<INews> resultItems = getHibernateTemplate().find(queryBuilder.toString());
		return resultItems;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<INews> searchItems(ItemBean itemBean) {
		List<INews> resultItems = new ArrayList<INews>();
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append(" select i from News i ");

		List<Object> paramList = new ArrayList<Object>();

		String searchText = itemBean.getSearchText();
		Date beforeSearchDate = itemBean.getBeforeSearchDate();
		Date afterSearchDate = itemBean.getAfterSearchDate();
		
		boolean isSearchTextNotBlank = StringUtils.isNotBlank(searchText);
		boolean beforeSearchDateIsNotNull = beforeSearchDate != null;
		boolean afterSearchDateIsNotNull = afterSearchDate != null;
		
		if(isSearchTextNotBlank || 
				beforeSearchDateIsNotNull || 
				afterSearchDateIsNotNull) {
			queryBuilder.append(" where ");
		}
		
		if(isSearchTextNotBlank) {
			queryBuilder.append(" i.title like  ");
			queryBuilder.append(" '%" + searchText +"%' ");
			queryBuilder.append(" or i.shortDescription like   ");
			queryBuilder.append(" '%" + searchText +"%' ");
			queryBuilder.append(" or i.mainContent like  ");
			queryBuilder.append(" '%" + searchText +"%' ");

		}

		if(beforeSearchDateIsNotNull) {
			if(isSearchTextNotBlank) {
				queryBuilder.append(" and ");
			}
			queryBuilder.append(" i.endDate <= ? ");
			paramList.add(beforeSearchDate);
		}

		if(afterSearchDateIsNotNull) {
			if(isSearchTextNotBlank || beforeSearchDateIsNotNull) {
				queryBuilder.append(" and ");
			}
			queryBuilder.append(" i.startDate >= ? ");
			paramList.add(afterSearchDate);
		}

		queryBuilder.append(" order by i.startDate DESC");			
		resultItems = getHibernateTemplate().find(queryBuilder.toString(), paramList.toArray());
		return resultItems;
	}

	@Override
	public void deleteAllNews(List<INews> news) {
		getHibernateTemplate().deleteAll(news);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<INews> findAll(List<Long> itemIds) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select i from News i where i.id in  (:listParam) ");
		String[] params = { "listParam" };
		Object [] values = {itemIds};
		List<INews> resultItems = getHibernateTemplate().findByNamedParam(queryBuilder.toString(), params, values);
		return resultItems;
	}
	
	@Override
	public void update(INews news, List<INewsAttachment> removedAttachments) {
		deleteAttachments(removedAttachments);
		super.update((News)news);
	}
	
	private void deleteAttachments(List<INewsAttachment> removedAttachments) {
		if(CollectionUtils.isNotEmpty(removedAttachments)) {
			getHibernateTemplate().deleteAll(removedAttachments);
		}
	}
}
