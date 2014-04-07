package com.saasforedu.irro.article.entity;

import java.util.Date;
import java.util.List;

import com.saasforedu.irro.model.IBaseEntity;
import com.saasforedu.irro.model.INewsAttachment;


public interface INews extends IBaseEntity {
	
	public Long getId();
	public void setId(Long id);

	public String getTitle();
	public void setTitle(String title);

	public String getShortDescription();
	public void setShortDescription(String shortDescription);

	public String getMainContent();
	public void setMainContent(String mainContent);

	public Date getStartDate();
	public void setStartDate(Date startDate);

	public Date getEndDate();
	public void setEndDate(Date endDate);

	public boolean isSliderItem();
	public void setSliderItem(boolean sliderItem);

	public String getSliderImage();
	public void setSliderImage(String sliderImage);

	public boolean isShowInHomePage();
	public void setShowInHomePage(boolean showInHomePage);

	public Long getReferenceArticleId();
	public void setReferenceArticleId(Long referenceArticleId);
	
	public List<INewsAttachment> getNewsAttachments();
	public void setNewsAttachments(List<INewsAttachment> newsAttachments);
}
