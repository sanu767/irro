package com.saasforedu.irro.article.bean;

import java.util.List;

public class ArticleBean {

	private Long articleId;
	private String title;
	private String description;
	private String content;
	
	private List<AttachmentBean> attachmentBeans;
	
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

	public Long getArticleId() {
		return articleId;
	}

	public void setArticleId(Long articleId) {
		this.articleId = articleId;
	}

	public List<AttachmentBean> getAttachmentBeans() {
		return attachmentBeans;
	}

	public void setAttachmentBeans(List<AttachmentBean> attachmentBeans) {
		this.attachmentBeans = attachmentBeans;
	}

}
