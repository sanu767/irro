package com.saasforedu.irro.service.project.impl;

import com.saasforedu.irro.bean.ContentBean;
import com.saasforedu.irro.dao.certifications.ICertificateDAO;
import com.saasforedu.irro.model.certifications.impl.Certificate;
import com.saasforedu.irro.service.certifications.ICertificateService;

public class CertificateServiceImpl implements ICertificateService {

	private ICertificateDAO certificateDAO;

	public void setCertificateDAO(ICertificateDAO certificateDAO) {
		this.certificateDAO = certificateDAO;
	}

	@Override
	public String getMainContent() {
		return certificateDAO.getMainContent();
	}

	@Override
	public void updateContent(ContentBean contentBean) {
		Long id = certificateDAO.findMax();
		Certificate rector = certificateDAO.findById(Certificate.class, id);
		copyProperties(contentBean, rector);
		certificateDAO.update(rector);
	}

	private void copyProperties(ContentBean contentBean, Certificate rector) {
		rector.getContent().setMainContent(contentBean.getMainContent());
	}
}
