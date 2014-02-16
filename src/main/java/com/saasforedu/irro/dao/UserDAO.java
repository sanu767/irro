package com.saasforedu.irro.dao;

import java.util.List;

import com.saasforedu.irro.bean.UserSearchBean;
import com.saasforedu.irro.model.IUser;

public interface UserDAO {
	
	/** Put CRUD in BaseDAO **/
	public Long create(IUser user);
	public void update(IUser user);
	public void delete(List<IUser> usersToDelete);
	public IUser findById(Long userId);
	public List<IUser> findAll(List<Long> userIds);
	public IUser authenticate(String userCode, String password);
	public IUser findbyEmailId(String emailId);
	
	public List<IUser> search(UserSearchBean userSearchBean);
	
	public void changeActivation(List<Long> userIds, boolean activate);
	
	public boolean isUserCodeOrEmailExists(String userCode, String email);
	
	public void deletePermissionsByGroupNames(List<String> groupNames);
	public void changePermissionType(List<Long> permissionIds, int permissionType);
}
