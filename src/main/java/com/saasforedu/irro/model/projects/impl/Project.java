/**
 * 
 */
package com.saasforedu.irro.model.projects.impl;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Target;

import com.saasforedu.irro.model.impl.MainContent;
import com.saasforedu.irro.model.projects.IProject;

/**
 * @author sanket
 * 
 */

@Entity
@Table(name = "PROJECT")
public class Project implements IProject {

	
	@Id
	@GeneratedValue
	@Column(name = "PROJECT_ID")
	Long projectId;
	
	@Embedded
	@Target(value = MainContent.class)
	MainContent content;
	
	@OneToOne(targetEntity = Basic.class, mappedBy="project", cascade=CascadeType.ALL, fetch = FetchType.LAZY)
	Basic basic;
	
	@OneToOne(targetEntity = ContinuingEducation.class, mappedBy="project", cascade=CascadeType.ALL, fetch = FetchType.LAZY)
	ContinuingEducation continuingEducation;
	
	@OneToOne(targetEntity = Sverdlovsk.class, mappedBy="project", cascade=CascadeType.ALL, fetch = FetchType.LAZY)
	Sverdlovsk sv;

	@Override
	public Long getId() {
		return projectId;
	}
	
	public MainContent getContent() {
		return content;
	}

	public void setContent(MainContent content) {
		this.content = content;
	}

	public Basic getBasic() {
		return basic;
	}

	public void setBasic(Basic basic) {
		this.basic = basic;
	}

	public ContinuingEducation getContinuingEducation() {
		return continuingEducation;
	}

	public void setContinuingEducation(ContinuingEducation continuingEducation) {
		this.continuingEducation = continuingEducation;
	}

	public Sverdlovsk getSv() {
		return sv;
	}

	public void setSv(Sverdlovsk sv) {
		this.sv = sv;
	}
	
}
