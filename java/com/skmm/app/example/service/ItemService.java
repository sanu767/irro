package com.skmm.app.example.service;

import java.io.Serializable;
import java.util.List;

import com.skmm.app.example.model.Item;

public interface ItemService {
	public Serializable create(final Item item);
	public Serializable getItems(final int numberOfItems);
	public List<Item> getEvents();
	public List<Item> getNews();
}
