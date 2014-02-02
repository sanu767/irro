/**
 * 
 */
package com.saasforedu.irro.model.impl;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import com.saasforedu.irro.model.IEvent;

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
	
	@Column(name = "DATE")
	private Date date;

	@Column(name = "TYPE")
	private String type;

	@Column(name = "URL")
	private String url;

	@Column(name = "TITLE")
	private String title;
	
	@Column(name = "DESCRIPTION")
	private String description;

	@Override
	public Long getId() {
		return id;
	}
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Event [date=" + date + ", type=" + type + ", url=" + url
				+ ", title=" + title + ", description=" + description + "]";
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
