/**
 * 
 */
package com.saasforedu.irro.model.certifications.impl;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Target;

import com.saasforedu.irro.model.certifications.IGraduate;
import com.saasforedu.irro.model.impl.MainContent;

/**
 * @author sanket
 * 
 */

@Entity
@Table(name = "GRADUATE")
public class Graduate implements IGraduate {

	@Id
	@GeneratedValue
	@Column(name = "EMP_ID")
	private Long id;

	@Embedded
	@Target(value = MainContent.class)
	MainContent content;

	@Column(name = "TYP")
	Integer type;

	@Column(name = "TYP_NAME")
	String typeName;

	@Column(name = "REG_DOCUMENT")
	String regulatoryDocument;

	@Column(name = "STATS")
	String statistics;

	@Column(name = "ANALYTICS")
	String analytics;

	@ManyToOne(targetEntity = Certificate.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "CE_ID", nullable = false)
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

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getRegulatoryDocument() {
		return regulatoryDocument;
	}

	public void setRegulatoryDocument(String regulatoryDocument) {
		this.regulatoryDocument = regulatoryDocument;
	}

	public String getStatistics() {
		return statistics;
	}

	public void setStatistics(String statistics) {
		this.statistics = statistics;
	}

	public String getAnalytics() {
		return analytics;
	}

	public void setAnalytics(String analytics) {
		this.analytics = analytics;
	}

	public Certificate getCert() {
		return cert;
	}

	public void setCert(Certificate cert) {
		this.cert = cert;
	}

}
