package com.saasforedu.irro.article.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.saasforedu.irro.article.bean.ArticleBean;
import com.saasforedu.irro.article.bean.DepartmentBean;
import com.saasforedu.irro.article.entity.IArticle;
import com.saasforedu.irro.article.service.IDepartmentService;

public class DepartmentAction extends ActionSupport {

	private static final long serialVersionUID = 9003088289340318685L;

	private DepartmentBean departmentBean;
	
	private ArticleBean articleBean;
	
	private IDepartmentService departmentService;

	public String create() {
		departmentService.create(departmentBean, articleBean);
		return SUCCESS;
	}

	public void delete() {
		departmentService.delete(articleBean.getArticleId());
	}

	public List<IArticle> load() {
		return departmentService.findArticles(departmentBean);
	}
}
