package com.saasforedu.irro.model.impl;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.saasforedu.irro.model.IUserGroup;

@Entity
@Table(name = "USER_GROUP")
public class UserGroup implements IUserGroup {
	
	@Id
	@GeneratedValue
	@Column(name = "GRP_ID")
	Integer groupId;
	
	@Column(name = "GRP_COD")
	String groupCode;
	
	@Column(name = "GRP_NAME")
	String groupName;
	
	@Column(name = "CREATION_DATE")
	Date creationDate;
	
	@Column(name = "IS_ACTIVE")
	boolean active;
	
	public Integer getGroupId() {
		return groupId;
	}
	
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	
	public String getGroupCode() {
		return groupCode;
	}

	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}

	public String getGroupName() {
		return groupName;
	}
	
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	
	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public boolean isActive() {
		return active;
	}
	
	public void setActive(boolean active) {
		this.active = active;
	}

	@Override
	public String toString() {
		return "UserGroup [groupId=" + groupId + ", groupName=" + groupName
				+ ", active=" + active + "]";
	}
	
}
