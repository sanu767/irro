package com.saasforedu.irro.model.impl;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.saasforedu.irro.model.IMenuAttachment;

@Entity
@Table(name = "MENU_ATTACHMENT")
public class MenuAttachment implements IMenuAttachment {

	@Id
	@GeneratedValue
	@Column(name = "FILE_ID")
	Long id;
	
	@Column(name = "FILE_NAME")
	String fileName;

	@Column(name = "FILE_TYPE")
	String fileType;

	@Column(name = "LOCATION")
	String location;
	
	@Column(name="REF_MENU_ID")
	Long referenceMenuId;

	@Column(name = "MODIFICATION_DATE")
	Date modificationDate;
	
	@Column(name = "IS_ACTIVE")
	boolean active;
	
	@Column(name = "IS_EXTERNAL")
	boolean external;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Long getReferenceMenuId() {
		return referenceMenuId;
	}

	public void setReferenceMenuId(Long referenceMenuId) {
		this.referenceMenuId = referenceMenuId;
	}

	public Date getModificationDate() {
		return modificationDate;
	}

	public void setModificationDate(Date modificationDate) {
		this.modificationDate = modificationDate;
	}
	
	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public boolean isExternal() {
		return external;
	}

	public void setExternal(boolean external) {
		this.external = external;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (active ? 1231 : 1237);
		result = prime * result + (external ? 1231 : 1237);
		result = prime * result
				+ ((fileName == null) ? 0 : fileName.hashCode());
		result = prime * result
				+ ((fileType == null) ? 0 : fileType.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((location == null) ? 0 : location.hashCode());
		result = prime
				* result
				+ ((modificationDate == null) ? 0 : modificationDate.hashCode());
		result = prime * result
				+ ((referenceMenuId == null) ? 0 : referenceMenuId.hashCode());
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
		MenuAttachment other = (MenuAttachment) obj;
		if (active != other.active)
			return false;
		if (external != other.external)
			return false;
		if (fileName == null) {
			if (other.fileName != null)
				return false;
		} else if (!fileName.equals(other.fileName))
			return false;
		if (fileType == null) {
			if (other.fileType != null)
				return false;
		} else if (!fileType.equals(other.fileType))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (location == null) {
			if (other.location != null)
				return false;
		} else if (!location.equals(other.location))
			return false;
		if (modificationDate == null) {
			if (other.modificationDate != null)
				return false;
		} else if (!modificationDate.equals(other.modificationDate))
			return false;
		if (referenceMenuId == null) {
			if (other.referenceMenuId != null)
				return false;
		} else if (!referenceMenuId.equals(other.referenceMenuId))
			return false;
		return true;
	}

}