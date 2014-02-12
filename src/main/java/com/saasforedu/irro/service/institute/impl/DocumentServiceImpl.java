package com.saasforedu.irro.service.institute.impl;

import com.saasforedu.irro.bean.ContentBean;
import com.saasforedu.irro.dao.institute.IDocumentDAO;
import com.saasforedu.irro.model.institute.impl.Document;
import com.saasforedu.irro.service.institute.IDocumentService;

public class DocumentServiceImpl implements IDocumentService {

	private IDocumentDAO documentDAO;

	public void setDocumentDAO(IDocumentDAO documentDAO) {
		this.documentDAO = documentDAO;
	}

	@Override
	public String getMainContent() {
		return documentDAO.getMainContent();
	}

	@Override
	public void updateContent(ContentBean contentBean) {
		Long id = documentDAO.findMax();
		Document rector = documentDAO.findById(Document.class, id);
		copyProperties(contentBean, rector);
		documentDAO.update(rector);
	}

	private void copyProperties(ContentBean contentBean, Document rector) {
		rector.getContent().setMainContent(contentBean.getMainContent());
	}
}
