package com.saasforedu.irro.dao.certifications.impl;

import com.saasforedu.irro.dao.certifications.ICertificateDAO;
import com.saasforedu.irro.dao.impl.BaseDAOimpl;
import com.saasforedu.irro.model.certifications.impl.Certificate;
import com.saasforedu.irro.model.institute.impl.Rector;

public class CertificateDAO extends BaseDAOimpl<Certificate> implements
		ICertificateDAO {

	public String getMainContent() {
		return fetchMainContent("select r.content.mainContent from Certificate r");
	}

	public Long findMax() {
		return findMax("select max(r.id) from Certificate r");
	}
	
	public Rector findById(Long id) {
		return (Rector) getHibernateTemplate().get(Certificate.class, id);
	}
}
