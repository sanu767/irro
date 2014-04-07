package com.saasforedu.irro.model.impl;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.saasforedu.irro.article.entity.IArticle;
import com.saasforedu.irro.article.entity.impl.Article;
import com.saasforedu.irro.model.IArticleAttachment;

@Entity
@Table(name = "ARTICLE_ATTACHMENT")
public class ArticleAttachment implements IArticleAttachment {

	@Id
	@GeneratedValue
	@Column(name = "FILE_ID")
	Long id;
	
	@Column(name = "FILE_NAME")
	String fileName;

	@Column(name = "FILE_TYPE")
	String fileType;

	@Column(name = "LOCATION")
	String location;
	
	@Column(name = "IS_ACTIVE")
	boolean active;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="ARTICLE_ID")
	Article article;
	
	
	public Long getId() {
		return id;
	}
	
	@Override
	public void setId(Long id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public IArticle getArticle() {
		return article;
	}

	public void setArticle(IArticle article) {
		this.article = (Article)article;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (active ? 1231 : 1237);
		result = prime * result + ((article == null) ? 0 : article.hashCode());
		result = prime * result
				+ ((fileName == null) ? 0 : fileName.hashCode());
		result = prime * result
				+ ((fileType == null) ? 0 : fileType.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((location == null) ? 0 : location.hashCode());
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
		ArticleAttachment other = (ArticleAttachment) obj;
		if (active != other.active)
			return false;
		if (article == null) {
			if (other.article != null)
				return false;
		} else if (!article.equals(other.article))
			return false;
		if (fileName == null) {
			if (other.fileName != null)
				return false;
		} else if (!fileName.equals(other.fileName))
			return false;
		if (fileType == null) {
			if (other.fileType != null)
				return false;
		} else if (!fileType.equals(other.fileType))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (location == null) {
			if (other.location != null)
				return false;
		} else if (!location.equals(other.location))
			return false;
		return true;
	}
}