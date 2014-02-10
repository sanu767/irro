package com.saasforedu.irro.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.opensymphony.xwork2.ActionSupport;
import com.saasforedu.irro.bean.UserBean;
import com.saasforedu.irro.bean.UserGroupBean;
import com.saasforedu.irro.bean.UserSearchBean;
import com.saasforedu.irro.service.UserGroupService;
import com.saasforedu.irro.service.UserService;

public class UserAdminAction extends ActionSupport {

	private static final long serialVersionUID = 8986044240485817125L;
	
	private UserService userService;
    
    private UserGroupService userGroupService;

	private List<UserBean> searchedUsers;    
    
	private UserSearchBean userSearchBean;

	private UserBean userBean;
	
	private List<String> allPermissions;
	
	private Long [] selectedUserIds;

	private Long selectedUserIdToModify;

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

	public UserBean getUserBean() {
		return userBean;
	}

	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}

	public List<String> getAllPermissions() {
		return allPermissions;
	}

	public void setAllPermissions(List<String> allPermissions) {
		this.allPermissions = allPermissions;
	}

	public Long[] getSeletedUserIds() {
		return selectedUserIds;
	}

	public void setSeletedUserIds(Long[] selectedUserIds) {
		this.selectedUserIds = selectedUserIds;
	}

	public Long getSelectedUserIdToModify() {
		return selectedUserIdToModify;
	}

	public void setSelectedUserIdToModify(Long selectedUserIdToModify) {
		this.selectedUserIdToModify = selectedUserIdToModify;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setUserGroupService(UserGroupService userGroupService) {
		this.userGroupService = userGroupService;
	}

	public String searchUsers() throws Exception{
		List<UserBean> searchUsers = userService.searchUsers(userSearchBean);
		this.searchedUsers = searchUsers;
		return SUCCESS;
	}
	
	public String activateUsers() throws Exception{
		userService.changeActivation(Arrays.asList(selectedUserIds), true);
		return SUCCESS;
	}
	
	public String deActivateUsers() throws Exception {
		userService.changeActivation(Arrays.asList(selectedUserIds), false);
		return SUCCESS;
	}
	
	public String loadUser() throws Exception {
		UserBean user = 
				userService.findUser(selectedUserIdToModify);
		this.userBean = user;
		return SUCCESS;
	}
	
	public String editUser() throws Exception {
		userService.update(userBean, userBean.getId());
		return SUCCESS;
	}
	
	public String searchPermissionWL() throws Exception {
		List<String> allGroups = findAllGroups();
		this.allPermissions = allGroups;
		return SUCCESS;
	}
	
	public String deleteUser() throws Exception {
		Arrays.asList(selectedUserIds);
		userService.delete(Arrays.asList(selectedUserIds));
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
