package com.saasforedu.irro.dao.project.impl;

import com.saasforedu.irro.dao.impl.BaseDAOimpl;
import com.saasforedu.irro.dao.project.ISverdlovskDAO;
import com.saasforedu.irro.model.institute.impl.Rector;
import com.saasforedu.irro.model.projects.impl.Sverdlovsk;

public class SverdlovskDAO extends BaseDAOimpl<Sverdlovsk> implements
		ISverdlovskDAO {

	public String getMainContent() {
		return fetchMainContent("select r.content.mainContent from Sverdlovsk r");
	}

	public Long findMax() {
		return findMax("select max(r.id) from Sverdlovsk r");
	}
	
	public Rector findById(Long id) {
		return (Rector) getHibernateTemplate().get(Sverdlovsk.class, id);
	}
}
