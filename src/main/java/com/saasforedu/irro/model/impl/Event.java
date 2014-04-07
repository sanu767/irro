/**
 * 
 */
package com.saasforedu.irro.model.impl;

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

import com.saasforedu.irro.model.IEvent;
import com.saasforedu.irro.model.IEventAttachment;

/**
 * @author sanket
 * 
 */

@Entity
@Table(name = "EVENT")
public class Event implements IEvent {

	@Id
	@GeneratedValue
	@Column(name = "EVENT_ID")
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
	
	@Column(name = "URL")
	private String url;
	
	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.EAGER, targetEntity=EventAttachment.class, mappedBy="event")
	List<IEventAttachment> eventAttachments;
	
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Long getId() {
		return id;
	}

	public List<IEventAttachment> getEventAttachments() {
		return eventAttachments;
	}

	public void setEventAttachments(List<IEventAttachment> eventAttachments) {
		this.eventAttachments = eventAttachments;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((mainContent == null) ? 0 : mainContent.hashCode());
		result = prime * result
				+ ((shortDescription == null) ? 0 : shortDescription.hashCode());
		result = prime * result + ((endDate == null) ? 0 : endDate.hashCode());
		result = prime
				* result
				+ ((eventAttachments == null) ? 0 : eventAttachments.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + (showInHomePage ? 1231 : 1237);
		result = prime * result
				+ ((sliderImage == null) ? 0 : sliderImage.hashCode());
		result = prime * result + (sliderItem ? 1231 : 1237);
		result = prime * result
				+ ((startDate == null) ? 0 : startDate.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((url == null) ? 0 : url.hashCode());
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
		Event other = (Event) obj;
		if (mainContent == null) {
			if (other.mainContent != null)
				return false;
		} else if (!mainContent.equals(other.mainContent))
			return false;
		if (shortDescription == null) {
			if (other.shortDescription != null)
				return false;
		} else if (!shortDescription.equals(other.shortDescription))
			return false;
		if (endDate == null) {
			if (other.endDate != null)
				return false;
		} else if (!endDate.equals(other.endDate))
			return false;
		if (eventAttachments == null) {
			if (other.eventAttachments != null)
				return false;
		} else if (!eventAttachments.equals(other.eventAttachments))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
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
		if (url == null) {
			if (other.url != null)
				return false;
		} else if (!url.equals(other.url))
			return false;
		return true;
	}
	
}
