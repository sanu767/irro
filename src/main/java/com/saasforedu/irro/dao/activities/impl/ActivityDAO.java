package com.saasforedu.irro.dao.activities.impl;

import com.saasforedu.irro.dao.activities.IActivityDAO;
import com.saasforedu.irro.dao.impl.BaseDAOimpl;
import com.saasforedu.irro.model.activities.impl.Activity;
import com.saasforedu.irro.model.institute.impl.Rector;

public class ActivityDAO extends BaseDAOimpl<Activity> implements IActivityDAO {

	public String getMainContent() {
		return fetchMainContent("select r.content.mainContent from Activity r");
	}

	public Long findMax() {
		return findMax("select max(r.id) from Activity r");
	}
	
	public Rector findById(Long id) {
		return (Rector) getHibernateTemplate().get(Activity.class, id);
	}
}
