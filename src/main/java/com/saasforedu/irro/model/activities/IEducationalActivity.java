package com.saasforedu.irro.model.activities;

import com.saasforedu.irro.model.IBaseEntity;
import com.saasforedu.irro.model.activities.impl.Activity;
import com.saasforedu.irro.model.impl.MainContent;

public interface IEducationalActivity extends IBaseEntity {

	public MainContent getContent();

	public void setContent(MainContent content);

	public Integer getType();

	public void setType(Integer type);

	public String getTypeName();

	public void setTypeName(String typeName);

	public String getYearlySchedule();

	public void setYearlySchedule(String yearlySchedule);

	public String getMonthlyPlan();

	public void setMonthlyPlan(String monthlyPlan);

	public String getCatalog();

	public void setCatalog(String catalog);

	public String getContract();

	public void setContract(String contract);

	public Activity getActivity();

	public void setActivity(Activity activity);
}
