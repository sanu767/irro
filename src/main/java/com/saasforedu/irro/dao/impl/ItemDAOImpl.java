package com.saasforedu.irro.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import com.saasforedu.irro.bean.ItemBean;
import com.saasforedu.irro.dao.ItemDAO;
import com.saasforedu.irro.model.IItem;
import com.saasforedu.irro.model.IItemAttachment;
import com.saasforedu.irro.model.impl.Item;

public class ItemDAOImpl extends BaseDAOimpl<Item> implements ItemDAO {

	@Override
	public void deleteItem(List<IItem> itemsToDelete) {
		getHibernateTemplate().deleteAll(itemsToDelete);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<IItem> findAll(List<Long> itemIds) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select i from Item i where i.id in  (:listParam) ");
		String[] params = { "listParam" };
		Object [] values = {itemIds};
		List<IItem> resultItems = getHibernateTemplate().findByNamedParam(queryBuilder.toString(), params, values);
		return resultItems;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<IItem> getSliderItems(int numberOfItems) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select i from Item i where i.sliderItem = ?");
		queryBuilder.append(" order by i.startDate DESC");
		queryBuilder.append(" LIMIT " + Integer.toString(numberOfItems));
		return getHibernateTemplate().find(queryBuilder.toString(), true);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<IItem> searchItems(String itemSearchText) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select i from Item i where i.title like  ");
		queryBuilder.append(" '%" + itemSearchText +"%' ");
		queryBuilder.append(" or i.shortDescription like  ");
		queryBuilder.append(" '%" + itemSearchText +"%' ");
		queryBuilder.append(" or i.mainContent like  ");
		queryBuilder.append(" '%" + itemSearchText +"%' ");
		queryBuilder.append(" order by i.startDate DESC");
		
		List<IItem> resultItems = getHibernateTemplate().find(queryBuilder.toString());
		return resultItems;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<IItem> searchItems(ItemBean itemBean) {
		List<IItem> resultItems = new ArrayList<IItem>();
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append(" select i from Item i ");

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
	public void update(IItem item, List<IItemAttachment> removedAttachments) {
		deleteAttachments(removedAttachments);
		super.update((Item)item);
	}
	
	private void deleteAttachments(List<IItemAttachment> removedAttachments) {
		if(CollectionUtils.isNotEmpty(removedAttachments)) {
			getHibernateTemplate().deleteAll(removedAttachments);
		}
	}
	
}
