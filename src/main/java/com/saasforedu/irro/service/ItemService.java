package com.saasforedu.irro.service;

import java.util.List;

import com.saasforedu.irro.bean.ItemBean;

public interface ItemService {
	public Long create(final ItemBean itemBean);
	public void updateItem(ItemBean itemBean);
	public void deleteItem(List<Long> itemIdsToDelete);
	
	public ItemBean findItem(Long itemId);
	public List<ItemBean> getItems(final int numberOfItems);
	public List<ItemBean> getEvents();
	public List<ItemBean> getNews();
	public List<ItemBean> searchItems(String itemSearchText);
	public List<ItemBean> searchItems(ItemBean itemBean);
}