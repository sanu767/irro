/**
 * 
 */
package com.saasforedu.irro.model.certifications.impl;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.Target;

import com.saasforedu.irro.model.certifications.IEmployee;
import com.saasforedu.irro.model.impl.MainContent;

/**
 * @author sanket
 * 
 */

@Entity
@Table(name = "EMPLOYEE")
public class Employee implements IEmployee {

	@Id
	@GeneratedValue
	@Column(name = "EMP_ID")
	private Long id;
	
	@Embedded
	@Target(value = MainContent.class)
	MainContent content;
	
	@Column(name = "REG_DOCUMENT")
	String regulatoryDocument;
	
	@Column(name = "INFO")
	String information;
	
	@Column(name = "MATERIAL")
	String material;
	
	@OneToOne
	@PrimaryKeyJoinColumn
	Certificate cert;
	
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

	public String getRegulatoryDocument() {
		return regulatoryDocument;
	}

	public void setRegulatoryDocument(String regulatoryDocument) {
		this.regulatoryDocument = regulatoryDocument;
	}

	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public Certificate getCert() {
		return cert;
	}

	public void setCert(Certificate cert) {
		this.cert = cert;
	}

}