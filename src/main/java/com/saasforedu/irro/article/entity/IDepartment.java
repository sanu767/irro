package com.saasforedu.irro.article.entity;

import com.saasforedu.irro.article.entity.impl.Article;
import com.saasforedu.irro.model.IBaseEntity;

public interface IDepartment extends IBaseEntity {

	public abstract Integer getType();

	public abstract void setType(Integer departmentType);

	public abstract Integer getContentType();

	public abstract void setContentType(Integer departmentContentType);

	public abstract Article getArticle();

	public abstract void setArticle(Article article);

	public abstract Long getArticleId();

}