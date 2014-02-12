package com.saasforedu.irro.service.institute.impl;

import com.saasforedu.irro.bean.ContentBean;
import com.saasforedu.irro.dao.institute.IInstituteDetailsDAO;
import com.saasforedu.irro.model.institute.impl.InstituteDetails;
import com.saasforedu.irro.service.institute.IInstituteDetailsService;

public class InstituteDetailsServiceImpl implements IInstituteDetailsService {

	private IInstituteDetailsDAO instituteDetailsDAO;

	public void setInstituteDetailsDAO(IInstituteDetailsDAO instituteDetailsDAO) {
		this.instituteDetailsDAO = instituteDetailsDAO;
	}

	@Override
	public String getMainContent() {
		return instituteDetailsDAO.getMainContent();
	}

	@Override
	public void updateContent(ContentBean contentBean) {
		Long id = instituteDetailsDAO.findMax();
		InstituteDetails rector = instituteDetailsDAO.findById(InstituteDetails.class, id);
		copyProperties(contentBean, rector);
		instituteDetailsDAO.update(rector);
	}

	private void copyProperties(ContentBean contentBean, InstituteDetails rector) {
		rector.getContent().setMainContent(contentBean.getMainContent());
	}
}
