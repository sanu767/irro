package com.saasforedu.irro.model.activities;

import com.saasforedu.irro.model.IBaseEntity;
import com.saasforedu.irro.model.activities.impl.Activity;
import com.saasforedu.irro.model.impl.MainContent;

public interface IContest extends IBaseEntity {

	public Long getActivityId();

	public void setActivityId(Long activityId);

	public MainContent getContent();

	public void setContent(MainContent content);

	public String getStaff();

	public void setStaff(String staff);

	public String getOrganization();

	public void setOrganization(String organization);

	public String getRegional();

	public void setRegional(String regional);

	public String getLearner();

	public void setLearner(String learner);

	public Activity getActivity();

	public void setActivity(Activity activity);

}
