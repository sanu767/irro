package com.saasforedu.irro.article.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.saasforedu.irro.article.bean.ArticleBean;
import com.saasforedu.irro.article.bean.AttachmentBean;

public interface IArticleService {
	public Long createArticle(ArticleBean article, String menuName, String parentName);
	public void updateArticle(ArticleBean article);
	public void deleteArticle(ArticleBean article, String menuName, String parentMenuName, String serverPath);
	public List<ArticleBean> findArticles(String menuName, String parentMenuName);
	public ArticleBean findById(Long articleId);
	
	/** Attachment Methods */
	public AttachmentBean doUploadArticleFile(String fileName, String contentType, String menuName, String parentMenuName, 
			File file, String serverPath) throws IOException;	
	public void removeAttachment(AttachmentBean selectedFileAttachmentId, String serverPath, String menuName, String parentMenuName);
	
	
}
