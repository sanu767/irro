package com.saasforedu.irro.service.activities.impl;

import com.saasforedu.irro.bean.ContentBean;
import com.saasforedu.irro.dao.activities.IOlympicDAO;
import com.saasforedu.irro.model.activities.impl.Olympic;
import com.saasforedu.irro.service.activities.IOlympicService;

public class OlympicServiceImpl implements IOlympicService {

	private IOlympicDAO olympicDAO;

	public void setOlympicDAO(IOlympicDAO olympicDAO) {
		this.olympicDAO = olympicDAO;
	}

	@Override
	public String getMainContent() {
		return olympicDAO.getMainContent();
	}

	@Override
	public void updateContent(ContentBean contentBean) {
		Long id = olympicDAO.findMax();
		Olympic rector = olympicDAO.findById(Olympic.class, id);
		copyProperties(contentBean, rector);
		olympicDAO.update(rector);
	}

	private void copyProperties(ContentBean contentBean, Olympic rector) {
		rector.getContent().setMainContent(contentBean.getMainContent());
	}
}
