package com.saasforedu.irro.article.entity;

import java.util.List;

import com.saasforedu.irro.article.entity.impl.Attachments;
import com.saasforedu.irro.model.IBaseEntity;

public interface IArticle extends IBaseEntity {

	public abstract String getTitle();

	public abstract void setTitle(String title);

	public abstract String getShortDescription();

	public abstract void setShortDescription(String shortDescription);

	public abstract String getMainContent();

	public abstract void setMainContent(String mainContent);

	public abstract List<Attachments> getAttachments();

	public abstract void setAttachments(List<Attachments> attachments);

	public abstract IDepartment getDepartment();

	public abstract void setDepartment(IDepartment department);

	public abstract ICenter getCenter();

	public abstract void setCenter(ICenter center);

	public abstract IBranchOffice getBranchOffice();

	public abstract void setBranchOffice(IBranchOffice branchOffice);

	public abstract IInstitute getInstitute();

	public abstract void setInstitute(IInstitute institute);

	public abstract IEducationalActivity getEduActivity();

	public abstract void setEduActivity(IEducationalActivity eduActivity);

	public abstract IConference getConference();

	public abstract void setConference(IConference conference);

	public abstract IContest getContest();

	public abstract void setContest(IContest contest);

	public abstract IOlympics getOlympics();

	public abstract void setOlympics(IOlympics olympics);

	public abstract ICertification getCertification();

	public abstract void setCertification(ICertification certification);

	public abstract IProjects getProjects();

	public abstract void setProjects(IProjects projects);

	public abstract INews getNews();

	public abstract void setNews(INews news);

}