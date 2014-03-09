package com.saasforedu.irro.article.entity;

import com.saasforedu.irro.article.entity.impl.Article;
import com.saasforedu.irro.model.IBaseEntity;

public interface IAttachments extends IBaseEntity {

	public abstract String getName();

	public abstract void setName(String name);

	public abstract String getType();

	public abstract void setType(String type);

	public abstract String getLocation();

	public abstract void setLocation(String location);

	public abstract boolean getActive();

	public abstract void setActive(boolean active);

	public abstract Article getArticle();

	public abstract void setArticle(Article article);
	
	public abstract Long getId();

	public abstract void setId(Long id);

}