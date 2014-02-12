package com.saasforedu.irro.dao.project.impl;

import com.saasforedu.irro.dao.impl.BaseDAOimpl;
import com.saasforedu.irro.dao.project.IBasicDAO;
import com.saasforedu.irro.model.institute.impl.Rector;
import com.saasforedu.irro.model.projects.impl.Basic;

public class BasicDAO extends BaseDAOimpl<Basic> implements IBasicDAO {

	public String getMainContent() {
		return fetchMainContent("select r.content.mainContent from Basic r");
	}

	public Long findMax() {
		return findMax("select max(r.id) from Basic r");
	}
	
	public Rector findById(Long id) {
		return (Rector) getHibernateTemplate().get(Basic.class, id);
	}
}
