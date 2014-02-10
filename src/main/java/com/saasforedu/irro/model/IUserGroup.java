package com.saasforedu.irro.model;

import java.util.Date;


public interface IUserGroup {
	
	public Integer getGroupId();
	public void setGroupId(Integer groupId);
	
	public String getGroupCode();
	public void setGroupCode(String groupCode);
	
	public String getGroupName();
	public void setGroupName(String groupName);
	
	public Date getCreationDate();
	public void setCreationDate(Date creationDate);
	
	public boolean isActive();	
	public void setActive(boolean active);
}
