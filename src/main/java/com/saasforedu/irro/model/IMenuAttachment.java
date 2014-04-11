package com.saasforedu.irro.model;

import java.util.Date;


public interface IMenuAttachment extends IBaseEntity {
	
	public Long getId();
	public void setId(Long id);

	public String getFileName();
	public void setFileName(String fileName);

	public String getFileType();
	public void setFileType(String fileType);

	public String getLocation();
	public void setLocation(String location);

	public Long getReferenceMenuId();
	public void setReferenceMenuId(Long referenceMenuId);

	public Date getModificationDate();
	public void setModificationDate(Date modificationDate);
	
	public boolean isActive();
	public void setActive(boolean active);

	public boolean isExternal();
	public void setExternal(boolean external);
}
