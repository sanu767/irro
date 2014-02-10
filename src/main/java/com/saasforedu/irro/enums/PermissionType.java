package com.saasforedu.irro.enums;

import com.saasforedu.irro.util.IConstants;

public enum PermissionType {

	REJECTED(0, IConstants.REJECTED), 
	APPROVED(1, IConstants.APPROVED), 
	REQUEST_APPROVAL(2, IConstants.PENDING_APPROVAL), 
	NOT_REQUESTED(-1, IConstants.NOT_REQUESTED);

	private Integer typeId;
	private String typeName;

	private PermissionType(Integer typeId, String typeName) {
		this.typeId = typeId;
		this.typeName = typeName;
	}

	public Integer getTypeId() {
		return this.typeId;
	}
	
	public String getTypeName() {
		return this.typeName;
	}
	
	public PermissionType getPermissionTypeByTypeId(Integer typeId) {
		switch (typeId) {
		case 0:
			return PermissionType.REJECTED;
		case 1:
			return PermissionType.APPROVED;
		case 2:
			return PermissionType.REQUEST_APPROVAL;
		case -1 :
			return PermissionType.NOT_REQUESTED;
		default:
			return PermissionType.NOT_REQUESTED;
		}
	}
}
