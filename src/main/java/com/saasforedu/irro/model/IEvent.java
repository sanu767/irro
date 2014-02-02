package com.saasforedu.irro.model;

import java.util.Date;

public interface IEvent extends IBaseEntity {

	public Date getDate();

	public void setDate(Date date);

	public String getType();

	public void setType(String type);

	public String getUrl();

	public void setUrl(String url);

	public String getTitle();

	public void setTitle(String title);

	public String getDescription();

	public void setDescription(String description);
}
