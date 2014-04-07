package com.saasforedu.irro.model;

import com.saasforedu.irro.article.entity.INews;

public interface INewsAttachment extends IBaseEntity{
	
	public Long getId();
	public void setId(Long id);

	public String getFileName();
	public void setFileName(String fileName);

	public String getFileType();
	public void setFileType(String fileType);

	public String getLocation();
	public void setLocation(String location);

	public boolean isActive();
	public void setActive(boolean active);
	
	public INews getNews();
	public void setNews(INews news);
}
