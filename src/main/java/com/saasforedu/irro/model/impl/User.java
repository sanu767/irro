package com.saasforedu.irro.model.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.saasforedu.irro.model.IUser;
import com.saasforedu.irro.model.IUserPermission;

@Entity
@Table(name = "USER")
public class User implements IUser {

	@Id
	@GeneratedValue
	@Column(name = "USR_ID")
	Long id;
	
	@Column(name = "USR_CODE")
	String userCode;

	@Column(name = "USR_NAME")
	String userName;

	@Column(name = "USR_SUR_NAME")
	String userSurname;

	@Column(name = "USR_EMAIL")
	String email;

	@Column(name = "USR_PASSWORD")
	String password;
	
	@Column(name = "ADDRESS")
	String address;
	
	@Column(name = "PHONE_NUMBER")
	Integer phoneNumber;
	
	@Column(name = "USR_REGISTRATION_DATE")
	Date registrationDate;
	
	@Column(name = "IS_ACTIVE")
	boolean active;
	
	@Column(name = "MAX_UPLOAD_FILE_SIZE")
	Long maxUploadFileSize;
	
    @OneToMany(cascade = CascadeType.ALL, fetch=FetchType.EAGER, targetEntity=UserPermission.class, mappedBy="user")
	List<IUserPermission> permissions = new ArrayList<IUserPermission>();

	public Long getId() {
		return id;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserSurname() {
		return userSurname;
	}

	public void setUserSurname(String userSurname) {
		this.userSurname = userSurname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}

	public List<IUserPermission> getPermissions() {
		return permissions;
	}

	public void setPermissions(List<IUserPermission> permissions) {
		this.permissions = permissions;
	}

	public String getUserCode() {
		return userCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(Integer phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public Long getMaxUploadFileSize() {
		return maxUploadFileSize;
	}

	public void setMaxUploadFileSize(Long maxUploadFileSize) {
		this.maxUploadFileSize = maxUploadFileSize;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (active ? 1231 : 1237);
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime
				* result
				+ ((maxUploadFileSize == null) ? 0 : maxUploadFileSize
						.hashCode());
		result = prime * result
				+ ((password == null) ? 0 : password.hashCode());
		result = prime * result
				+ ((permissions == null) ? 0 : permissions.hashCode());
		result = prime * result
				+ ((phoneNumber == null) ? 0 : phoneNumber.hashCode());
		result = prime
				* result
				+ ((registrationDate == null) ? 0 : registrationDate.hashCode());
		result = prime * result
				+ ((userCode == null) ? 0 : userCode.hashCode());
		result = prime * result
				+ ((userName == null) ? 0 : userName.hashCode());
		result = prime * result
				+ ((userSurname == null) ? 0 : userSurname.hashCode());
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
		User other = (User) obj;
		if (active != other.active)
			return false;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (maxUploadFileSize == null) {
			if (other.maxUploadFileSize != null)
				return false;
		} else if (!maxUploadFileSize.equals(other.maxUploadFileSize))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (permissions == null) {
			if (other.permissions != null)
				return false;
		} else if (!permissions.equals(other.permissions))
			return false;
		if (phoneNumber == null) {
			if (other.phoneNumber != null)
				return false;
		} else if (!phoneNumber.equals(other.phoneNumber))
			return false;
		if (registrationDate == null) {
			if (other.registrationDate != null)
				return false;
		} else if (!registrationDate.equals(other.registrationDate))
			return false;
		if (userCode == null) {
			if (other.userCode != null)
				return false;
		} else if (!userCode.equals(other.userCode))
			return false;
		if (userName == null) {
			if (other.userName != null)
				return false;
		} else if (!userName.equals(other.userName))
			return false;
		if (userSurname == null) {
			if (other.userSurname != null)
				return false;
		} else if (!userSurname.equals(other.userSurname))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", userCode=" + userCode + ", userName="
				+ userName + ", userSurname=" + userSurname + ", email="
				+ email + ", password=" + password + ", address=" + address
				+ ", phoneNumber=" + phoneNumber + ", registrationDate="
				+ registrationDate + ", active=" + active
				+ ", maxUploadFileSize=" + maxUploadFileSize + ", permissions="
				+ permissions + "]";
	}

}
