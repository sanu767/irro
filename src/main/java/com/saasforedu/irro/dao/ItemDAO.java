package com.saasforedu.irro.dao;

import java.util.List;

import com.saasforedu.irro.bean.ItemBean;
import com.saasforedu.irro.model.IItem;

public interface ItemDAO {
	
	/** Put CRUD in BaseDAO **/
	public Long create(final IItem item);

	public void updateItem(IItem item);
	
	public void deleteItem(List<IItem> itemsToDelete);
	
	public IItem findById(Long itemId);
	
	public List<IItem> findAll(List<Long> itemIds);
	
	public List<IItem> getItemsByEventType(String eventType);

	public List<IItem> getItems(int numberOfItems);
	
	public List<IItem> searchItems(String itemSearchText);
	
	public List<IItem> searchItems(ItemBean itemBean);
}
