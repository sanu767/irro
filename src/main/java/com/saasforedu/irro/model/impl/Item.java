package com.saasforedu.irro.model.impl;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import com.saasforedu.irro.model.IItem;

@Entity
@Table(name = "ITEM")
public class Item implements IItem {

	@Id
	@GeneratedValue
	@Column(name = "ITEM_ID")
	Long itemId;

	@Column(name = "ITEM_TYPE", length = 1)
	String type;

	@Column(name = "TITLE", length = 10)
	String title;

	@Column(name = "START_DATE")
	Date startDate;

	@Column(name = "END_DATE")
	Date endDate;

	@Column(name = "SHORT_DESC")
	String shortDescription;

	@Column(name = "LONG_DESC")
	String longDescription;

	@Column(name = "IS_SLIDER")
	boolean sliderSelected;

	@Column(name = "SLIDER_IMG_NAME")
	String image;

	@Column(name = "FILE_PATH")
	String filePath;

	public Long getItemId() {
		return itemId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	@Override
	public String toString() {
		return "Item [itemId=" + itemId + ", type=" + type + ", title=" + title
				+ ", startDate=" + startDate + ", endDate=" + endDate
				+ ", shortDescription=" + shortDescription + ", longDescription="
				+ longDescription + ", sliderSelected=" + sliderSelected
				+ ", image=" + image + ", filePath=" + filePath + "]";
	}

	@Override
	public int hashCode() {
		return HashCodeBuilder.reflectionHashCode(this);
	}

	@Override
	public boolean equals(Object obj) {
		return EqualsBuilder.reflectionEquals(this, obj);
	}

	
}
