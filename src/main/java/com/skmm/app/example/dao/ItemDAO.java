package com.skmm.app.example.dao;

import java.io.Serializable;
import java.util.List;

import com.skmm.app.example.model.Item;

public interface ItemDAO {
	public Serializable create(final Item item);

	public List<Item> getItems(String eventType);

	public List<Item> getAllItems();
}
