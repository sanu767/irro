package com.saasforedu.irro.article.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.saasforedu.irro.article.bean.ArticleBean;
import com.saasforedu.irro.article.bean.AttachmentBean;

public interface IArticleService {
	public Long createArticle(ArticleBean article, Long menuId, Long parentName);
	public void updateArticle(ArticleBean article);
	public void deleteArticle(ArticleBean article, Long menuId, Long parentMenuId, String serverPath);
	public List<ArticleBean> findArticles(Long menuId, Long parentMenuId);
	public ArticleBean findById(Long articleId);
	
	/** Attachment Methods */
	public AttachmentBean doUploadArticleFile(String fileName, String contentType, Long menuId, Long parentMenuId, 
			File file, String serverPath) throws IOException;	
	public void removeAttachment(AttachmentBean selectedFileAttachmentId, String serverPath, Long menuId, Long parentMenuId);
	
	
}
