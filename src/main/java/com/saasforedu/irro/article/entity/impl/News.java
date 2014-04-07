/**
 * 
 */
package com.saasforedu.irro.article.entity.impl;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.saasforedu.irro.article.entity.INews;
import com.saasforedu.irro.model.INewsAttachment;
import com.saasforedu.irro.model.impl.NewsAttachment;

/**
 * @author sanket
 * 
 */

@Entity
@Table(name = "NEWS")
public class News implements INews {

	@Id
	@GeneratedValue
	@Column(name = "NEWS_ID")
	private Long id;
	
	@Column(name = "TITLE")
	private String title;

	@Column(name = "DESCRIPTION")
	private String shortDescription;

	@Lob
	@Column(name = "CONTENT")
	private String mainContent;
	
	@Column(name = "START_DATE")
	private Date startDate;
	
	@Column(name = "END_DATE")
	private Date endDate;
	
	@Column(name = "IS_SLIDER")
	private boolean sliderItem;
	
	@Column(name = "SLIDER_IMAGE")
	private String sliderImage;
	
	@Column(name = "IS_SHOW_HOME")
	private boolean showInHomePage;
	
	@Column(name = "REF_ARTICLE_ID")
	private Long referenceArticleId;

	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.EAGER, targetEntity=NewsAttachment.class, mappedBy="news")
	List<INewsAttachment> newsAttachments;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getMainContent() {
		return mainContent;
	}

	public void setMainContent(String mainContent) {
		this.mainContent = mainContent;
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

	public boolean isSliderItem() {
		return sliderItem;
	}

	public void setSliderItem(boolean sliderItem) {
		this.sliderItem = sliderItem;
	}

	public String getSliderImage() {
		return sliderImage;
	}

	public void setSliderImage(String sliderImage) {
		this.sliderImage = sliderImage;
	}

	public boolean isShowInHomePage() {
		return showInHomePage;
	}

	public void setShowInHomePage(boolean showInHomePage) {
		this.showInHomePage = showInHomePage;
	}

	public Long getReferenceArticleId() {
		return referenceArticleId;
	}

	public void setReferenceArticleId(Long referenceArticleId) {
		this.referenceArticleId = referenceArticleId;
	}

	public List<INewsAttachment> getNewsAttachments() {
		return newsAttachments;
	}

	public void setNewsAttachments(List<INewsAttachment> newsAttachments) {
		this.newsAttachments = newsAttachments;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((endDate == null) ? 0 : endDate.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((mainContent == null) ? 0 : mainContent.hashCode());
		result = prime * result
				+ ((newsAttachments == null) ? 0 : newsAttachments.hashCode());
		result = prime
				* result
				+ ((referenceArticleId == null) ? 0 : referenceArticleId
						.hashCode());
		result = prime
				* result
				+ ((shortDescription == null) ? 0 : shortDescription.hashCode());
		result = prime * result + (showInHomePage ? 1231 : 1237);
		result = prime * result
				+ ((sliderImage == null) ? 0 : sliderImage.hashCode());
		result = prime * result + (sliderItem ? 1231 : 1237);
		result = prime * result
				+ ((startDate == null) ? 0 : startDate.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		News other = (News) obj;
		if (endDate == null) {
			if (other.endDate != null)
				return false;
		} else if (!endDate.equals(other.endDate))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (mainContent == null) {
			if (other.mainContent != null)
				return false;
		} else if (!mainContent.equals(other.mainContent))
			return false;
		if (newsAttachments == null) {
			if (other.newsAttachments != null)
				return false;
		} else if (!newsAttachments.equals(other.newsAttachments))
			return false;
		if (referenceArticleId == null) {
			if (other.referenceArticleId != null)
				return false;
		} else if (!referenceArticleId.equals(other.referenceArticleId))
			return false;
		if (shortDescription == null) {
			if (other.shortDescription != null)
				return false;
		} else if (!shortDescription.equals(other.shortDescription))
			return false;
		if (showInHomePage != other.showInHomePage)
			return false;
		if (sliderImage == null) {
			if (other.sliderImage != null)
				return false;
		} else if (!sliderImage.equals(other.sliderImage))
			return false;
		if (sliderItem != other.sliderItem)
			return false;
		if (startDate == null) {
			if (other.startDate != null)
				return false;
		} else if (!startDate.equals(other.startDate))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}
}
