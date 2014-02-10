package com.saasforedu.irro.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.saasforedu.irro.bean.ItemBean;
import com.saasforedu.irro.dao.ItemDAO;
import com.saasforedu.irro.enums.EventType;
import com.saasforedu.irro.model.IItem;
import com.saasforedu.irro.model.impl.Item;

public class ItemDAOImpl extends HibernateDaoSupport implements ItemDAO {

	@Override
	public Long create(IItem item) {
		//User should be able to insert duplicate title
		return (Long)getHibernateTemplate().save(item);
	}
	
	@Override
	public void updateItem(IItem item) {
		getHibernateTemplate().update(item);
	}

	@Override
	public void deleteItem(List<IItem> itemsToDelete) {
		getHibernateTemplate().deleteAll(itemsToDelete);
	}

	@Override
	public IItem findById(Long itemId) {
		IItem item = (IItem)getHibernateTemplate().get(Item.class, itemId);
		return item;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<IItem> findAll(List<Long> itemIds) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select i from Item i where i.itemId in  (:listParam) ");
		String[] params = { "listParam" };
		Object [] values = {itemIds};
		List<IItem> resultItems = getHibernateTemplate().findByNamedParam(queryBuilder.toString(), params, values);
		return resultItems;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<IItem> getItemsByEventType(String eventType) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select i from Item i where i.type = ? order by i.startDate DESC");
		List<IItem> resultItems = getHibernateTemplate().find(queryBuilder.toString(), eventType);
		return resultItems;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<IItem> getItems(int numberOfItems) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select i from Item i where i.sliderSelected = ?");
		queryBuilder.append(" order by i.startDate DESC");
		queryBuilder.append(" LIMIT " + Integer.toString(numberOfItems));
		return getHibernateTemplate().find(queryBuilder.toString(), Boolean.TRUE.toString());
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<IItem> searchItems(String itemSearchText) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select i from Item i where i.title like ? ");
		queryBuilder.append(" or i.shortDescription like ? ");
		queryBuilder.append(" or i.longDescription like ? ");
		queryBuilder.append(" order by i.startDate DESC");
		
		StringBuilder searchTextBuilder = new StringBuilder("'%");
		searchTextBuilder.append(itemSearchText);
		searchTextBuilder.append("%'");
		
		List<IItem> resultItems = getHibernateTemplate().find(queryBuilder.toString(), 
				new Object[]{searchTextBuilder.toString(), searchTextBuilder.toString(), searchTextBuilder.toString()} );
		return resultItems;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<IItem> searchItems(ItemBean itemBean) {

		List<IItem> resultItems = new ArrayList<IItem>();
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append(" select i from Item i ");

		List<Object> paramList = new ArrayList<Object>();

		queryBuilder.append(" where ");
		queryBuilder.append(" i.type = ? ");
		paramList.add(EventType.getTypeValue(itemBean.getSearchType()));
		
		if(StringUtils.isNotBlank(itemBean.getSearchText())) {
			queryBuilder.append(" and ");
			queryBuilder.append(" i.title like ? ");
			queryBuilder.append(" or i.shortDescription like  ? ");
			queryBuilder.append(" or i.longDescription like ? ");

			StringBuilder searchTextBuilder = new StringBuilder("%");
			searchTextBuilder.append(itemBean.getSearchText());
			searchTextBuilder.append("%");
			paramList.add(searchTextBuilder.toString());
			paramList.add(searchTextBuilder.toString());
			paramList.add(searchTextBuilder.toString());
		}


		if(itemBean.getBeforeSearchDate() != null) {
			queryBuilder.append(" and ");
			queryBuilder.append(" i.endDate <= ? ");
			paramList.add(itemBean.getBeforeSearchDate());
		}

		if(itemBean.getAfterSearchDate() != null) {
			queryBuilder.append(" and ");
			queryBuilder.append(" i.startDate >= ? ");
			paramList.add(itemBean.getAfterSearchDate());
		}

		queryBuilder.append(" order by i.startDate DESC");			
		resultItems = getHibernateTemplate().find(queryBuilder.toString(), paramList.toArray());
		return resultItems;
	}
}
