package com.saasforedu.irro.bean;

import java.util.Date;

public class GroupSearchBean {
	
	/** Search parameters **/
	String searchedName;
	Date beforeSearchDate;
	Date afterSearchDate;

	public String getSearchedName() {
		return searchedName;
	}
	
	public void setSearchedName(String searchedName) {
		this.searchedName = searchedName;
	}
	
	public Date getBeforeSearchDate() {
		return beforeSearchDate;
	}
	
	public void setBeforeSearchDate(Date beforeSearchDate) {
		this.beforeSearchDate = beforeSearchDate;
	}
	
	public Date getAfterSearchDate() {
		return afterSearchDate;
	}
	
	public void setAfterSearchDate(Date afterSearchDate) {
		this.afterSearchDate = afterSearchDate;
	}

}