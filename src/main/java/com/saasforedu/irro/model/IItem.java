package com.saasforedu.irro.model;

import java.util.Date;
import java.util.List;


public interface IItem extends IBaseEntity {
	
	public String getTitle() ;
	public void setTitle(String title);
	
	public Date getStartDate();
	public void setStartDate(Date startDate);
	
	public Date getEndDate();
	public void setEndDate(Date endDate);
	
	public String getMainContent() ;
	public void setMainContent(String content);

	public String getShortDescription();
	public void setShortDescription(String description) ;

	public boolean isSliderItem();
	public void setSliderItem(boolean sliderItem);

	public String getSliderImage() ;
	public void setSliderImage(String sliderImage);

	public boolean isShowInHomePage();
	public void setShowInHomePage(boolean showInHomePage);

	public String getUrl();
	public void setUrl(String url);

	public Long getId();
	
	public List<IItemAttachment> getItemAttachments();
	public void setItemAttachments(List<IItemAttachment> itemAttachments);
}
