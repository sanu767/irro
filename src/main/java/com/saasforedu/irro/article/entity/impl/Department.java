package com.saasforedu.irro.article.entity.impl;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.hibernate.annotations.Target;

import com.saasforedu.irro.article.entity.IDepartment;

@Entity
@Table(name = "DEPARTMENT")
public class Department implements IDepartment {

	@Id
	@GeneratedValue
	@Column(name = "DEPT_ID")
	private Long id;

	@Embedded
	@Target(value = Types.class)
	Types types;
	
	@OneToOne(cascade = CascadeType.ALL )
	private Article article;

	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "article"))
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ARTICLE_ID", unique = true, nullable = false)
	private Long articleId;

	@Override
	public Integer getType() {
		return this.types.getType();
	}

	@Override
	public void setType(Integer departmentType) {
		this.types.setType(departmentType);
	}

	@Override
	public Integer getContentType() {
		return this.types.getContentType();
	}

	@Override
	public void setContentType(Integer departmentContentType) {
		this.types.setContentType(departmentContentType);
	}

	@Override
	public Article getArticle() {
		return article;
	}

	@Override
	public void setArticle(Article article) {
		this.article = article;
	}

	@Override
	public Long getId() {
		return id;
	}

	@Override
	public Long getArticleId() {
		return articleId;
	}

}
