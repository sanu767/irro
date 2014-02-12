package com.saasforedu.irro.dao.project.impl;

import com.saasforedu.irro.dao.impl.BaseDAOimpl;
import com.saasforedu.irro.dao.project.IContinuingEducationDAO;
import com.saasforedu.irro.model.institute.impl.Rector;
import com.saasforedu.irro.model.projects.impl.ContinuingEducation;

public class ContinuingEducationDAO extends BaseDAOimpl<ContinuingEducation> implements IContinuingEducationDAO {

	public String getMainContent() {
		return fetchMainContent("select r.content.mainContent from ContinuingEducation r");
	}

	public Long findMax() {
		return findMax("select max(r.id) from ContinuingEducation r");
	}
	
	public Rector findById(Long id) {
		return (Rector) getHibernateTemplate().get(ContinuingEducation.class, id);
	}
}
