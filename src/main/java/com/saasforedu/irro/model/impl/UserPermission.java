package com.saasforedu.irro.model.impl;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.saasforedu.irro.model.IUser;
import com.saasforedu.irro.model.IUserPermission;

@Entity
@Table(name = "PERMISSION")
public class UserPermission implements IUserPermission {
	
	@Id
	@GeneratedValue
	@Column(name = "ID")
	Long id;
	
	/** 
	 * USR_ID represents of ID of USER table not USR_CODE of USER table.
	 */
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="USR_ID")
	User user;
	
	
	@Column(name = "PERMISSION_NAME")
	String permissionName;
	
	/**
	 * permissionType = 0 : Rejected
	 * permissionType = 1 : Approved
	 * permissionType = 2 : Pending Approval
	 */
	@Column(name = "PERMISSION_TYPE", length = 1)
	Integer permissionType;

	public IUser getUser() {
		return user;
	}

	public void setUser(IUser user) {
		this.user = (User)user;
	}

	public String getPermissionName() {
		return permissionName;
	}

	public void setPermissionName(String permissionName) {
		this.permissionName = permissionName;
	}

	public Integer getPermissionType() {
		return permissionType;
	}

	public void setPermissionType(Integer permissionType) {
		this.permissionType = permissionType;
	}

	public Long getId() {
		return id;
	}

	@Override
	public String toString() {
		return "UserPermission [id=" + id + ", user=" + user
				+ ", permissionName=" + permissionName + ", permissionType="
				+ permissionType + "]";
	}
	
}
