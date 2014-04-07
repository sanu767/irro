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

import com.saasforedu.irro.article.entity.IArticle;
import com.saasforedu.irro.model.IArticleAttachment;
import com.saasforedu.irro.model.impl.ArticleAttachment;

@Entity
@Table(name = "ARTICLE")
public class Article implements IArticle {

	@Id
	@GeneratedValue
	@Column(name = "ARTICLE_ID")
	private Long id;

	@Column(name = "TITLE")
	private String title;

	@Column(name = "DESCRIPTION")
	private String shortDescription;

	@Lob
	@Column(name = "CONTENT")
	private String mainContent;
	
	@Column(name = "REF_ARTICLE_ID")
	private Long referenceArticleId;
	
	@Column(name = "MODIFICATION_DATE")
	private Date modificationDate;
	
	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.EAGER, targetEntity=ArticleAttachment.class, mappedBy="article")
	List<IArticleAttachment> articleAttachments;

	@Override
	public String getTitle() {
		return title;
	}

	@Override
	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String getShortDescription() {
		return shortDescription;
	}

	@Override
	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	@Override
	public String getMainContent() {
		return mainContent;
	}

	@Override
	public void setMainContent(String mainContent) {
		this.mainContent = mainContent;
	}

	@Override
	public Long getId() {
		return id;
	}

	public Long getReferenceArticleId() {
		return referenceArticleId;
	}

	public void setReferenceArticleId(Long referenceArticleId) {
		this.referenceArticleId = referenceArticleId;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getModificationDate() {
		return modificationDate;
	}

	public void setModificationDate(Date modificationDate) {
		this.modificationDate = modificationDate;
	}

	public List<IArticleAttachment> getArticleAttachments() {
		return articleAttachments;
	}

	public void setArticleAttachments(List<IArticleAttachment> articleAttachments) {
		this.articleAttachments = articleAttachments;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime
				* result
				+ ((articleAttachments == null) ? 0 : articleAttachments
						.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((mainContent == null) ? 0 : mainContent.hashCode());
		result = prime
				* result
				+ ((modificationDate == null) ? 0 : modificationDate.hashCode());
		result = prime
				* result
				+ ((referenceArticleId == null) ? 0 : referenceArticleId
						.hashCode());
		result = prime
				* result
				+ ((shortDescription == null) ? 0 : shortDescription.hashCode());
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
		Article other = (Article) obj;
		if (articleAttachments == null) {
			if (other.articleAttachments != null)
				return false;
		} else if (!articleAttachments.equals(other.articleAttachments))
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
		if (modificationDate == null) {
			if (other.modificationDate != null)
				return false;
		} else if (!modificationDate.equals(other.modificationDate))
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
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}
	
}
