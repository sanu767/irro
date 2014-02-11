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
import com.saasforedu.irro.model.projects.ISverdlovsk;

/**
 * @author sanket
 * 
 */

@Entity
@Table(name = "SVERDLOVSL")
public class Sverdlovsk implements ISverdlovsk {

	@Id
	@GeneratedValue
	@Column(name = "SV_ID")
	private Long svId;

	@Embedded
	@Target(value = MainContent.class)
	MainContent content;

	@Column(name = "OPTIONAL")
	String optional;

	@Column(name = "INSTITUTION")
	String institiution;

	@Column(name = "CHILDREN")
	String children;

	@Column(name = "SCHOOL")
	String school;

	@Column(name = "EDUCATION")
	String education;

	@OneToOne
	@PrimaryKeyJoinColumn
	private Project project;

	public Long getId() {
		return svId;
	}

	public MainContent getContent() {
		return content;
	}

	public void setContent(MainContent content) {
		this.content = content;
	}

	public String getOptional() {
		return optional;
	}

	public void setOptional(String optional) {
		this.optional = optional;
	}

	public String getInstitiution() {
		return institiution;
	}

	public void setInstitiution(String institiution) {
		this.institiution = institiution;
	}

	public String getChildren() {
		return children;
	}

	public void setChildren(String children) {
		this.children = children;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

}
