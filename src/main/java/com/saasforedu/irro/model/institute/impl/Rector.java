/**
 * 
 */
package com.saasforedu.irro.model.institute.impl;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.Target;

import com.saasforedu.irro.model.activities.impl.Activity;
import com.saasforedu.irro.model.impl.MainContent;
import com.saasforedu.irro.model.institute.IRector;

/**
 * @author sanket
 * 
 */

@Entity
@Table(name = "RECTOR")
public class Rector implements IRector {
	
	@Id
	@GeneratedValue
	@Column(name = "RECT_ID")
	private Long id;
	
	@Embedded
	@Target(value = MainContent.class)
	MainContent content;
	
	@Column(name = "MEDIA_REPO")
	String mediaReport;
	
	@Column(name = "PUBLIC")
	String publications;
	
	@Column(name = "PHOTO_GAL")
	String photoGallery;
	
	@OneToOne
	@PrimaryKeyJoinColumn
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

	public String getMediaReport() {
		return mediaReport;
	}

	public void setMediaReport(String mediaReport) {
		this.mediaReport = mediaReport;
	}

	public String getPublications() {
		return publications;
	}

	public void setPublications(String publications) {
		this.publications = publications;
	}

	public String getPhotoGallery() {
		return photoGallery;
	}

	public void setPhotoGallery(String photoGallery) {
		this.photoGallery = photoGallery;
	}

	public Institute getInstitute() {
		return institute;
	}

	public void setInstitute(Institute institute) {
		this.institute = institute;
	}

}
