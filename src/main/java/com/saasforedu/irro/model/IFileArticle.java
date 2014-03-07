package com.saasforedu.irro.model;


public interface IFileArticle extends IBaseEntity{
	
	public Long getId();

	public String getFileName();
	public void setFileName(String fileName);

	public String getFileType();
	public void setFileType(String fileType);

	public String getLocation();
	public void setLocation(String location);

	public boolean isActive();
	public void setActive(boolean active);

}
