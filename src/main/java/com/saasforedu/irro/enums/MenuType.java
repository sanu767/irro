package com.saasforedu.irro.enums;

public enum MenuType {
	
	NEWS(1), DEPARTMENT(2), OTHERS(0);
	
	private int typeId;
	
	private MenuType(int typeId) {
		this.typeId = typeId;
	}
	
	public int getTypeId() {
		return this.typeId;
	}
	
	public static MenuType getType(int id) {
		switch (id) {
		case 1:
			return NEWS;
		case 2:
			return DEPARTMENT;
		case 3:
			return OTHERS;
		}
		return OTHERS;
	}
}
