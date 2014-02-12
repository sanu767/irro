package com.saasforedu.irro.dao.project.impl;

import com.saasforedu.irro.dao.impl.BaseDAOimpl;
import com.saasforedu.irro.dao.project.IProjectDAO;
import com.saasforedu.irro.model.institute.impl.Rector;
import com.saasforedu.irro.model.projects.impl.Project;

public class ProjectDAO extends BaseDAOimpl<Project> implements IProjectDAO {

	public String getMainContent() {
		return fetchMainContent("select r.content.mainContent from Project r");
	}

	public Long findMax() {
		return findMax("select max(r.id) from Project r");
	}
	
	public Rector findById(Long id) {
		return (Rector) getHibernateTemplate().get(Project.class, id);
	}
}
