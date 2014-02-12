package com.saasforedu.irro.dao.activities;

import com.saasforedu.irro.dao.IBaseDAO;
import com.saasforedu.irro.model.activities.impl.Activity;

public interface IActivityDAO extends IBaseDAO<Activity> {

	public String getMainContent();
	
	public Long findMax();
}
