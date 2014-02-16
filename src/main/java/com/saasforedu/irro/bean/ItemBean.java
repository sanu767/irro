package com.saasforedu.irro.bean;

import java.util.Date;

public class ItemBean {

	Long itemId;
	int type;
	String title;
	Date startDate;
	Date endDate;
	String shortDescription;
	String longDescription;
	boolean sliderSelected;
	String image;
	String filePath;
	
	/* Search Properties */
	int searchType;
	String searchText;
	Date beforeSearchDate;
	Date afterSearchDate;	
	
	public ItemBean() {
		super();
	}

	public ItemBean(Long itemId, String title, Date startDate,
			Date endDate, String shortDescription) {
		super();
		this.itemId = itemId;
		this.title = title;
		this.startDate = startDate;
		this.endDate = endDate;
		this.shortDescription = shortDescription;
	}

	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	public int getType() {
		return type;
	}

	public void setType(String type) {
		this.type = Integer.parseInt(type);
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

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

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getLongDescription() {
		return longDescription;
	}

	public void setLongDescription(String longDescription) {
		this.longDescription = longDescription;
	}

	public boolean getSliderSelected() {
		return sliderSelected;
	}

	public void setSliderSelected(boolean sliderSelected) {
		this.sliderSelected = sliderSelected;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
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

}
