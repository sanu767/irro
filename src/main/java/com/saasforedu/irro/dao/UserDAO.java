package com.saasforedu.irro.dao;

import java.util.List;

import com.saasforedu.irro.bean.UserSearchBean;
import com.saasforedu.irro.model.IUser;
import com.saasforedu.irro.model.IUserPermission;
import com.saasforedu.irro.model.impl.User;

public interface UserDAO extends IBaseDAO<User> {
	
	public void delete(List<IUser> usersToDelete);
	public void update(IUser user, List<IUserPermission> removedPermissions);
	
	public List<IUser> findAll(List<Long> userIds);
	
	public IUser authenticate(String userCode, String password);
	
	public IUser findbyEmailId(String emailId);
	
	public List<IUser> search(UserSearchBean userSearchBean);
	
	public void changeActivation(List<Long> userIds, boolean activate);
	
	public boolean isUserCodeOrEmailExists(String userCode, String email);
	
	public void deletePermissionsByGroupNames(List<String> groupNames);
	
}