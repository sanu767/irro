package com.saasforedu.irro.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.saasforedu.irro.bean.UserBean;
import com.saasforedu.irro.bean.UserSearchBean;
import com.saasforedu.irro.dao.UserDAO;
import com.saasforedu.irro.enums.PermissionType;
import com.saasforedu.irro.model.IUser;
import com.saasforedu.irro.model.IUserPermission;
import com.saasforedu.irro.model.impl.User;
import com.saasforedu.irro.model.impl.UserPermission;
import com.saasforedu.irro.service.UserService;
import com.saasforedu.irro.util.IrroUtils;
import com.saasforedu.irro.util.Mail;

public class UserServiceImpl implements UserService {

	private UserDAO userDAO;

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	public Long create(UserBean userBean) {
		IUser newUser = new User();
		copyProperties(userBean, newUser);
		return userDAO.create(newUser);
	}

	@Override
	public void update(UserBean userBean, Long userId) {
		IUser user = userDAO.findById(userId);
		copyProperties(userBean, user);
		userDAO.update(user);
	}

	@Override
	public void delete(List<Long> userIdsToDelete) {
		List<IUser> usersToDelete = userDAO.findAll(userIdsToDelete);
		userDAO.delete(usersToDelete);
	}

	@Override
	public UserBean findUser(Long userId) {
		IUser user = userDAO.findById(userId);
		UserBean userBean = new UserBean();
		copyProperties(user, userBean);
		return userBean;
	}

	@Override
	public List<UserBean> searchUsers(UserSearchBean userSearchBean) {
		List<IUser> users = userDAO.search(userSearchBean);
		List<UserBean> userBeans = new ArrayList<UserBean>();
		if(CollectionUtils.isNotEmpty(users)) {
			for (IUser user : users) {
				UserBean newUserBean = new UserBean();
				copyProperties(user, newUserBean);
			}
		}		
		return userBeans;
	}

	@Override
	public void forgotPassword(String email) {
		IUser user = userDAO.findbyEmailId(email);
		if(user != null) {
			Mail mail = IrroUtils.getMail(user);
			IrroUtils.sendMail(mail);
		}
	}
	
	@Override
	public UserBean authenticate(String userCode, String password) {
		IUser user = userDAO.authenticate(userCode, password);
		if(user != null) {
			UserBean userBean = new UserBean();
			copyProperties(user, userBean);
			return userBean;
		}		
		return null;
	}
	
	@Override
	public void changeActivation(List<Long> userIds, boolean activate) {
		userDAO.changeActivation(userIds, activate);
	}
	
	@Override
	public boolean isUserCodeOrEmailExists(String userCode, String email) {
		return userDAO.isUserCodeOrEmailExists(userCode, email);
	}
	
	@Override
	public void deletePermissionsByGroupNames(List<String> groupNames) {
		userDAO.deletePermissionsByGroupNames(groupNames);
	}

	private void copyProperties(IUser user, UserBean userBean) {
		userBean.setId(user.getId());
		userBean.setUserCode(user.getUserCode());
		userBean.setAddress(user.getAddress());
		userBean.setEmail(user.getEmail());
		userBean.setPassword(user.getPassword());
		//userBean.setPermissions(user.getPermissions());
		userBean.setPhoneNumber(user.getPhoneNumber());
		userBean.setRegistrationDate(user.getRegistrationDate());
		userBean.setUserName(user.getUserName());
		userBean.setUserSurname(user.getUserSurname());		
		userBean.setActive(user.isActive());
		userBean.setMaxUploadFileSize(user.getMaxUploadFileSize());
	}

	private void copyProperties(UserBean userBean, IUser user) {
		user.setUserCode(userBean.getUserCode());
		user.setAddress(userBean.getAddress());
		user.setEmail(userBean.getEmail());
		user.setPassword(userBean.getPassword());
		
		List<IUserPermission> updatedPermissions = getUpdatedPermissions(userBean, user);
		user.setPermissions(updatedPermissions);
				
		user.setPhoneNumber(userBean.getPhoneNumber());
		user.setRegistrationDate(userBean.getRegistrationDate());
		user.setUserName(userBean.getUserName());
		user.setUserSurname(userBean.getUserSurname());
		user.setActive(userBean.isActive());
		user.setMaxUploadFileSize(userBean.getMaxUploadFileSize());
	}
	
	private List<IUserPermission> getUpdatedPermissions(UserBean userBean, IUser user) {
		List<String> selectedPermissions = userBean.getSelectedPermissions();
		List<IUserPermission> permissionsInDB = user.getPermissions();
		List<IUserPermission> updatedPermissionsInDB =  new ArrayList<IUserPermission>();
		if(CollectionUtils.isNotEmpty(permissionsInDB)) {
			for (IUserPermission permissionInDB : permissionsInDB) {
				if(selectedPermissions.contains(permissionInDB.getPermissionName())) {
					if(!permissionInDB.getPermissionType().equals(PermissionType.APPROVED)) {
						permissionInDB.setPermissionType(PermissionType.REQUEST_APPROVAL.getTypeId());
					}
					updatedPermissionsInDB.add(permissionInDB);
					selectedPermissions.remove(permissionInDB.getPermissionName());
				}
			}
		}
		
		//New Permissions
		if(CollectionUtils.isNotEmpty(selectedPermissions)) {
			for (String selectedPermission : selectedPermissions) {
				IUserPermission userPermission = new UserPermission();
				userPermission.setPermissionName(selectedPermission);
				userPermission.setPermissionType(PermissionType.REQUEST_APPROVAL.getTypeId());
				userPermission.setUser(user);
				updatedPermissionsInDB.add(userPermission);
			}
		}
		return updatedPermissionsInDB;
	}

	
	
}