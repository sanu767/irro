package com.saasforedu.irro.dao;

import java.util.List;

import com.saasforedu.irro.bean.ItemBean;
import com.saasforedu.irro.model.IItem;
import com.saasforedu.irro.model.IItemAttachment;
import com.saasforedu.irro.model.impl.Item;

public interface ItemDAO extends IBaseDAO<Item> {
	
	/** Put CRUD in BaseDAO **/
	
	public void deleteItem(List<IItem> itemsToDelete);
	
	public List<IItem> findAll(List<Long> itemIds);
	
	public List<IItem> getSliderItems(int numberOfItems);
	
	public List<IItem> searchItems(String itemSearchText);
	
	public List<IItem> searchItems(ItemBean itemBean);
	
	public void update(IItem item, List<IItemAttachment> removedAttachments);
}
