package com.saasforedu.irro.model.news.impl;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.saasforedu.irro.model.news.INews;

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
	Long newsId;

	@Column(name = "ANNOUNCEMENT")
	String announcement;

	@Column(name = "ARCHIVE")
	String archive;

	@Override
	public Long getId() {
		return newsId;
	}

	public String getAnnouncement() {
		return announcement;
	}

	public void setAnnouncement(String announcement) {
		this.announcement = announcement;
	}

	public String getArchive() {
		return archive;
	}

	public void setArchive(String archive) {
		this.archive = archive;
	}

}
