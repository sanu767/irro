package com.saasforedu.irro.model.news;

import com.saasforedu.irro.model.IBaseEntity;
import com.saasforedu.irro.model.impl.MainContent;

public interface INews extends IBaseEntity {

	public MainContent getContent();

	public void setContent(MainContent content);

	public String getAnnouncement();

	public void setAnnouncement(String announcement);

	public String getArchive();

	public void setArchive(String archive);
}
