package com.saasforedu.irro.article.entity;

import java.util.Date;
import java.util.List;

import com.saasforedu.irro.model.IArticleAttachment;
import com.saasforedu.irro.model.IBaseEntity;

public interface IArticle extends IBaseEntity {

	public abstract String getTitle();
	public abstract void setTitle(String title);

	public abstract String getShortDescription();
	public abstract void setShortDescription(String shortDescription);

	public abstract String getMainContent();
	public abstract void setMainContent(String mainContent);

	public Long getReferenceArticleId();
	public void setReferenceArticleId(Long referenceArticleId);
	
	public Long getId();
	
	public Date getModificationDate();
	public void setModificationDate(Date modificationDate);
	
	public List<IArticleAttachment> getArticleAttachments();
	public void setArticleAttachments(List<IArticleAttachment> articleAttachments);
}