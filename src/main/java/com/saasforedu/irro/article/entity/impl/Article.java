package com.saasforedu.irro.article.entity.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.saasforedu.irro.article.entity.IArticle;
import com.saasforedu.irro.article.entity.IBranchOffice;
import com.saasforedu.irro.article.entity.ICenter;
import com.saasforedu.irro.article.entity.ICertification;
import com.saasforedu.irro.article.entity.IConference;
import com.saasforedu.irro.article.entity.IContest;
import com.saasforedu.irro.article.entity.IDepartment;
import com.saasforedu.irro.article.entity.IEducationalActivity;
import com.saasforedu.irro.article.entity.IInstitute;
import com.saasforedu.irro.article.entity.INews;
import com.saasforedu.irro.article.entity.IOlympics;
import com.saasforedu.irro.article.entity.IProjects;

@Entity
@Table(name = "ARTICLE")
public class Article implements IArticle {

	@Id
	@GeneratedValue
	@Column(name = "ARTICLE_ID")
	private Long id;

	@Column(name = "TITLE")
	private String title;

	@Column(name = "DESCRIPTION")
	private String shortDescription;

	@Lob
	@Column(name = "CONTENT")
	private String mainContent;

	@OneToMany(mappedBy = "article", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Attachments> attachments = new ArrayList<Attachments>();
	
	@OneToOne(mappedBy="article", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private IDepartment department;

	@OneToOne(mappedBy="article", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private ICenter center;	

	@OneToOne(mappedBy="article", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private IBranchOffice branchOffice;	
	
	@OneToOne(mappedBy="article", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private IInstitute institute; 
	
	@OneToOne(mappedBy="article", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private IEducationalActivity eduActivity;
	
	@OneToOne(mappedBy="article", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private IConference conference;
	
	@OneToOne(mappedBy="article", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private IContest contest; 
	
	@OneToOne(mappedBy="article", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private IOlympics olympics; 
	
	@OneToOne(mappedBy="article", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private ICertification certification;
	
	@OneToOne(mappedBy="article", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private IProjects projects; 
	
	@OneToOne(mappedBy="article", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private INews news; 
	
	@Override
	public String getTitle() {
		return title;
	}

	@Override
	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String getShortDescription() {
		return shortDescription;
	}

	@Override
	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	@Override
	public String getMainContent() {
		return mainContent;
	}

	@Override
	public void setMainContent(String mainContent) {
		this.mainContent = mainContent;
	}

	@Override
	public List<Attachments> getAttachments() {
		return attachments;
	}

	@Override
	public void setAttachments(List<Attachments> attachments) {
		this.attachments = attachments;
	}

	@Override
	public Long getId() {
		return id;
	}

	@Override
	public IDepartment getDepartment() {
		return department;
	}

	@Override
	public void setDepartment(IDepartment department) {
		this.department = department;
	}

	@Override
	public ICenter getCenter() {
		return center;
	}

	@Override
	public void setCenter(ICenter center) {
		this.center = center;
	}

	@Override
	public IBranchOffice getBranchOffice() {
		return branchOffice;
	}

	@Override
	public void setBranchOffice(IBranchOffice branchOffice) {
		this.branchOffice = branchOffice;
	}

	@Override
	public IInstitute getInstitute() {
		return institute;
	}

	@Override
	public void setInstitute(IInstitute institute) {
		this.institute = institute;
	}

	@Override
	public IEducationalActivity getEduActivity() {
		return eduActivity;
	}

	@Override
	public void setEduActivity(IEducationalActivity eduActivity) {
		this.eduActivity = eduActivity;
	}

	@Override
	public IConference getConference() {
		return conference;
	}

	@Override
	public void setConference(IConference conference) {
		this.conference = conference;
	}

	@Override
	public IContest getContest() {
		return contest;
	}

	@Override
	public void setContest(IContest contest) {
		this.contest = contest;
	}

	@Override
	public IOlympics getOlympics() {
		return olympics;
	}

	@Override
	public void setOlympics(IOlympics olympics) {
		this.olympics = olympics;
	}

	@Override
	public ICertification getCertification() {
		return certification;
	}

	@Override
	public void setCertification(ICertification certification) {
		this.certification = certification;
	}

	@Override
	public IProjects getProjects() {
		return projects;
	}

	@Override
	public void setProjects(IProjects projects) {
		this.projects = projects;
	}

	@Override
	public INews getNews() {
		return news;
	}

	@Override
	public void setNews(INews news) {
		this.news = news;
	}

	
}
