package com.saasforedu.irro.enums;

public enum InstituteDetailType {

	PHILOSOPHY(11),
	PHILOGICAL(12),
	INFORMATION(21),
	ESCORTS(31);
	
	private int id;
	private InstituteDetailType(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	
}
