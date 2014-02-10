package com.saasforedu.irro.bean;

import java.util.Date;
import java.util.List;

public class UserSearchBean {
	
	/** Search parameters **/
	List<Integer> searchedpermissionIds;
	List<String> searchedpermissionNames;
	String searchedName;
	Date beforeSearchDate;
	Date afterSearchDate;
	Long maxUploadFileSize;
	
	public List<Integer> getSearchedpermissionIds() {
		return searchedpermissionIds;
	}
	
	public void setSearchedpermissionIds(List<Integer> searchedpermissionIds) {
		this.searchedpermissionIds = searchedpermissionIds;
	}
	
	public List<String> getSearchedpermissionNames() {
		return searchedpermissionNames;
	}
	
	public void setSearchedpermissionNames(List<String> searchedpermissionNames) {
		this.searchedpermissionNames = searchedpermissionNames;
	}
	
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

	public Long getMaxUploadFileSize() {
		return maxUploadFileSize;
	}

	public void setMaxUploadFileSize(Long maxUploadFileSize) {
		this.maxUploadFileSize = maxUploadFileSize;
	}
	
}
