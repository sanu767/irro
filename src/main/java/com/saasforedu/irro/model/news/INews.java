package com.saasforedu.irro.model.news;

import com.saasforedu.irro.model.IBaseEntity;

public interface INews extends IBaseEntity {

	public String getAnnouncement();

	public void setAnnouncement(String announcement);

	public String getArchive();

	public void setArchive(String archive);
}
