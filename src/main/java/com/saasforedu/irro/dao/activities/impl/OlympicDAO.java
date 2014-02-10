package com.saasforedu.irro.dao.activities.impl;

import com.saasforedu.irro.dao.activities.IOlympicDAO;
import com.saasforedu.irro.dao.impl.BaseDAOimpl;
import com.saasforedu.irro.model.activities.impl.Olympic;
import com.saasforedu.irro.model.institute.impl.Rector;

public class OlympicDAO extends BaseDAOimpl<Olympic> implements IOlympicDAO {

	public String getMainContent() {
		return fetchMainContent("select r.content.mainContent from Olympic r");
	}

	public Long findMax() {
		return findMax("select max(r.id) from Olympic r");
	}
	
	public Rector findById(Long id) {
		return (Rector) getHibernateTemplate().get(Olympic.class, id);
	}
}
