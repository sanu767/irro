package com.saasforedu.irro.dao.institute.impl;

import com.saasforedu.irro.dao.impl.BaseDAOimpl;
import com.saasforedu.irro.dao.institute.IInstituteDAO;
import com.saasforedu.irro.model.institute.impl.Institute;
import com.saasforedu.irro.model.institute.impl.Rector;

public class InstituteDAO extends BaseDAOimpl<Institute> implements IInstituteDAO {

	public String getMainContent() {
		return fetchMainContent("select r.content.mainContent from Institute r");
	}

	public Long findMax() {
		return findMax("select max(r.id) from Institute r");
	}
	
	public Rector findById(Long id) {
		return (Rector) getHibernateTemplate().get(Institute.class, id);
	}
}
