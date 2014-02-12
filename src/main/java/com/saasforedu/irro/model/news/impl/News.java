package com.saasforedu.irro.model.news.impl;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Target;

import com.saasforedu.irro.model.impl.MainContent;
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

	@Embedded
	@Target(value = MainContent.class)
	MainContent content;
	
	@Column(name = "ANNOUNCEMENT")
	String announcement;

	@Column(name = "ARCHIVE")
	String archive;

	@Override
	public Long getId() {
		return newsId;
	}

	public MainContent getContent() {
		return content;
	}

	public void setContent(MainContent content) {
		this.content = content;
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
