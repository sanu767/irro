package com.saasforedu.irro.dao.institute.impl;

import com.saasforedu.irro.dao.impl.BaseDAOimpl;
import com.saasforedu.irro.dao.institute.IBranchOfficeDAO;
import com.saasforedu.irro.model.institute.impl.BranchOffice;
import com.saasforedu.irro.model.institute.impl.Rector;

public class BranchOfficeDAO extends BaseDAOimpl<BranchOffice> implements
		IBranchOfficeDAO {

	public String getMainContent() {
		return fetchMainContent("select r.content.mainContent from BranchOffice r");
	}

	public Long findMax() {
		return findMax("select max(r.id) from BranchOffice r");
	}
	
	public Rector findById(Long id) {
		return (Rector) getHibernateTemplate().get(BranchOffice.class, id);
	}
}
