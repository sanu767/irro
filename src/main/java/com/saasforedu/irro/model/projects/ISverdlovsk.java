package com.saasforedu.irro.model.projects;

import com.saasforedu.irro.model.IBaseEntity;
import com.saasforedu.irro.model.impl.MainContent;
import com.saasforedu.irro.model.projects.impl.Project;

public interface ISverdlovsk extends IBaseEntity {

	public Long getProjectId();

	public void setProjectId(Long projectId);
	
	public MainContent getContent();

	public void setContent(MainContent content);

	public String getOptional();

	public void setOptional(String optional);

	public String getInstitiution();

	public void setInstitiution(String institiution);

	public String getChildren();

	public void setChildren(String children);

	public String getSchool();

	public void setSchool(String school);

	public String getEducation();

	public void setEducation(String education);

	public Project getProject();

	public void setProject(Project project);
}
