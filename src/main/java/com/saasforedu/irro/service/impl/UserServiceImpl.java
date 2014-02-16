package com.saasforedu.irro.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;

import com.saasforedu.irro.bean.UserBean;
import com.saasforedu.irro.bean.UserPermissionBean;
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
	public UserBean findById(Long userId) {
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
				userBeans.add(newUserBean);
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

	@Override
	public void changePermissions(List<Long> permissionIds, PermissionType permissionType) {
		userDAO.changePermissionType(permissionIds, permissionType.getTypeId());		
	}
	
	@Override
	public void addNewPermissions(UserBean userBean, List<String> selectedPermissions) {
		Long userId = userBean.getId();
		IUser user = userDAO.findById(userId);
		//Fetch Existing permissions
		List<IUserPermission> permissions = new ArrayList<IUserPermission>();
		permissions.addAll(user.getPermissions());
		
		//Add new permissions
		for (String selectedPermission : selectedPermissions) {
			IUserPermission userPermission = new UserPermission();
			userPermission.setPermissionName(selectedPermission);
			userPermission.setPermissionType(PermissionType.REQUEST_APPROVAL.getTypeId());
			userPermission.setUser(user);
			permissions.add(userPermission);
		}
		userDAO.update(user);
	}
	
	private void copyProperties(IUser user, UserBean userBean) {
		userBean.setId(user.getId());
		userBean.setUserCode(user.getUserCode());
		userBean.setAddress(user.getAddress());
		userBean.setEmail(user.getEmail());
		userBean.setPassword(user.getPassword());
		userBean.setPermissionBeans(getPermissionBeans(user, userBean));
		userBean.setPhoneNumber(user.getPhoneNumber());
		userBean.setRegistrationDate(user.getRegistrationDate());
		userBean.setUserName(user.getUserName());
		userBean.setUserSurname(user.getUserSurname());		
		userBean.setActive(user.isActive());
		userBean.setMaxUploadFileSize(user.getMaxUploadFileSize());
	}

	private void copyProperties(UserBean userBean, IUser user) {
		String userCode = userBean.getUserCode();
		if(StringUtils.isNotBlank(userCode)) {
			user.setUserCode(userCode);
		}
		
		String address = userBean.getAddress();
		if(StringUtils.isNotBlank(address)) {
			user.setAddress(address);
		}
		
		String email = userBean.getEmail();
		if(StringUtils.isNotBlank(email)) {
			user.setEmail(email);
		}
		
		String password = userBean.getPassword();
		if(StringUtils.isNotBlank(password)) {
			user.setPassword(password);
		}
		
		Integer phone = userBean.getPhoneNumber();
		if(phone != null) {
			user.setPhoneNumber(phone);
		}
		
		Date regDate = userBean.getRegistrationDate();
		if(regDate != null) {
			user.setRegistrationDate(regDate);
		}
		
		String userName = userBean.getUserName();
		if(StringUtils.isNotBlank(userName)) {
			user.setUserName(userName);
		}
		
		String userSurName = userBean.getUserSurname();
		if(StringUtils.isNotBlank(userSurName)) {
			user.setUserSurname(userSurName);
		}
		
		List<IUserPermission> updatedPermissions = getUpdatedPermissions(userBean, user);
		user.setPermissions(updatedPermissions);
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
	
	private List<UserPermissionBean> getPermissionBeans(IUser user, UserBean userBean)  {
		List<IUserPermission> permissionsInDB = user.getPermissions();
		if(CollectionUtils.isNotEmpty(permissionsInDB)) {
			List<UserPermissionBean> userPermissionBeans = new ArrayList<UserPermissionBean>();
			for (IUserPermission permissionInDB : permissionsInDB) {
				UserPermissionBean userPermissionBean = new UserPermissionBean();
				userPermissionBean.setPermissionName(permissionInDB.getPermissionName());
				userPermissionBean.setPermissionType(permissionInDB.getPermissionType());
				userPermissionBean.setPermissionId(permissionInDB.getId());
				userPermissionBean.setUserId(permissionInDB.getUser().getId());
				userPermissionBeans.add(userPermissionBean);
			}
			return userPermissionBeans;
		}
		return null;
	}
}