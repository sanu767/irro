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

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.hibernate.annotations.Target;

import com.saasforedu.irro.model.impl.MainContent;
import com.saasforedu.irro.model.projects.IBasic;

/**
 * @author sanket
 * 
 */

@Entity
@Table(name = "BASIC")
public class Basic implements IBasic {

	@Id
	@GeneratedValue
	@Column(name = "BASIC_ID")
	private Long id;

	@Embedded
	@Target(value = MainContent.class)
	MainContent content;

	@OneToOne
	@PrimaryKeyJoinColumn
	private Project project;
	
	@GenericGenerator(name = "generator", strategy = "foreign", 
			parameters = @Parameter(name = "property", value = "project"))
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "PROJECT_ID", unique = true, nullable = false)
	private Long projectId;

	@Override
	public Long getId() {
		return id;
	}
	
	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}

	public MainContent getContent() {
		return content;
	}

	public void setContent(MainContent content) {
		this.content = content;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	
}
