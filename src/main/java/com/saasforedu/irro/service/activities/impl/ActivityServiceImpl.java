package com.saasforedu.irro.service.activities.impl;

import com.saasforedu.irro.bean.ContentBean;
import com.saasforedu.irro.dao.activities.IActivityDAO;
import com.saasforedu.irro.model.activities.impl.Activity;
import com.saasforedu.irro.service.activities.IActivityService;

public class ActivityServiceImpl implements IActivityService {

	private IActivityDAO activityDAO;

	public void setActivityDAO(IActivityDAO activityDAO) {
		this.activityDAO = activityDAO;
	}

	@Override
	public String getMainContent() {
		return activityDAO.getMainContent();
	}

	@Override
	public void updateContent(ContentBean contentBean) {
		Long id = activityDAO.findMax();
		Activity rector = activityDAO.findById(Activity.class, id);
		copyProperties(contentBean, rector);
		activityDAO.update(rector);
	}

	private void copyProperties(ContentBean contentBean, Activity rector) {
		rector.getContent().setMainContent(contentBean.getMainContent());
	}
}
