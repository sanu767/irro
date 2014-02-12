package com.saasforedu.irro.dao.institute.impl;

import com.saasforedu.irro.dao.impl.BaseDAOimpl;
import com.saasforedu.irro.dao.institute.IInstituteDetailsDAO;
import com.saasforedu.irro.model.institute.impl.InstituteDetails;
import com.saasforedu.irro.model.institute.impl.Rector;

public class InstituteDetailsDAO extends BaseDAOimpl<InstituteDetails> implements
		IInstituteDetailsDAO {

	public String getMainContent() {
		return fetchMainContent("select r.content.mainContent from InstituteDetails r");
	}

	public Long findMax() {
		return findMax("select max(r.id) from InstituteDetails r");
	}
	
	public Rector findById(Long id) {
		return (Rector) getHibernateTemplate().get(InstituteDetails.class, id);
	}
}
