package com.saasforedu.irro.action;

import java.util.Arrays;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.saasforedu.irro.bean.GroupSearchBean;
import com.saasforedu.irro.bean.UserGroupBean;
import com.saasforedu.irro.service.UserGroupService;

public class UserGroupAction extends ActionSupport {

	private static final long serialVersionUID = 8533835699021909253L;
	
    private UserGroupService userGroupService;    
    
    private UserGroupBean userGroupBean;
    
    private GroupSearchBean groupSearchBean;
    
    private List<UserGroupBean> searchedUserGroups;
    
    private Integer [] selectedGroupIds;
    
	public void setUserGroupService(UserGroupService userGroupService) {
		this.userGroupService = userGroupService;
	}

	public UserGroupBean getUserGroupBean() {
		return userGroupBean;
	}

	public void setUserGroupBean(UserGroupBean userGroupBean) {
		this.userGroupBean = userGroupBean;
	}

	public GroupSearchBean getGroupSearchBean() {
		return groupSearchBean;
	}

	public void setGroupSearchBean(GroupSearchBean groupSearchBean) {
		this.groupSearchBean = groupSearchBean;
	}

	public List<UserGroupBean> getSearchedUserGroups() {
		return searchedUserGroups;
	}

	public void setSearchedUserGroups(List<UserGroupBean> searchedUserGroups) {
		this.searchedUserGroups = searchedUserGroups;
	}

	public String createGroup() throws Exception {
		Integer newGroupId = userGroupService.create(userGroupBean);
		return newGroupId > 0 ? SUCCESS : ERROR;
	}	
	
	public String editGroup() throws Exception {
		userGroupService.update(userGroupBean);
		return SUCCESS;
	}
	
	public String deleteGroups() throws Exception {
		List<Integer> selectedGroups = Arrays.asList(selectedGroupIds);
		userGroupService.delete(selectedGroups);
		return SUCCESS;
	}
	
	public String searchGroups() throws Exception{
		List<UserGroupBean> groupBeans = userGroupService.search(groupSearchBean);
		this.searchedUserGroups = groupBeans;
		return SUCCESS;
	}
	
	public String activateGroups() throws Exception{
		List<Integer> selectedGroups = Arrays.asList(selectedGroupIds);
		userGroupService.changeActivation(selectedGroups, true);
		return SUCCESS;
	}
	
	public String deActivateGroups() throws Exception {
		List<Integer> selectedGroups = Arrays.asList(selectedGroupIds);
		userGroupService.changeActivation(selectedGroups, false);
		return SUCCESS;
	}

	public Integer[] getSelectedGroupIds() {
		return selectedGroupIds;
	}

	public void setSelectedGroupIds(Integer[] selectedGroupIds) {
		this.selectedGroupIds = selectedGroupIds;
	}
	
	
}
