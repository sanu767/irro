package com.saasforedu.irro.dao.impl;

import java.util.List;

import com.saasforedu.irro.dao.FileArticleDAO;
import com.saasforedu.irro.model.IFileArticle;
import com.saasforedu.irro.model.impl.FileArticle;

public class FileArticleDAOImpl extends BaseDAOimpl<FileArticle> implements FileArticleDAO {

	@Override
	public void deleteFile(IFileArticle fileArticle) {
		getHibernateTemplate().delete(fileArticle);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<IFileArticle> findByIds(List<Long> fileArticleIds) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from FileArticle u where u.id in  (:listParam) ");
		String[] params = { "listParam" };
		Object [] values = {fileArticleIds};
		List<IFileArticle> files = getHibernateTemplate().findByNamedParam(queryBuilder.toString(), 
				params, values);
		return files;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<IFileArticle> findAll() {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from FileArticle u ");
		List<IFileArticle> files = getHibernateTemplate().find(queryBuilder.toString());
		return files;
	}
}
