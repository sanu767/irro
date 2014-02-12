package com.saasforedu.irro.dao.institute.impl;

import com.saasforedu.irro.dao.impl.BaseDAOimpl;
import com.saasforedu.irro.dao.institute.IRectorDAO;
import com.saasforedu.irro.model.institute.impl.Rector;

public class RectorDAO extends BaseDAOimpl<Rector> implements IRectorDAO {

	public String getMainContent() {
		return fetchMainContent("select r.content.mainContent from Rector r");
	}

	public Long findMax() {
		return findMax("select max(r.id) from Rector r");
	}
	
	public Rector findById(Long id) {
		return (Rector) getHibernateTemplate().get(Rector.class, id);
	}
}
