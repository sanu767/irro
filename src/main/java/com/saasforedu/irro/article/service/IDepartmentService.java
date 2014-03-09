package com.saasforedu.irro.article.service;

import java.util.List;

import com.saasforedu.irro.article.bean.ArticleBean;
import com.saasforedu.irro.article.bean.DepartmentBean;
import com.saasforedu.irro.article.entity.IArticle;

public interface IDepartmentService {

	public void create(DepartmentBean departmentBean, ArticleBean articleBean);
	
	public void delete(Long articleId);
	
	public void update(ArticleBean articleBean);
	
	public List<IArticle> findArticles(DepartmentBean departmentBean);

}
