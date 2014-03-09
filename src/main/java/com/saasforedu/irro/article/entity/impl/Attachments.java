package com.saasforedu.irro.article.entity.impl;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.saasforedu.irro.article.entity.IAttachments;

@Entity
@Table(name = "ATTACHMENT")
public class Attachments implements IAttachments {

	@Id
	@GeneratedValue
	@Column(name = "ATTACH_ID")
	private Long id;

	@Column(name = "NAME")
	private String name;

	@Column(name = "TYPE")
	private String type;

	@Column(name = "LOC")
	private String location;

	@Column(name = "IS_ACTIVE")
	private boolean active;

	@ManyToOne
	@JoinColumn(name = "ARTICLE_ID", nullable = false)
	private Article article;

	@Override
	public String getName() {
		return name;
	}

	@Override
	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String getType() {
		return type;
	}

	@Override
	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String getLocation() {
		return location;
	}

	@Override
	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public boolean getActive() {
		return active;
	}

	@Override
	public void setActive(boolean active) {
		this.active = active;
	}

	@Override
	public Article getArticle() {
		return article;
	}

	@Override
	public void setArticle(Article article) {
		this.article = article;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	

}
