package com.saasforedu.irro.enums;

import java.util.Arrays;
import java.util.List;

public enum ParentInstitute {

	DEPARTMENT(1, 
			Arrays.asList(InstituteDetailType.PHILOGICAL, InstituteDetailType.PHILOSOPHY)), 
	CENTERS(2, 
			Arrays.asList(InstituteDetailType.INFORMATION)), 
	DIVISIONS(3, 
			Arrays.asList(InstituteDetailType.ESCORTS));

	private int id;
	private List<InstituteDetailType> children;

	private ParentInstitute(int id, List<InstituteDetailType> children) {
		this.id = id;
		this.children = children;
	}

	public int getId() {
		return id;
	}

	public List<InstituteDetailType> getChildren() {
		return children;
	}

}
