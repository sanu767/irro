package com.saasforedu.irro.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.saasforedu.irro.article.service.INewsService;
import com.saasforedu.irro.bean.ItemBean;
import com.saasforedu.irro.enums.EventType;
import com.saasforedu.irro.service.EventService;
import com.saasforedu.irro.service.ItemService;
import com.saasforedu.irro.util.IConstants;

public class ItemSearchAction extends ActionSupport implements ServletRequestAware {
	
	private static final long serialVersionUID = -6994364128717519786L;

	private ItemService itemService;
	
	private EventService eventService;
	
	private INewsService newsService;

	private ItemBean itemSearchBean;
	
	private ItemBean bean;
	
	private Long selectedItemId;
	
	private Long [] checkedId;
	private String [] checkedType;
	
	private HttpServletRequest httpServletRequest;
	
	private List<ItemBean> news = new ArrayList<ItemBean>();
	private List<ItemBean> events = new ArrayList<ItemBean>();
	private List<ItemBean> sliderItems = new ArrayList<ItemBean>();
	private List<ItemBean> searchedItems = new ArrayList<ItemBean>();
	
	public List<ItemBean> getSearchedItems() {
		return searchedItems;
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
		getSession().removeAttribute(IConstants.UPLOADED_SEARCH_ITEMS_SESSION_ATTRIBUTE_NAME);
		List<ItemBean> searchItems = itemService.searchItems(itemSearchBean.getSearchText());
		List<ItemBean> searchEvents = eventService.searchItems(itemSearchBean.getSearchText());
		List<ItemBean> searchNews = newsService.searchItems(itemSearchBean.getSearchText());
		List<ItemBean> allSearchedItems = addToSearchedItems(searchItems, searchEvents, searchNews);
		this.searchedItems = allSearchedItems;
		getSession().setAttribute(IConstants.UPLOADED_SEARCH_ITEMS_SESSION_ATTRIBUTE_NAME, searchedItems);
		return SUCCESS;
	}

	public String advancedSearchItems() throws Exception {
		getSession().removeAttribute(IConstants.UPLOADED_SEARCH_ITEMS_SESSION_ATTRIBUTE_NAME);
		List<ItemBean> searchNews = new ArrayList<ItemBean>();
		List<ItemBean> searchEvents = new ArrayList<ItemBean>();
		List<ItemBean> searchItems = new ArrayList<ItemBean>();
		EventType searchEventType = EventType.getType(itemSearchBean.getSearchType());
		if(searchEventType != null ) {
			switch (searchEventType) {
			case NEWS:
				searchNews.addAll(newsService.searchItems(itemSearchBean));
				break;
			case EVENTS:
				searchEvents.addAll(eventService.searchItems(itemSearchBean));
				break;
			case OTHERS:
				searchItems.addAll(itemService.searchItems(itemSearchBean));
				break;
			default:
				break;
			}
		}
		
		List<ItemBean> allSearchedItems = addToSearchedItems(searchItems, searchEvents, searchNews);
		this.searchedItems = allSearchedItems;
		getSession().setAttribute(IConstants.UPLOADED_SEARCH_ITEMS_SESSION_ATTRIBUTE_NAME, searchedItems);
		return SUCCESS;
	}
	
	public String loadNews() {
		news.addAll(newsService.getNewssForHomePage());
		Map<String, Object> application = ActionContext.getContext().getApplication();
		application.put("News", this.news);
		return SUCCESS;
	}
	
	public String loadEvents() {
		events.addAll(eventService.getEventsForHomePage());
		Map<String, Object> application = ActionContext.getContext().getApplication();
		application.put("Events", this.events);
		return SUCCESS;
	}
	
	public String loadSliderItems() {
		sliderItems.addAll(newsService.getNewssForSlider(5));
		sliderItems.addAll(eventService.getEventsForSlider(5));
		sliderItems.addAll(itemService.getSliderItems(5));
		Map<String, Object> application = ActionContext.getContext().getApplication();
		application.put("SliderItems", this.sliderItems);
		return SUCCESS;
	}
	
	public String loadSelectedEvent() {
		ItemBean bean = eventService.findEvent(selectedItemId);
		this.bean = bean;
		return SUCCESS;
	}
	
	public String loadSelectedItem() {
		ItemBean bean = itemService.findItem(selectedItemId);
		this.bean = bean;
		return SUCCESS;
	}
	
	public String loadSelectedNews() {
		ItemBean bean = newsService.findById(selectedItemId);
		this.bean = bean;
		return SUCCESS;
	}

