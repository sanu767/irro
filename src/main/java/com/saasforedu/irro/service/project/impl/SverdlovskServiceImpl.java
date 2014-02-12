package com.saasforedu.irro.service.project.impl;

import com.saasforedu.irro.bean.ContentBean;
import com.saasforedu.irro.dao.project.ISverdlovskDAO;
import com.saasforedu.irro.model.projects.impl.Sverdlovsk;
import com.saasforedu.irro.service.project.ISverdlovskService;

public class SverdlovskServiceImpl implements ISverdlovskService {

	private ISverdlovskDAO sverdlovskDAO;

	public void setSverdlovskDAO(ISverdlovskDAO sverdlovskDAO) {
		this.sverdlovskDAO = sverdlovskDAO;
	}

	@Override
	public String getMainContent() {
		return sverdlovskDAO.getMainContent();
	}

	@Override
	public void updateContent(ContentBean contentBean) {
		Long id = sverdlovskDAO.findMax();
		Sverdlovsk rector = sverdlovskDAO.findById(Sverdlovsk.class, id);
		copyProperties(contentBean, rector);
		sverdlovskDAO.update(rector);
	}

	private void copyProperties(ContentBean contentBean, Sverdlovsk rector) {
		rector.getContent().setMainContent(contentBean.getMainContent());
	}
}
