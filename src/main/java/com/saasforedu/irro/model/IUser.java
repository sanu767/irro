package com.saasforedu.irro.model;

import java.util.Date;
import java.util.List;

public interface IUser {
	
	public Long getId();
	
	public String getUserName();
	public void setUserName(String userName);

	public String getUserSurname() ;
	public void setUserSurname(String userSurname);

	public String getEmail();
	public void setEmail(String email);

	public String getPassword();
	public void setPassword(String password);

	public Date getRegistrationDate() ;
	public void setRegistrationDate(Date registrationDate);

	public List<IUserPermission> getPermissions();
	public void setPermissions(List<IUserPermission> permissions);
	
	public String getAddress();
	public void setAddress(String address);

	public Integer getPhoneNumber();
	public void setPhoneNumber(Integer phoneNumber) ;

	public String getUserCode();
	public void setUserCode(String userCode);
	
	public boolean isActive();
	public void setActive(boolean active);
	
	public Long getMaxUploadFileSize();
	public void setMaxUploadFileSize(Long maxUploadFileSize);

}
