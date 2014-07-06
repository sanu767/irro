package com.skmm.app.example.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.commons.lang.StringUtils;

import com.skmm.app.example.enums.CheckOption;
import com.skmm.app.example.enums.EventType;

@Entity
@Table(name = "ITEM")
public class Item {

	@Id
	@GeneratedValue
	@Column(name = "ITEM_ID")
	String itemId;

	@Column(name = "ITEM_TYPE", length = 1)
	String type;

	@Column(name = "TITLE", length = 10)
	String title;

	@Column(name = "START_DATE")
	Date startDate;

	@Column(name = "END_DATE")
	Date endDate;

	@Column(name = "SHORT_DESC")
	String shortDescrption;

	@Column(name = "LONG_DESC")
	String longDescrption;

	@Column(name = "IS_SLIDER")
	String sliderSelected;

	@Column(name = "SLIDER_IMG_NAME")
	String image;

	@Column(name = "FILE_PATH")
	String filePath;

	public String getItemId() {
		return itemId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = EventType.getTypeId(Integer.parseInt(type));
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

	public String getShortDescrption() {
		return shortDescrption;
	}

	public void setShortDescrption(String shortDescrption) {
		this.shortDescrption = shortDescrption;
	}

	public String getLongDescrption() {
		return longDescrption;
	}

	public void setLongDescrption(String longDescrption) {
		this.longDescrption = longDescrption;
	}

	public String getSliderSelected() {
		return sliderSelected;
	}

	public void setSliderSelected(String sliderSelected) {
		this.sliderSelected = StringUtils.isEmpty(sliderSelected) ? 
				CheckOption.FALSE.getChecked() : CheckOption.TRUE.getChecked();
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
				+ ", shortDescrption=" + shortDescrption + ", longDescrption="
				+ longDescrption + ", sliderSelected=" + sliderSelected
				+ ", image=" + image + ", filePath=" + filePath + "]";
	}

}
