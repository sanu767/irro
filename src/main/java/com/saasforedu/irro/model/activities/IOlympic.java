package com.saasforedu.irro.model.activities;

import com.saasforedu.irro.model.IBaseEntity;
import com.saasforedu.irro.model.activities.impl.Activity;
import com.saasforedu.irro.model.impl.MainContent;

public interface IOlympic extends IBaseEntity {

	public Long getActivityId();

	public void setActivityId(Long activityId);
	
	public MainContent getContent();

	public void setContent(MainContent content);

	public String getAllRussia();

	public void setAllRussia(String allRussia);

	public String getSchool();

	public void setSchool(String school);

	public Activity getActivity();

	public void setActivity(Activity activity);

}
