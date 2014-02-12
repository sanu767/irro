package com.saasforedu.irro.service.activities.impl;

import com.saasforedu.irro.bean.ContentBean;
import com.saasforedu.irro.dao.activities.IContestDAO;
import com.saasforedu.irro.model.activities.impl.Contest;
import com.saasforedu.irro.service.activities.IContestService;

public class ContestServiceImpl implements IContestService {

	private IContestDAO contestDAO;

	public void setContestDAO(IContestDAO contestDAO) {
		this.contestDAO = contestDAO;
	}

	@Override
	public String getMainContent() {
		return contestDAO.getMainContent();
	}

	@Override
	public void updateContent(ContentBean contentBean) {
		Long id = contestDAO.findMax();
		Contest rector = contestDAO.findById(Contest.class, id);
		copyProperties(contentBean, rector);
		contestDAO.update(rector);
	}

	private void copyProperties(ContentBean contentBean, Contest rector) {
		rector.getContent().setMainContent(contentBean.getMainContent());
	}
}
