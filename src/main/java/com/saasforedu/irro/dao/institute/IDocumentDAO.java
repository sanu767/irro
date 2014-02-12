package com.saasforedu.irro.dao.institute;

import com.saasforedu.irro.dao.IBaseDAO;
import com.saasforedu.irro.model.institute.impl.Document;

public interface IDocumentDAO extends IBaseDAO<Document> {

	public String getMainContent();

	public Long findMax();
}
