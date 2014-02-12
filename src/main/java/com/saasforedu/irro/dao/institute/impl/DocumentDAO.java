package com.saasforedu.irro.dao.institute.impl;

import com.saasforedu.irro.dao.impl.BaseDAOimpl;
import com.saasforedu.irro.dao.institute.IDocumentDAO;
import com.saasforedu.irro.model.institute.impl.Document;
import com.saasforedu.irro.model.institute.impl.Rector;

public class DocumentDAO extends BaseDAOimpl<Document> implements IDocumentDAO {

	public String getMainContent() {
		return fetchMainContent("select r.content.mainContent from Document r");
	}

	public Long findMax() {
		return findMax("select max(r.id) from Document r");
	}
	
	public Rector findById(Long id) {
		return (Rector) getHibernateTemplate().get(Document.class, id);
	}
}
