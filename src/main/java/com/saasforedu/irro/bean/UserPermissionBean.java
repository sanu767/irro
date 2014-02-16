package com.saasforedu.irro.bean;

public class UserPermissionBean {
	
	private Long permissionId;
	private String permissionCode;
	private String permissionName;
	private Integer permissionType;
	private Long userId;
	
	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getPermissionId() {
		return permissionId;
	}

	public void setPermissionId(Long permissionId) {
		this.permissionId = permissionId;
	}
	
	public String getPermissionCode() {
		return permissionCode;
	}

	public void setPermissionCode(String permissionCode) {
		this.permissionCode = permissionCode;
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
	
}
