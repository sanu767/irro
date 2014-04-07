package com.saasforedu.irro.article.dao;

import java.util.List;

import com.saasforedu.irro.article.entity.IArticle;
import com.saasforedu.irro.article.entity.impl.Article;
import com.saasforedu.irro.dao.IBaseDAO;
import com.saasforedu.irro.model.IArticleAttachment;

public interface IArticleDAO extends IBaseDAO<Article>{
	public void deleteArticle(IArticle article);
	public List<IArticle> findByRefereceArticleId(Long referenceArticleId);
	public void update(IArticle article, List<IArticleAttachment> removedAttachments);
}
