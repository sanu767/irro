package com.saasforedu.irro.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.saasforedu.irro.bean.ItemBean;
import com.saasforedu.irro.service.ItemService;

public class ItemAction extends ActionSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6994364128717519786L;

	private ItemService itemService;

	private ItemBean itemBean;
	
	private String [] deletedItemIds;
	
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}

	public String[] getDeletedItemIds() {
		return deletedItemIds;
	}

	public void setDeletedItemIds(String[] deletedItemIds) {
		this.deletedItemIds = deletedItemIds;
	}

	public ItemBean getItemBean() {
		return itemBean;
	}

	public void setItemBean(ItemBean itemBean) {
		this.itemBean = itemBean;
	}

	public String createItem() throws Exception {
		Long newItemId = itemService.create(itemBean);
		return newItemId > 1 ? SUCCESS : ERROR;
	}
	
	public String modifyItem() throws Exception {
		itemService.updateItem(itemBean);
		return SUCCESS;
	}
	
	public String deleteItem() throws Exception {
		List<Long> itemIdsToDelete = new ArrayList<Long>();
		for (String code : deletedItemIds) {
			itemIdsToDelete.add(Long.parseLong(code));
		}
		itemService.deleteItem(itemIdsToDelete);
		return SUCCESS;
	}
	
}
