package com.saasforedu.irro.xmlelements;
import java.util.Date;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

@XmlType(propOrder = { "date", "type", "url", "title", "description" })
public class EventElement {

	private String url;
	private String type;
	private Date date;
	private String title;
	private String description;

	public String getUrl() {
		return url;
	}

	@XmlAttribute
	public void setUrl(String url) {
		this.url = url;
	}

	public String getType() {
		return type;
	}

	@XmlAttribute
	public void setType(String type) {
		this.type = type;
	}

	public Date getDate() {
		return date;
	}

	@XmlAttribute
	public void setDate(Date date) {
		this.date = date;
	}

	public String getTitle() {
		return title;
	}

	@XmlElement
	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	@XmlElement
	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "EventElement [date=" + date + ", type=" + type + ", url=" + url
				+ ", title=" + title + ", description=" + description + "]";
	}

}
