package com.saasforedu.irro.model.projects;

import com.saasforedu.irro.model.IBaseEntity;
import com.saasforedu.irro.model.impl.MainContent;

public interface IContinuingEducation extends IBaseEntity {

	public MainContent getContent();

	public void setContent(MainContent content);

	public String getActionPlan();

	public void setActionPlan(String actionPlan);

	public String getSupport();

	public void setSupport(String support);

	public String getNews();

	public void setNews(String news);
}