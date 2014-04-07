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
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((permissionName == null) ? 0 : permissionName.hashCode());
		result = prime * result
				+ ((permissionType == null) ? 0 : permissionType.hashCode());
		result = prime * result + ((user == null) ? 0 : user.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserPermission other = (UserPermission) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (permissionName == null) {
			if (other.permissionName != null)
				return false;
		} else if (!permissionName.equals(other.permissionName))
			return false;
		if (permissionType == null) {
			if (other.permissionType != null)
				return false;
		} else if (!permissionType.equals(other.permissionType))
			return false;
		if (user == null) {
			if (other.user != null)
				return false;
		} else if (!user.equals(other.user))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UserPermission [id=" + id + ", user=" + user
				+ ", permissionName=" + permissionName + ", permissionType="
				+ permissionType + "]";
	}
}
