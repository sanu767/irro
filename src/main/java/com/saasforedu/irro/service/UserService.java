package com.saasforedu.irro.service;

import java.util.List;

import com.saasforedu.irro.bean.UserBean;
import com.saasforedu.irro.bean.UserSearchBean;
import com.saasforedu.irro.enums.PermissionType;

public interface UserService {
	
	//CRUD Operations
	public Long create(final UserBean userBean);
	public void update(UserBean userBean, Long userId);
	public void delete(List<Long> usersToDelete);
	public UserBean findById(Long userId);
	
	//Business methods relates to User
	public UserBean authenticate(String userCode, String password);
	public List<UserBean> searchUsers(UserSearchBean userSearchBean);
	public void forgotPassword(String email);	
	public void changeActivation(List<Long> userIds, boolean activate);
	public boolean isUserCodeOrEmailExists(String userCode, String email);
	
	//Business methods related to Permission
	public void deletePermissionsByGroupNames(List<String> groupNames);
	public void changePermissions(List<Long> permissionIds, PermissionType permissionType);
	public void addNewPermissions(UserBean userBean, List<String> selectedPermissions);
	
}