	public String deleteItems() {
		List<Long> deletedNewsIds = new ArrayList<Long>();
		List<Long> deletedEventIds = new ArrayList<Long>();
		List<Long> deletedItemIds = new ArrayList<Long>();
		
		List<ItemBean> searchedItemssInSession = getUploadedSearchedItemssInSession();
		for (ItemBean searchedItemInSession : searchedItemssInSession) {
			boolean contains = ArrayUtils.contains(checkedId, searchedItemInSession.getRowId());
			if(contains) {
				if(EventType.NEWS.getTypeId().equals(searchedItemInSession.getEventType().getTypeId())) {
					deletedNewsIds.add(searchedItemInSession.getId());
				}
				if(EventType.EVENTS.getTypeId().equals(searchedItemInSession.getEventType().getTypeId())) {
					deletedEventIds.add(searchedItemInSession.getId());
				}
				
				if(EventType.OTHERS.getTypeId().equals(searchedItemInSession.getEventType().getTypeId())) {
					deletedItemIds.add(searchedItemInSession.getId());
				}
			}
		}
		
		if(CollectionUtils.isNotEmpty(deletedItemIds)) {
			itemService.deleteItem(deletedItemIds, getServerPath());
		}
		
		if(CollectionUtils.isNotEmpty(deletedEventIds)) {
			eventService.deleteItem(deletedEventIds, getServerPath());
		}
		
		if(CollectionUtils.isNotEmpty(deletedNewsIds)) {
			newsService.deleteItem(deletedNewsIds, getServerPath());
		}
		
		getSession().removeAttribute(IConstants.UPLOADED_SEARCH_ITEMS_SESSION_ATTRIBUTE_NAME);
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	private List<ItemBean> getUploadedSearchedItemssInSession() {
		HttpSession session = getSession();
		List<ItemBean> uploadedFiles = (List<ItemBean>)session.getAttribute(IConstants.UPLOADED_SEARCH_ITEMS_SESSION_ATTRIBUTE_NAME);
		if(uploadedFiles == null || uploadedFiles.isEmpty()) {
			session.setAttribute(IConstants.UPLOADED_SEARCH_ITEMS_SESSION_ATTRIBUTE_NAME, new ArrayList<ItemBean>());
		}
		return (List<ItemBean>)session.getAttribute(IConstants.UPLOADED_SEARCH_ITEMS_SESSION_ATTRIBUTE_NAME);
	}
	
	private List<ItemBean> addToSearchedItems(List<ItemBean> searchItems,
			List<ItemBean> searchEvents, List<ItemBean> searchNews) {
		List<ItemBean> searchedItems = new ArrayList<ItemBean>();
		Long rowId = 0L;
		for (ItemBean itemBean : searchItems) {
			itemBean.setRowId(rowId);
			searchedItems.add(itemBean);
			rowId ++;
		}
		
		for (ItemBean itemBean : searchEvents) {
			itemBean.setRowId(rowId);
			searchedItems.add(itemBean);
			rowId ++;
		}
		
		for (ItemBean itemBean : searchNews) {
			itemBean.setRowId(rowId);
			searchedItems.add(itemBean);
			rowId ++;
		}
		return searchedItems;
	}
	
	private HttpSession getSession() {
		HttpSession session = httpServletRequest.getSession();
		return session;
	}
	
	public void setEventService(EventService eventService) {
		this.eventService = eventService;
	}

	public void setNewsService(INewsService newsService) {
		this.newsService = newsService;
	}

	public Long getSelectedItemId() {
		return selectedItemId;
	}

	public void setSelectedItemId(Long selectedItemId) {
		this.selectedItemId = selectedItemId;
	}

	public ItemBean getItemSearchBean() {
		return itemSearchBean;
	}

	public void setItemSearchBean(ItemBean itemSearchBean) {
		this.itemSearchBean = itemSearchBean;
	}

	public ItemBean getBean() {
		return bean;
	}

	public void setBean(ItemBean bean) {
		this.bean = bean;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest httpServletRequest) {
		this.httpServletRequest = httpServletRequest;		
	}

	public String[] getCheckedType() {
		return checkedType;
	}

	public void setCheckedType(String[] checkedType) {
		this.checkedType = checkedType;
	}
	
	@SuppressWarnings("deprecation")
	private String getServerPath() {
		return httpServletRequest.getRealPath("/");
	}

	public Long[] getCheckedId() {
		return checkedId;
	}

	public void setCheckedId(Long[] checkedId) {
		this.checkedId = checkedId;
	}
	
	@Override
	public String execute() throws Exception {
		getSession().removeAttribute(IConstants.UPLOADED_EVENTS_FILES_SESSION_ATTRIBUTE_NAME);
		getSession().removeAttribute(IConstants.UPLOADED_ITEMS_FILES_SESSION_ATTRIBUTE_NAME);
		getSession().removeAttribute(IConstants.UPLOADED_NEWS_FILES_SESSION_ATTRIBUTE_NAME);
		getSession().removeAttribute(IConstants.UPLOADED_SEARCH_ITEMS_SESSION_ATTRIBUTE_NAME);
		return SUCCESS;
	}
}
