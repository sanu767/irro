package com.saasforedu.irro.bean;

import java.io.File;
import java.util.Date;

import com.saasforedu.irro.article.bean.ArticleBean;
import com.saasforedu.irro.enums.EventType;

public class ItemBean extends ArticleBean {

	Long rowId;
	Date startDate;
	Date endDate;
	boolean showInHomePage;
	String url;
	
	EventType eventType;
	
	/** Slider Attributes **/
	boolean sliderSelected;
	String sliderImage;
	File sliderFile;
	String sliderPath;
	
	
	/* Search Properties */
	int searchType;
	String searchText;
	Date beforeSearchDate;
	Date afterSearchDate;	
	
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


	
	public String getSliderImage() {
		return sliderImage;
	}

	public void setSliderImage(String sliderImage) {
		this.sliderImage = sliderImage;
	}


	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public Date getBeforeSearchDate() {
		return beforeSearchDate;
	}

	public void setBeforeSearchDate(Date beforeSearchDate) {
		this.beforeSearchDate = beforeSearchDate;
	}

	public int getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = Integer.parseInt(searchType);
	}

	public Date getAfterSearchDate() {
		return afterSearchDate;
	}

	public void setAfterSearchDate(Date afterSearchDate) {
		this.afterSearchDate = afterSearchDate;
	}

	public boolean isShowInHomePage() {
		return showInHomePage;
	}

	public void setShowInHomePage(boolean showInHomePage) {
		this.showInHomePage = showInHomePage;
	}

	public void setSearchType(int searchType) {
		this.searchType = searchType;
	}

	public EventType getEventType() {
		return eventType;
	}

	public void setEventType(EventType eventType) {
		this.eventType = eventType;
	}

	public boolean isSliderSelected() {
		return sliderSelected;
	}

	public void setSliderSelected(boolean sliderSelected) {
		this.sliderSelected = sliderSelected;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public File getSliderFile() {
		return sliderFile;
	}

	public void setSliderFile(File sliderFile) {
		this.sliderFile = sliderFile;
	}

	public String getSliderPath() {
		return sliderPath;
	}

	public void setSliderPath(String sliderPath) {
		this.sliderPath = sliderPath;
	}

	public Long getRowId() {
		return rowId;
	}

	public void setRowId(Long rowId) {
		this.rowId = rowId;
	}
}
