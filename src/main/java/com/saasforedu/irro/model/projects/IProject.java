package com.saasforedu.irro.model.projects;

import com.saasforedu.irro.model.IBaseEntity;
import com.saasforedu.irro.model.impl.MainContent;
import com.saasforedu.irro.model.projects.impl.Basic;
import com.saasforedu.irro.model.projects.impl.ContinuingEducation;
import com.saasforedu.irro.model.projects.impl.Sverdlovsk;

public interface IProject extends IBaseEntity {
	
	public MainContent getContent();

	public void setContent(MainContent content);

	public Basic getBasic();

	public void setBasic(Basic basic);

	public ContinuingEducation getContinuingEducation();

	public void setContinuingEducation(ContinuingEducation continuingEducation);

	public Sverdlovsk getSv();

	public void setSv(Sverdlovsk sv);

}
