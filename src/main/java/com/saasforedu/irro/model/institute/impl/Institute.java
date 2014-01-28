/**
 * 
 */
package com.saasforedu.irro.model.institute.impl;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Target;

import com.saasforedu.irro.model.activities.impl.Contest;
import com.saasforedu.irro.model.activities.impl.EducationalActivity;
import com.saasforedu.irro.model.impl.MainContent;
import com.saasforedu.irro.model.institute.IInstitute;

/**
 * @author sanket
 * 
 */

@Entity
@Table(name = "INSTITUTE")
public class Institute implements IInstitute {

	@Id
	@GeneratedValue
	@Column(name = "INST_ID")
	private Long id;

	@Embedded
	@Target(value = MainContent.class)
	MainContent content;

	@Column(name = "HISTO")
	String history;

	@Column(name = "LOGISTIC")
	String logistics;

	@Column(name = "JOBS")
	String jobs;

	@Column(name = "CONTACT")
	String contacts;

	@OneToOne(targetEntity = Rector.class, mappedBy = "institute", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	Rector rector;

	@OneToOne(targetEntity = Document.class, mappedBy = "institute", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	Document document;

	@OneToOne(targetEntity = BranchOffice.class, mappedBy = "institute", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	BranchOffice branchOffice;

	@OneToMany(targetEntity = InstituteDetails.class, mappedBy = "institute", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	List<InstituteDetails> instituteDetails;

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

	public String getHistory() {
		return history;
	}

	public void setHistory(String history) {
		this.history = history;
	}

	public String getLogistics() {
		return logistics;
	}

	public void setLogistics(String logistics) {
		this.logistics = logistics;
	}

	public String getJobs() {
		return jobs;
	}

	public void setJobs(String jobs) {
		this.jobs = jobs;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public Rector getRector() {
		return rector;
	}

	public void setRector(Rector rector) {
		this.rector = rector;
	}

	public Document getDocument() {
		return document;
	}

	public void setDocument(Document document) {
		this.document = document;
	}

	public BranchOffice getBranchOffice() {
		return branchOffice;
	}

	public void setBranchOffice(BranchOffice branchOffice) {
		this.branchOffice = branchOffice;
	}

	public List<InstituteDetails> getInstituteDetails() {
		return instituteDetails;
	}

	public void setInstituteDetails(List<InstituteDetails> instituteDetails) {
		this.instituteDetails = instituteDetails;
	}

}
