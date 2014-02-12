package com.saasforedu.irro.service.institute.impl;

import com.saasforedu.irro.bean.ContentBean;
import com.saasforedu.irro.dao.institute.IInstituteDAO;
import com.saasforedu.irro.model.institute.impl.Institute;
import com.saasforedu.irro.service.institute.IInstituteService;

public class InstituteServiceImpl implements IInstituteService {

	private IInstituteDAO instituteDAO;

	public void setInstituteDAO(IInstituteDAO instituteDAO) {
		this.instituteDAO = instituteDAO;
	}

	@Override
	public String getMainContent() {
		return instituteDAO.getMainContent();
	}

	@Override
	public void updateContent(ContentBean contentBean) {
		Long id = instituteDAO.findMax();
		Institute rector = instituteDAO.findById(Institute.class, id);
		copyProperties(contentBean, rector);
		instituteDAO.update(rector);
	}

	private void copyProperties(ContentBean contentBean, Institute rector) {
		rector.getContent().setMainContent(contentBean.getMainContent());
	}
}
