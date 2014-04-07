package com.saasforedu.irro.dao.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import com.saasforedu.irro.bean.ItemBean;
import com.saasforedu.irro.dao.IEventDAO;
import com.saasforedu.irro.model.IEvent;
import com.saasforedu.irro.model.IEventAttachment;
import com.saasforedu.irro.model.impl.Event;

public class EventDAO extends BaseDAOimpl<Event> implements IEventDAO {

	public void saveAll(List<IEvent> events) {
		getHibernateTemplate().saveOrUpdateAll(events);
	}

	@SuppressWarnings("unchecked")
	public List<Event> findEventsForPeriod(int numberOfMonths) {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, -numberOfMonths);
		Date previousDate = cal.getTime();
		String query = "select e from Event e where e.startDate > ? order by e.startDate";
		return getHibernateTemplate().find(query, new Object[] { previousDate });
	}
	
	@Override
	public void deleteItem(List<IEvent> itemsToDelete) {
		getHibernateTemplate().deleteAll(itemsToDelete);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<IEvent> findAll(List<Long> itemIds) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select i from Event i where i.id in  (:listParam) ");
		String[] params = { "listParam" };
		Object [] values = {itemIds};
		List<IEvent> resultItems = getHibernateTemplate().findByNamedParam(queryBuilder.toString(), params, values);
		return resultItems;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<IEvent> getEventsForSlider(int numberOfItems) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select i from Event i where i.sliderItem = ?");
		queryBuilder.append(" order by i.startDate DESC");
		queryBuilder.append(" LIMIT " + Integer.toString(numberOfItems));
		return getHibernateTemplate().find(queryBuilder.toString(), true);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<IEvent> searchItems(String itemSearchText) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select i from Event i where i.title like  ");
		queryBuilder.append(" '%" + itemSearchText +"%' ");
		queryBuilder.append(" or i.shortDescription like  ");
		queryBuilder.append(" '%" + itemSearchText +"%' ");
		queryBuilder.append(" or i.mainContent like  ");
		queryBuilder.append(" '%" + itemSearchText +"%' ");
		queryBuilder.append(" order by i.startDate DESC");
		
		List<IEvent> resultItems = getHibernateTemplate().find(queryBuilder.toString());
		return resultItems;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<IEvent> searchItems(ItemBean itemBean) {
		List<IEvent> resultItems = new ArrayList<IEvent>();
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append(" select i from Event i ");

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

	@SuppressWarnings("unchecked")
	@Override
	public List<IEvent> getEventsForHomePage(int numberOfItems) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select i from Event i where i.showInHomePage = ?");
		queryBuilder.append(" order by i.startDate DESC");
		queryBuilder.append(" LIMIT " + Integer.toString(numberOfItems));
		return getHibernateTemplate().find(queryBuilder.toString(), true);
	}
	
	@Override
	public void update(IEvent event, List<IEventAttachment> removedAttachments) {
		deleteAttachments(removedAttachments);
		super.update((Event)event);
	}
	
	private void deleteAttachments(List<IEventAttachment> removedAttachments) {
		if(CollectionUtils.isNotEmpty(removedAttachments)) {
			getHibernateTemplate().deleteAll(removedAttachments);
		}
	}
}
