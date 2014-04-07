package com.saasforedu.irro.model;


public interface IUserPermission extends IBaseEntity {
	
	public IUser getUser();
	public void setUser(IUser user);

	public String getPermissionName();
	public void setPermissionName(String permissionName);

	public Integer getPermissionType();
	public void setPermissionType(Integer permissionType);

	public Long getId();
}
