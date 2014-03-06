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
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Target;

import com.saasforedu.irro.model.impl.MainContent;
import com.saasforedu.irro.model.institute.IInstituteDetails;

/**
 * @author sanket
 * 
 */

@Entity
@Table(name = "INSTITUTE_DETAILS")
public class InstituteDetails implements IInstituteDetails {

	@Id
	@GeneratedValue
	@Column(name = "DOC_ID")
	private Long id;
	
	@Embedded
	@Target(value = MainContent.class)
	MainContent content;
	
	@Column(name = "TYP")
	Integer type;
	
	@Column(name = "TYP_NAME")
	String typeName;
	
	@Lob
	@Column(name = "CONSTI")
	String constitution;
	
	@Lob
	@Column(name = "NEWS")
	String news;
	
	@Column(name = "MATERIAL")
	String materials;
	
	@Column(name = "CONTACT")
	String contacts;
	
	@Column(name = "REVIEW")
	String reviews;
	
	@Column(name = "EDU_ACT")
	String educationalActivies;
	
	@Column(name = "SHELTER")
	String shelter;
	
	@Column(name = "BIB")
	String bibliography;
	
	@Column(name = "PUB")
	String publications;
	
	@Column(name = "EXH_CAL")
	String exhibitionCalendar;
	
	@Column(name = "LINKS")
	String usefulLinks;
	
	@Column(name = "SEMINAR")
	String seminar;
	
	@Column(name = "PARENT_ID")
	Integer instituteParentId;
	
	/** Making Nullable as true Temporarily But we need to think to make connection or not**/
	@ManyToOne(targetEntity = Institute.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "INST_ID", nullable = true)
	Institute institute;
	
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

	public String getConstitution() {
		return constitution;
	}

	public void setConstitution(String constitution) {
		this.constitution = constitution;
	}

	public String getNews() {
		return news;
	}

	public void setNews(String news) {
		this.news = news;
	}

	public String getMaterials() {
		return materials;
	}

	public void setMaterials(String materials) {
		this.materials = materials;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getReviews() {
		return reviews;
	}

	public void setReviews(String reviews) {
		this.reviews = reviews;
	}

	public String getEducationalActivies() {
		return educationalActivies;
	}

	public void setEducationalActivies(String educationalActivies) {
		this.educationalActivies = educationalActivies;
	}

	public String getShelter() {
		return shelter;
	}

	public void setShelter(String shelter) {
		this.shelter = shelter;
	}

	public String getBibliography() {
		return bibliography;
	}

	public void setBibliography(String bibliography) {
		this.bibliography = bibliography;
	}

	public String getPublications() {
		return publications;
	}

	public void setPublications(String publications) {
		this.publications = publications;
	}

	public String getExhibitionCalendar() {
		return exhibitionCalendar;
	}

	public void setExhibitionCalendar(String exhibitionCalendar) {
		this.exhibitionCalendar = exhibitionCalendar;
	}

	public String getUsefulLinks() {
		return usefulLinks;
	}

	public void setUsefulLinks(String usefulLinks) {
		this.usefulLinks = usefulLinks;
	}

	public String getSeminar() {
		return seminar;
	}

	public void setSeminar(String seminar) {
		this.seminar = seminar;
	}

	public Integer getInstituteParentId() {
		return instituteParentId;
	}

	public void setInstituteParentId(Integer instituteParentId) {
		this.instituteParentId = instituteParentId;
	}

	public Institute getInstitute() {
		return institute;
	}

	public void setInstitute(Institute institute) {
		this.institute = institute;
	}

}
