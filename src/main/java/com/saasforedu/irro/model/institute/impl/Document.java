/**
 * 
 */
package com.saasforedu.irro.model.institute.impl;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.hibernate.annotations.Target;

import com.saasforedu.irro.model.impl.MainContent;
import com.saasforedu.irro.model.institute.IDocument;

/**
 * @author sanket
 * 
 */

@Entity
@Table(name = "DOCUMENT")
public class Document implements IDocument {

	@Id
	@GeneratedValue
	@Column(name = "DOC_ID")
	private Long id;
	
	@Embedded
	@Target(value = MainContent.class)
	MainContent content;
	
	@Column(name = "LIC")
	String license;
	
	@Column(name = "CONSTI")
	String constitution;
	
	@Column(name = "SUP_BOARD")
	String supervisoryBoard;
	
	@Column(name = "EDU_SERV")
	String paidEducationalServices;
	
	@Column(name = "LAW_REG")
	String labourLawRegulations;
	
	@Column(name = "MEASURES")
	String controlMeasures;
	
	@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	Institute institute;
	
	@GenericGenerator(name = "generator", strategy = "foreign", 
			parameters = @Parameter(name = "property", value = "institute"))
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "INST_ID", unique = true, nullable = false)
	private Long instId;
	
	@Override
	public Long getId() {
		return id;
	}

	public Long getInstId() {
		return instId;
	}

	public void setInstId(Long instId) {
		this.instId = instId;
	}

	public MainContent getContent() {
		return content;
	}

	public void setContent(MainContent content) {
		this.content = content;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public String getConstitution() {
		return constitution;
	}

	public void setConstitution(String constitution) {
		this.constitution = constitution;
	}

	public String getSupervisoryBoard() {
		return supervisoryBoard;
	}

	public void setSupervisoryBoard(String supervisoryBoard) {
		this.supervisoryBoard = supervisoryBoard;
	}

	public String getPaidEducationalServices() {
		return paidEducationalServices;
	}

	public void setPaidEducationalServices(String paidEducationalServices) {
		this.paidEducationalServices = paidEducationalServices;
	}

	public String getLabourLawRegulations() {
		return labourLawRegulations;
	}

	public void setLabourLawRegulations(String labourLawRegulations) {
		this.labourLawRegulations = labourLawRegulations;
	}

	public String getControlMeasures() {
		return controlMeasures;
	}

	public void setControlMeasures(String controlMeasures) {
		this.controlMeasures = controlMeasures;
	}

	public Institute getInstitute() {
		return institute;
	}

	public void setInstitute(Institute institute) {
		this.institute = institute;
	}

}
