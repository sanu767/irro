package com.saasforedu.irro.action;

import com.opensymphony.xwork2.ActionSupport;
import com.saasforedu.irro.bean.ItemBean;
import com.saasforedu.irro.service.ItemService;
import com.saasforedu.irro.util.IrroUtils;

public class ItemAction extends ActionSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6994364128717519786L;

	private ItemService itemService;

	private ItemBean itemBean;
	
	private String [] deletedItemIds;
	
	private Long selectedItemIdToModify;
	
	public Long getSelectedItemIdToModify() {
		return selectedItemIdToModify;
	}

	public void setSelectedItemIdToModify(Long selectedItemIdToModify) {
		this.selectedItemIdToModify = selectedItemIdToModify;
	}

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
		return newItemId > 0 ? SUCCESS : ERROR;
	}
	
	public String loadItem() {		
		ItemBean bean = 
				itemService.findItem(selectedItemIdToModify);
		this.itemBean = bean;		
		return SUCCESS;
	}
	
	public String modifyItem() throws Exception {
		itemService.updateItem(itemBean);
		return SUCCESS;
	}
	
	public String deleteItem() throws Exception {
		itemService.deleteItem(IrroUtils.getLongListFromStringArray(deletedItemIds));
		return SUCCESS;
	}
	
}
