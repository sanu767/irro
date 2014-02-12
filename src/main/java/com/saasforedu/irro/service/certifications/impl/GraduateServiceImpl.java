package com.saasforedu.irro.service.certifications.impl;

import com.saasforedu.irro.bean.ContentBean;
import com.saasforedu.irro.dao.certifications.IGraduateDAO;
import com.saasforedu.irro.model.certifications.impl.Graduate;
import com.saasforedu.irro.service.certifications.IGraduateService;

public class GraduateServiceImpl implements IGraduateService {

	private IGraduateDAO graduateDAO;

	public void setGraduateDAO(IGraduateDAO graduateDAO) {
		this.graduateDAO = graduateDAO;
	}

	@Override
	public String getMainContent() {
		return graduateDAO.getMainContent();
	}

	@Override
	public void updateContent(ContentBean contentBean) {
		Long id = graduateDAO.findMax();
		Graduate rector = graduateDAO.findById(Graduate.class, id);
		copyProperties(contentBean, rector);
		graduateDAO.update(rector);
	}

	private void copyProperties(ContentBean contentBean, Graduate rector) {
		rector.getContent().setMainContent(contentBean.getMainContent());
	}
}
