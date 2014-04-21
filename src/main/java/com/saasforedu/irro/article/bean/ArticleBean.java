package com.saasforedu.irro.article.bean;

import java.util.ArrayList;
import java.util.List;

public class ArticleBean {

	Long id;
	String title;
	String description;
	String content;
	Long referenceArticleId;
	
	List<AttachmentBean> attachmentBeans = new ArrayList<AttachmentBean>();
	
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<AttachmentBean> getAttachmentBeans() {
		return attachmentBeans;
	}

	public void setAttachmentBeans(List<AttachmentBean> attachmentBeans) {
		this.attachmentBeans = attachmentBeans;
	}

	public Long getReferenceArticleId() {
		return referenceArticleId;
	}

	public void setReferenceArticleId(Long referenceArticleId) {
		this.referenceArticleId = referenceArticleId;
	}
}
