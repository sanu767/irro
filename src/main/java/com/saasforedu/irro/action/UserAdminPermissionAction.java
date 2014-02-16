package com.saasforedu.irro.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.opensymphony.xwork2.ActionSupport;
import com.saasforedu.irro.bean.UserBean;
import com.saasforedu.irro.bean.UserGroupBean;
import com.saasforedu.irro.bean.UserSearchBean;
import com.saasforedu.irro.enums.PermissionType;
import com.saasforedu.irro.service.UserGroupService;
import com.saasforedu.irro.service.UserService;

public class UserAdminPermissionAction extends ActionSupport {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7462436516084636741L;

	private UserService userService;
    
    private UserGroupService userGroupService;

	private List<UserBean> searchedUsers;
    
	private UserSearchBean userSearchBean;

	private List<String> allPermissions = new ArrayList<String>();
	
	private List<Long> selectedPermissionIds = new ArrayList<Long>();
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setUserGroupService(UserGroupService userGroupService) {
		this.userGroupService = userGroupService;
	}
	
	public List<UserBean> getSearchedUsers() {
		return searchedUsers;
	}

	public void setSearchedUsers(List<UserBean> searchedUsers) {
		this.searchedUsers = searchedUsers;
	}

	public UserSearchBean getUserSearchBean() {
		return userSearchBean;
	}

	public void setUserSearchBean(UserSearchBean userSearchBean) {
		this.userSearchBean = userSearchBean;
	}

	public List<String> getAllPermissions() {
		return allPermissions;
	}

	public void setAllPermissions(List<String> allPermissions) {
		this.allPermissions = allPermissions;
	}

	public List<Long> getSelectedPermissionIds() {
		return selectedPermissionIds;
	}

	public void setSelectedPermissionIds(List<Long> selectedPermissionIds) {
		this.selectedPermissionIds = selectedPermissionIds;
	}

	public String searchUsers() throws Exception{
		List<UserBean> searchUsers = userService.searchUsers(userSearchBean);
		this.searchedUsers = searchUsers;
		return SUCCESS;
	}
	
	public String grant() throws Exception{
		userService.changePermissions(selectedPermissionIds, PermissionType.APPROVED);
		return SUCCESS;
	}
	
	public String revoke() throws Exception {
		userService.changePermissions(selectedPermissionIds, PermissionType.REJECTED);
		return SUCCESS;
	}
	
	public String searchPermissionWL() throws Exception {
		List<String> allGroups = findAllGroups();
		this.allPermissions = allGroups;
		return SUCCESS;
	}
	
	private List<String> findAllGroups() {
		List<UserGroupBean> allPermissions = userGroupService.findAll();
		List<String> permissionNames = new ArrayList<String>();
		if(CollectionUtils.isNotEmpty(allPermissions)) {
			for (UserGroupBean allPermission : allPermissions) {
				permissionNames.add(allPermission.getGroupName());
			}			
		}
		return permissionNames;
	}
}
