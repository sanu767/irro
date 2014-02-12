package com.saasforedu.irro.dao.activities.impl;

import com.saasforedu.irro.dao.activities.IEducationalActivityDAO;
import com.saasforedu.irro.dao.impl.BaseDAOimpl;
import com.saasforedu.irro.model.activities.impl.EducationalActivity;
import com.saasforedu.irro.model.institute.impl.Rector;

public class EducationalActivityDAO extends BaseDAOimpl<EducationalActivity>
		implements IEducationalActivityDAO {

	public String getMainContent() {
		return fetchMainContent("select r.content.mainContent from EducationalActivity r");
	}

	public Long findMax() {
		return findMax("select max(r.id) from EducationalActivity r");
	}
	
	public Rector findById(Long id) {
		return (Rector) getHibernateTemplate().get(EducationalActivity.class, id);
	}
}
