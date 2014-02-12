package com.saasforedu.irro.service.project.impl;

import com.saasforedu.irro.bean.ContentBean;
import com.saasforedu.irro.dao.project.IProjectDAO;
import com.saasforedu.irro.model.projects.impl.Project;
import com.saasforedu.irro.service.project.IProjectService;

public class ProjectServiceImpl implements IProjectService {

	private IProjectDAO projectDAO;

	public void setProjectDAO(IProjectDAO projectDAO) {
		this.projectDAO = projectDAO;
	}

	@Override
	public String getMainContent() {
		return projectDAO.getMainContent();
	}

	@Override
	public void updateContent(ContentBean contentBean) {
		Long id = projectDAO.findMax();
		Project rector = projectDAO.findById(Project.class, id);
		copyProperties(contentBean, rector);
		projectDAO.update(rector);
	}

	private void copyProperties(ContentBean contentBean, Project rector) {
		rector.getContent().setMainContent(contentBean.getMainContent());
	}
}
