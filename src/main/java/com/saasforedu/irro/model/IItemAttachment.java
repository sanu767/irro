package com.saasforedu.irro.model;


public interface IItemAttachment extends IBaseEntity {
	
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
	
	public IItem getItem();
	public void setItem(IItem item);
}
