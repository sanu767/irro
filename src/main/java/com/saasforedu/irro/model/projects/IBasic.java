package com.saasforedu.irro.model.projects;

import com.saasforedu.irro.model.IBaseEntity;
import com.saasforedu.irro.model.impl.MainContent;
import com.saasforedu.irro.model.projects.impl.Project;

public interface IBasic extends IBaseEntity {

	public Long getProjectId();

	public void setProjectId(Long projectId);

	public MainContent getContent();

	public void setContent(MainContent content);

	public Project getProject();

	public void setProject(Project project);
}
