package com.saasforedu.irro.service.project.impl;

import com.saasforedu.irro.bean.ContentBean;
import com.saasforedu.irro.dao.project.IBasicDAO;
import com.saasforedu.irro.model.projects.impl.Basic;
import com.saasforedu.irro.service.project.IBasicService;

public class BasicServiceImpl implements IBasicService {

	private IBasicDAO basicDAO;

	public void setBasicDAO(IBasicDAO basicDAO) {
		this.basicDAO = basicDAO;
	}

	@Override
	public String getMainContent() {
		return basicDAO.getMainContent();
	}

	@Override
	public void updateContent(ContentBean contentBean) {
		Long id = basicDAO.findMax();
		Basic rector = basicDAO.findById(Basic.class, id);
		copyProperties(contentBean, rector);
		basicDAO.update(rector);
	}

	private void copyProperties(ContentBean contentBean, Basic rector) {
		rector.getContent().setMainContent(contentBean.getMainContent());
	}
}
