package com.saasforedu.irro.article.dao.impl;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.saasforedu.irro.article.dao.IArticleDAO;
import com.saasforedu.irro.article.entity.IArticle;
import com.saasforedu.irro.article.entity.impl.Article;
import com.saasforedu.irro.dao.impl.BaseDAOimpl;
import com.saasforedu.irro.model.IArticleAttachment;

public class ArticleDAOImpl extends BaseDAOimpl<Article> implements IArticleDAO {
	
	@Override
	public void deleteArticle(IArticle article) {
		getHibernateTemplate().delete(article);		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<IArticle> findByRefereceArticleId(Long referenceArticleId) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from Article u where u.referenceArticleId =  ? ");
		queryBuilder.append(" order by u.modificationDate DESC");
		List<IArticle> resultArticles = getHibernateTemplate().find(queryBuilder.toString(), referenceArticleId);
		return resultArticles;
	}
	
	@Override
	public void update(IArticle article, List<IArticleAttachment> removedAttachments) {
		deleteAttachments(removedAttachments);
		super.update((Article)article);
	}
	
	private void deleteAttachments(List<IArticleAttachment> removedAttachments) {
		if(CollectionUtils.isNotEmpty(removedAttachments)) {
			getHibernateTemplate().deleteAll(removedAttachments);
		}
	}
}