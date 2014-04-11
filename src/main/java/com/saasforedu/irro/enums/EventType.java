package com.saasforedu.irro.enums;

import org.apache.commons.lang3.StringUtils;


public enum EventType {

	NEWS("N"), EVENTS("E"), OTHERS("O");

	private String typeId;

	private EventType(String typeId) {
		this.typeId = typeId;
	}

	public String getTypeId() {
		return this.typeId;
	}

	public static String getTypeValue(int id) {
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
	
	public static EventType getType(int id) {
		switch (id) {
		case 1:
			return NEWS;
		case 2:
			return EVENTS;
		case 3:
			return OTHERS;
		}
		return OTHERS;
	}
	
	public static int getTypeId(String typeId) {
		if(StringUtils.equals(EventType.NEWS.typeId, typeId)) {
			return 1;
		}
		else if(StringUtils.equals(EventType.EVENTS.typeId, typeId)) {
			return 2;
		} else {
			return 3;
		}
	}
}
