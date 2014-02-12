package com.saasforedu.irro.service.project.impl;

import com.saasforedu.irro.bean.ContentBean;
import com.saasforedu.irro.dao.project.IContinuingEducationDAO;
import com.saasforedu.irro.model.projects.impl.ContinuingEducation;
import com.saasforedu.irro.service.project.IContinuingEducationService;

public class ContinuingEducationServiceImpl implements IContinuingEducationService {

	private IContinuingEducationDAO continuingEducationDAO;

	public void setContinuingEducationDAO(
			IContinuingEducationDAO continuingEducationDAO) {
		this.continuingEducationDAO = continuingEducationDAO;
	}

	@Override
	public String getMainContent() {
		return continuingEducationDAO.getMainContent();
	}

	@Override
	public void updateContent(ContentBean contentBean) {
		Long id = continuingEducationDAO.findMax();
		ContinuingEducation rector = continuingEducationDAO.findById(ContinuingEducation.class, id);
		copyProperties(contentBean, rector);
		continuingEducationDAO.update(rector);
	}

	private void copyProperties(ContentBean contentBean, ContinuingEducation rector) {
		rector.getContent().setMainContent(contentBean.getMainContent());
	}
}
