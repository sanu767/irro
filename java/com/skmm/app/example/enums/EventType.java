package com.skmm.app.example.enums;

import org.apache.commons.lang.StringUtils;

public enum EventType {

	NEWS("N"), EVENTS("E"), OTHERS("O");

	private String typeId;

	private EventType(String typeId) {
		this.typeId = typeId;
	}

	public String getTypeId() {
		return this.typeId;
	}

	public static String getTypeId(int id) {
		switch (id) {
		case 1:
			return NEWS.typeId;
		case 2:
			return EVENTS.typeId;
		case 3:
			return OTHERS.typeId;
		}
		return StringUtils.EMPTY;
	}
}
