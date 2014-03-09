package com.saasforedu.irro.article.dao;

import java.util.List;

import com.saasforedu.irro.article.entity.IArticle;
import com.saasforedu.irro.article.entity.IDepartment;

public interface IDepartmentDAO {
	public List<IArticle> findArticles(int departmentType, int departmentContentType);
	public Long createArticle(IDepartment department);
	public void updateArticle(IArticle article);
	public void deleteArticle(Long articleId);
	public IArticle findById(Long articleId);
	
}
