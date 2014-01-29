/**
 * 
 */
package com.saasforedu.irro.model.projects.impl;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.Target;

import com.saasforedu.irro.model.impl.MainContent;
import com.saasforedu.irro.model.projects.IContinuingEducation;

/**
 * @author sanket
 * 
 */

@Entity
@Table(name = "CONTINUING_EDUCATION")
public class ContinuingEducation implements IContinuingEducation {

	@Id
	@GeneratedValue
	@Column(name = "CE_ID")
	private Long id;
	
	@Embedded
	@Target(value = MainContent.class)
	MainContent content;
	
	@Column(name="PLAN")
	String actionPlan;
	
	@Column(name="SUPPORT")
	String support;
	
	@Column(name="NEWS")
	String news;

	@OneToOne
	@PrimaryKeyJoinColumn
	private Project project;
	
	@Override
	public Long getId() {
		return id;
	}
	
	public MainContent getContent() {
		return content;
	}

	public void setContent(MainContent content) {
		this.content = content;
	}

	public String getActionPlan() {
		return actionPlan;
	}

	public void setActionPlan(String actionPlan) {
		this.actionPlan = actionPlan;
	}

	public String getSupport() {
		return support;
	}

	public void setSupport(String support) {
		this.support = support;
	}

	public String getNews() {
		return news;
	}

	public void setNews(String news) {
		this.news = news;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	
}
