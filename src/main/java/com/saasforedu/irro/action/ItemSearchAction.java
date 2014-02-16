package com.saasforedu.irro.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.saasforedu.irro.bean.ItemBean;
import com.saasforedu.irro.service.ItemService;

public class ItemSearchAction extends ActionSupport {
	
	private static final long serialVersionUID = -6994364128717519786L;

	private ItemService itemService;

	private ItemBean itemBean;
	
	private List<ItemBean> news = new ArrayList<ItemBean>();
	private List<ItemBean> events = new ArrayList<ItemBean>();
	private List<ItemBean> sliderItems = new ArrayList<ItemBean>();
	private List<ItemBean> searchedItems = new ArrayList<ItemBean>();
	
	public List<ItemBean> getSearchedItems() {
		return searchedItems;
	}

	public ItemBean getItemBean() {
		return itemBean;
	}


	public void setItemBean(ItemBean itemBean) {
		this.itemBean = itemBean;
	}

	
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}
	
	public List<ItemBean> getNews() {
		return news;
	}


	public List<ItemBean> getEvents() {
		return events;
	}


	public List<ItemBean> getSliderItems() {
		return sliderItems;
	}
	
	public String searchItems() throws Exception {
		searchedItems.addAll(itemService.searchItems(itemBean.getSearchText()));
		return SUCCESS;
	}
	
	public String advancedSearchItems() throws Exception {
		searchedItems.addAll(itemService.searchItems(itemBean));
		return SUCCESS;
	}
	
	
	public String loadNews() {
		news.addAll(itemService.getNews());
		Map<String, Object> application = ActionContext.getContext().getApplication();
		application.put("News", this.news);
		return SUCCESS;
	}
	
	public String loadEvents() {
		events.addAll(itemService.getEvents());
		Map<String, Object> application = ActionContext.getContext().getApplication();
		application.put("Events", this.events);
		return SUCCESS;
	}
	
	public String loadSliderItems() {
		sliderItems.addAll(itemService.getItems(5));
		Map<String, Object> application = ActionContext.getContext().getApplication();
		application.put("SliderItems", this.sliderItems);
		return SUCCESS;
	}	
}
