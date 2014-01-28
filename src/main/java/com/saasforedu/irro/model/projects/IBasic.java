package com.saasforedu.irro.model.projects;

import com.saasforedu.irro.model.IBaseEntity;
import com.saasforedu.irro.model.impl.MainContent;

public interface IBasic extends IBaseEntity {
	
	public MainContent getContent();

	public void setContent(MainContent content);
}
