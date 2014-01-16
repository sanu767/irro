package com.saasforedu.irro.model;

import java.util.Date;

public interface IItem {

	public Long getItemId();

	public String getType();
	public void setType(String type);

	public String getTitle();
	public void setTitle(String title);

	public Date getStartDate();
	public void setStartDate(Date startDate);

	public Date getEndDate();
	public void setEndDate(Date endDate);

	public String getShortDescription();
	public void setShortDescription(String shortDescription);

	public String getLongDescription();
	public void setLongDescription(String longDescription) ;

	public String getSliderSelected();
	public void setSliderSelected(String sliderSelected);

	public String getImage();
	public void setImage(String image);

	public String getFilePath();
	public void setFilePath(String filePath);

}
