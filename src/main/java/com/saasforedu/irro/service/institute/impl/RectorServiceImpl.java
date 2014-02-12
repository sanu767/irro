package com.saasforedu.irro.service.institute.impl;

import com.saasforedu.irro.bean.ContentBean;
import com.saasforedu.irro.dao.institute.IRectorDAO;
import com.saasforedu.irro.model.institute.impl.Rector;
import com.saasforedu.irro.service.institute.IRectorService;

public class RectorServiceImpl implements IRectorService {

	private IRectorDAO rectorDAO;

	public void setRectorDAO(IRectorDAO rectorDAO) {
		this.rectorDAO = rectorDAO;
	}

	@Override
	public String getMainContent() {
		return rectorDAO.getMainContent();
	}

	@Override
	public void updateContent(ContentBean contentBean) {
		Long id = rectorDAO.findMax();
		Rector rector = rectorDAO.findById(Rector.class, id);
		copyProperties(contentBean, rector);
		rectorDAO.update(rector);
	}

	private void copyProperties(ContentBean contentBean, Rector rector) {
		rector.getContent().setMainContent(contentBean.getMainContent());
	}
}
