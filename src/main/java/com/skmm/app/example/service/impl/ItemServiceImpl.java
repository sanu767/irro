package com.skmm.app.example.service.impl;

import java.io.Serializable;
import java.util.List;

import com.skmm.app.example.dao.ItemDAO;
import com.skmm.app.example.enums.EventType;
import com.skmm.app.example.model.Item;
import com.skmm.app.example.service.ItemService;

public class ItemServiceImpl implements ItemService {

	private ItemDAO itemDAO;

	public void setItemDAO(ItemDAO itemDAO) {
		this.itemDAO = itemDAO;
	}

	@Override
	public Serializable create(Item item) {
		return itemDAO.create(item);
	}

	@Override
	public Serializable getItems(int numberOfItems) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Item> getEvents() {
		return itemDAO.getItems(EventType.EVENTS.getTypeId());
	}

	@Override
	public List<Item> getNews() {
		return itemDAO.getItems(EventType.NEWS.getTypeId());
	}

}
