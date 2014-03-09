package com.saasforedu.irro.article.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.saasforedu.irro.article.dao.IDepartmentDAO;
import com.saasforedu.irro.article.entity.IArticle;
import com.saasforedu.irro.article.entity.IDepartment;
import com.saasforedu.irro.article.entity.impl.Article;
import com.saasforedu.irro.article.entity.impl.Department;

public class DepartmentDAO extends HibernateDaoSupport implements IDepartmentDAO {
	
	@SuppressWarnings("unchecked")
	@Override
	public List<IArticle> findArticles(int departmentType,
			int departmentContentType) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select a from Article where a.id in (" +
				"select i.articleId from Department i where i.type = ? and where i.contentType = ? ) ");
		List<IArticle> resultItems = 
				getHibernateTemplate().find(
						queryBuilder.toString(), 
						new Object [] {departmentType, departmentContentType});
		return resultItems;
	}

	@Override
	public Long createArticle(IDepartment department) {
		return (Long)getHibernateTemplate().save(department);
	}

	@Override
	public void updateArticle(IArticle article) {
		getHibernateTemplate().update(article);
	}

	@Override
	public void deleteArticle(Long articleId) {
		IDepartment item = (IDepartment)getHibernateTemplate().get(Department.class, articleId);
		getHibernateTemplate().delete(item);
	}

	@Override
	public IArticle findById(Long articleId) {
		return (IArticle)getHibernateTemplate().get(Article.class, articleId);
	}
	
}
