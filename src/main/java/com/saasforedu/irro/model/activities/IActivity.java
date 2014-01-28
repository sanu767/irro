package com.saasforedu.irro.model.activities;

import java.util.List;

import com.saasforedu.irro.model.IBaseEntity;
import com.saasforedu.irro.model.activities.impl.Contest;
import com.saasforedu.irro.model.activities.impl.EducationalActivity;
import com.saasforedu.irro.model.activities.impl.Olympic;
import com.saasforedu.irro.model.impl.MainContent;

public interface IActivity extends IBaseEntity {

	public MainContent getContent();

	public void setContent(MainContent content);

	public List<EducationalActivity> getEducationalActvities();

	public void setEducationalActvities(
			List<EducationalActivity> educationalActvities);

	public Contest getContest();

	public void setContest(Contest contest);

	public Olympic getOlympic();

	public void setOlympic(Olympic olympic);
}
