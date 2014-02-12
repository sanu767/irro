package com.saasforedu.irro.service.institute.impl;

import com.saasforedu.irro.bean.ContentBean;
import com.saasforedu.irro.dao.institute.IBranchOfficeDAO;
import com.saasforedu.irro.model.institute.impl.BranchOffice;
import com.saasforedu.irro.service.institute.IBranchOfficeService;

public class BranchOfficeServiceImpl implements IBranchOfficeService {

	private IBranchOfficeDAO branchOfficeDAO;

	public void setBranchOfficeDAO(IBranchOfficeDAO branchOfficeDAO) {
		this.branchOfficeDAO = branchOfficeDAO;
	}

	@Override
	public String getMainContent() {
		return branchOfficeDAO.getMainContent();
	}

	@Override
	public void updateContent(ContentBean contentBean) {
		Long id = branchOfficeDAO.findMax();
		BranchOffice rector = branchOfficeDAO.findById(BranchOffice.class, id);
		copyProperties(contentBean, rector);
		branchOfficeDAO.update(rector);
	}

	private void copyProperties(ContentBean contentBean, BranchOffice rector) {
		rector.getContent().setMainContent(contentBean.getMainContent());
	}
}
