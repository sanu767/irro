package com.saasforedu.irro.article.service.impl;

import java.util.List;

import com.saasforedu.irro.article.bean.ArticleBean;
import com.saasforedu.irro.article.bean.AttachmentBean;
import com.saasforedu.irro.article.bean.DepartmentBean;
import com.saasforedu.irro.article.dao.IDepartmentDAO;
import com.saasforedu.irro.article.entity.IArticle;
import com.saasforedu.irro.article.entity.IAttachments;
import com.saasforedu.irro.article.entity.IDepartment;
import com.saasforedu.irro.article.entity.impl.Article;
import com.saasforedu.irro.article.entity.impl.Attachments;
import com.saasforedu.irro.article.entity.impl.Department;
import com.saasforedu.irro.article.service.IDepartmentService;

public class DepartmentService implements IDepartmentService {
	
	private IDepartmentDAO departmentDAO;

	@Override
	public void create(DepartmentBean departmentBean, ArticleBean articleBean) {
		
		IDepartment department = new Department();
		department.setContentType(departmentBean.getContentType());
		department.setType(departmentBean.getType());
		
		Article article = new Article();
		article.setDepartment(department);
		article.setMainContent(articleBean.getContent());
		article.setShortDescription(articleBean.getDescription());
		article.setTitle(articleBean.getTitle());
		
		List<AttachmentBean> attachmentBeans = articleBean.getAttachmentBeans();
        for (AttachmentBean attachmentBean : attachmentBeans) {
			IAttachments attachments = new Attachments();
			attachments.setActive(attachmentBean.isActive());
			attachments.setArticle(article);
			//Set location
			//attachments.setLocation(attachmentBean.get)
			attachments.setName(attachmentBean.getName());
			attachments.setType(attachmentBean.getType());
			attachments.setId(attachmentBean.getAttachmentId());
		}
		
		
		department.setArticle(article);
		departmentDAO.createArticle(department);
	}

	@Override
	public void delete(Long articleId) {
		departmentDAO.deleteArticle(articleId);
	}

	@Override
	public void update(ArticleBean articleBean) {
		IArticle article = departmentDAO.findById(articleBean.getArticleId());
		article.setTitle(articleBean.getTitle());
		article.setShortDescription(articleBean.getDescription());
		article.setMainContent(articleBean.getContent());
		departmentDAO.updateArticle(article);
	}

	@Override
	public List<IArticle> findArticles(DepartmentBean departmentBean) {
		return departmentDAO.findArticles(departmentBean.getType(), departmentBean.getContentType());
	}
}
