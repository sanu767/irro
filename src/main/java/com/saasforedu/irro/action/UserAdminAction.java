package com.saasforedu.irro.action;

import java.util.Arrays;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.saasforedu.irro.bean.UserBean;
import com.saasforedu.irro.bean.UserSearchBean;
import com.saasforedu.irro.service.UserService;

public class UserAdminAction extends ActionSupport {

	private static final long serialVersionUID = 8986044240485817125L;
	
	private UserService userService;
    
	private List<UserBean> searchedUsers;
    
	private UserSearchBean userSearchBean;

	private UserBean userBean;
	
	private Long [] selectedUserIds;
	
	private Long selectedUserIdToModify;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
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

	public UserBean getUserBean() {
		return userBean;
	}

	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}

	public Long[] getSelectedUserIds() {
		return selectedUserIds;
	}

	public void setSelectedUserIds(Long[] selectedUserIds) {
		this.selectedUserIds = selectedUserIds;
	}

	public Long getSelectedUserIdToModify() {
		return selectedUserIdToModify;
	}

	public void setSelectedUserIdToModify(Long selectedUserIdToModify) {
		this.selectedUserIdToModify = selectedUserIdToModify;
	}

	public String searchUsers() throws Exception{
		List<UserBean> searchUsers = userService.searchUsers(userSearchBean);
		this.searchedUsers = searchUsers;
		return SUCCESS;
	}
	
	public String activateUsers() throws Exception{
		userService.changeActivation(Arrays.asList(getSelectedUserIds()), true);
		return SUCCESS;
	}
	
	public String deActivateUsers() throws Exception {
		userService.changeActivation(Arrays.asList(getSelectedUserIds()), false);
		return SUCCESS;
	}
	
	public String loadUser() throws Exception {
		UserBean user = 
				userService.findById(selectedUserIdToModify);
		this.userBean = user;
		return SUCCESS;
	}
	
	public String editUser() throws Exception {
		userService.update(userBean, userBean.getId());
		return SUCCESS;
	}
	
	public String deleteUser() throws Exception {
		userService.delete(Arrays.asList(getSelectedUserIds()));
		return SUCCESS;
	}
}
