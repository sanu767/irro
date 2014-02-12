package com.saasforedu.irro.service.activities.impl;

import com.saasforedu.irro.bean.ContentBean;
import com.saasforedu.irro.dao.activities.IEducationalActivityDAO;
import com.saasforedu.irro.model.activities.impl.EducationalActivity;
import com.saasforedu.irro.service.activities.IEducationalActivityService;

public class EducationalActivityServiceImpl implements IEducationalActivityService {

	private IEducationalActivityDAO educationalActivityDAO;


	public void setEducationalActivityDAO(
			IEducationalActivityDAO educationalActivityDAO) {
		this.educationalActivityDAO = educationalActivityDAO;
	}

	@Override
	public String getMainContent() {
		return educationalActivityDAO.getMainContent();
	}

	@Override
	public void updateContent(ContentBean contentBean) {
		Long id = educationalActivityDAO.findMax();
		EducationalActivity rector = educationalActivityDAO.findById(EducationalActivity.class, id);
		copyProperties(contentBean, rector);
		educationalActivityDAO.update(rector);
	}

	private void copyProperties(ContentBean contentBean, EducationalActivity rector) {
		rector.getContent().setMainContent(contentBean.getMainContent());
	}
}
