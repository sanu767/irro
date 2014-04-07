package com.saasforedu.irro.dao;

import java.util.List;

import com.saasforedu.irro.bean.ItemBean;
import com.saasforedu.irro.model.IEvent;
import com.saasforedu.irro.model.IEventAttachment;
import com.saasforedu.irro.model.impl.Event;

public interface IEventDAO extends IBaseDAO<Event> {

	public void saveAll(List<IEvent> events);

	public List<Event> findEventsForPeriod(int numberOfMonths);
	
	/** Put CRUD in BaseDAO **/
	public void deleteItem(List<IEvent> itemsToDelete);
	
	public void update(IEvent event, List<IEventAttachment> removedAttachments);
	
	public List<IEvent> findAll(List<Long> itemIds);
	
	public List<IEvent> getEventsForSlider(int numberOfItems);
	
	public List<IEvent> getEventsForHomePage(int numberOfItems);
	
	public List<IEvent> searchItems(String itemSearchText);
	
	public List<IEvent> searchItems(ItemBean itemBean);
	
}
