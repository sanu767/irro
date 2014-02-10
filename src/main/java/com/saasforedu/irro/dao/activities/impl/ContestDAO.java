package com.saasforedu.irro.dao.activities.impl;

import com.saasforedu.irro.dao.activities.IContestDAO;
import com.saasforedu.irro.dao.impl.BaseDAOimpl;
import com.saasforedu.irro.model.activities.impl.Contest;
import com.saasforedu.irro.model.institute.impl.Rector;

public class ContestDAO extends BaseDAOimpl<Contest> implements IContestDAO {

	public String getMainContent() {
		return fetchMainContent("select r.content.mainContent from Contest r");
	}

	public Long findMax() {
		return findMax("select max(r.id) from Contest r");
	}
	
	public Rector findById(Long id) {
		return (Rector) getHibernateTemplate().get(Contest.class, id);
	}
}
