package com.skmm.app.example.action;

import com.opensymphony.xwork2.ActionSupport;
import com.skmm.app.example.model.Item;
import com.skmm.app.example.service.ItemService;

public class ItemAction extends ActionSupport {

	private static final long serialVersionUID = 3638171739489919812L;

	private ItemService itemService;

	private Item item;

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}

	@Override
	public String execute() throws Exception {
		String id = (String) itemService.create(item);
		return Long.parseLong(id) > 0l ? SUCCESS : ERROR;
	}
	
}
