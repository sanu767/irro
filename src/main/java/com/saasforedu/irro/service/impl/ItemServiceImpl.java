package com.saasforedu.irro.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.saasforedu.irro.bean.ItemBean;
import com.saasforedu.irro.dao.ItemDAO;
import com.saasforedu.irro.enums.EventType;
import com.saasforedu.irro.model.IItem;
import com.saasforedu.irro.model.impl.Item;
import com.saasforedu.irro.service.ItemService;

public class ItemServiceImpl implements ItemService {

	private ItemDAO itemDAO;

	public void setItemDAO(ItemDAO itemDAO) {
		this.itemDAO = itemDAO;
	}

	@Override
	public Long create(ItemBean itemBean) {
		IItem newItem = new Item();
		copyProperties(itemBean, newItem);
		return itemDAO.create(newItem);
	}
	
	@Override
	public void updateItem(ItemBean itemBean) {
		IItem item = itemDAO.findById(itemBean.getItemId());
		copyProperties(itemBean, item);
		itemDAO.updateItem(item);
	}

	@Override
	public void deleteItem(List<Long> itemIdsToDelete) {
		List<IItem> itemsToDelete = itemDAO.findAll(itemIdsToDelete);
		itemDAO.deleteItem(itemsToDelete);
	}
	
	@Override
	public ItemBean findItem(Long itemId) {
		IItem item = itemDAO.findById(itemId);
		ItemBean itemBean = new ItemBean();
		copyProperties(item, itemBean);
		return itemBean;
	}
	
	@Override
	public List<ItemBean> getItems(int numberOfItems) {
		List<IItem> items = itemDAO.getItems(numberOfItems);
		return convertToItemBeans(items);
	}

	@Override
	public List<ItemBean> getEvents() {
		List<IItem> items = itemDAO.getItemsByEventType(EventType.EVENTS.getTypeId());
		return convertToItemBeans(items);
	}

	@Override
	public List<ItemBean> getNews() {
		List<IItem> items = itemDAO.getItemsByEventType(EventType.NEWS.getTypeId());
		return convertToItemBeans(items);
	}
	
	@Override
	public List<ItemBean> searchItems(String itemSearchText) {
		List<IItem> items = itemDAO.searchItems(itemSearchText);
		return convertToItemBeans(items);
	}
	
	@Override
	public List<ItemBean> searchItems(ItemBean itemBean) {
		List<IItem> searchItems = itemDAO.searchItems(itemBean);
		List<ItemBean> itemBeans = convertToItemBeans(searchItems);
		return itemBeans;
	}
	
	private void copyProperties(ItemBean itemBean, IItem newItem) {
		newItem.setEndDate(itemBean.getEndDate());
		newItem.setFilePath(itemBean.getFilePath());
		newItem.setImage(itemBean.getImage());
		newItem.setLongDescription(itemBean.getLongDescription());
		newItem.setShortDescription(itemBean.getShortDescription());
		newItem.setSliderSelected(itemBean.getSliderSelected());
		newItem.setStartDate(itemBean.getStartDate());
		newItem.setTitle(itemBean.getTitle());
		newItem.setType(EventType.getTypeValue(itemBean.getType()));
	}
	
	private List<ItemBean> convertToItemBeans(List<IItem> items) {
		List<ItemBean> itemBeans = new ArrayList<ItemBean>();
		for(IItem item : items) {
			ItemBean itemBean = new ItemBean();
			copyProperties(item, itemBean);
			itemBeans.add(itemBean);
		}
		return itemBeans;
	}
	
	private void copyProperties(IItem item, ItemBean itemBean) {
		itemBean.setItemId(item.getItemId());
		itemBean.setEndDate(item.getEndDate());
		itemBean.setFilePath(item.getFilePath());
		itemBean.setImage(item.getImage());
		itemBean.setLongDescription(item.getLongDescription());
		itemBean.setShortDescription(item.getShortDescription());
		itemBean.setSliderSelected(item.getSliderSelected());
		itemBean.setStartDate(item.getStartDate());
		itemBean.setTitle(item.getTitle());
		itemBean.setType(Integer.toString(EventType.getTypeId(item.getType())));
	}

}
