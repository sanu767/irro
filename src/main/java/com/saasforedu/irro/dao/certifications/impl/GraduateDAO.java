package com.saasforedu.irro.dao.certifications.impl;

import com.saasforedu.irro.dao.certifications.IGraduateDAO;
import com.saasforedu.irro.dao.impl.BaseDAOimpl;
import com.saasforedu.irro.model.certifications.impl.Graduate;
import com.saasforedu.irro.model.institute.impl.Rector;

public class GraduateDAO extends BaseDAOimpl<Graduate> implements IGraduateDAO {

	public String getMainContent() {
		return fetchMainContent("select r.content.mainContent from Graduate r");
	}

	public Long findMax() {
		return findMax("select max(r.id) from Graduate r");
	}
	
	public Rector findById(Long id) {
		return (Rector) getHibernateTemplate().get(Graduate.class, id);
	}
}
