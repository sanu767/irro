package com.saasforedu.irro.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.struts2.interceptor.SessionAware;

import com.saasforedu.irro.article.action.MenuBaseAction;
import com.saasforedu.irro.bean.UserBean;
import com.saasforedu.irro.bean.UserGroupBean;
import com.saasforedu.irro.bean.UserPermissionBean;
import com.saasforedu.irro.service.MenuMetadataService;
import com.saasforedu.irro.service.UserGroupService;
import com.saasforedu.irro.service.UserService;
import com.saasforedu.irro.util.IConstants;
import com.saasforedu.irro.util.IrroUtils;

public class UserAction extends MenuBaseAction implements SessionAware {
	
	private static final long serialVersionUID = -1415012188305514776L;
	
	private UserService userService;
	
	private UserGroupService userGroupService;
	
	private MenuMetadataService menuMetadataService;
	
	private UserBean userBean;
	
	Map<String, Object> sessionAttributes;
	
	List<String> allPermissions;
	
	private Long selectedUserIdToModify;
	
	private String emailOfForgotUser;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public void setUserGroupService(UserGroupService userGroupService) {
		this.userGroupService = userGroupService;
	}
	
	public UserBean getUserBean() {
		return userBean;
	}

	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}

	public String getEmailOfForgotUser() {
		return emailOfForgotUser;
	}

	public void setEmailOfForgotUser(String emailOfForgotUser) {
		this.emailOfForgotUser = emailOfForgotUser;
	}

	public List<String> getAllPermissions() {
		return allPermissions;
	}

	public void setAllPermissions(List<String> allPermissions) {
		this.allPermissions = allPermissions;
	}

	public boolean isUserCodeOrEmailExists() throws Exception {
		return userService.isUserCodeOrEmailExists(userBean.getUserCode(), 
				userBean.getEmail());
	}
	
	public String loginWL() {
		super.loadTopMenu();
		return "login";
	}
	
	public String registerWL() {
		List<String> allGroups = findAllGroups();
		this.allPermissions = allGroups;
		return "register";
	}
	
	public String modifyWL() {
		List<String> allGroups = findAllGroups();
		this.allPermissions = allGroups;
		return "modify";
	}

	public String forgotPasswordWL() {
		super.loadTopMenu();
		return "forgotPassword";
	}
	
	
	public String doRegister() throws Exception {
		if(isUserCodeOrEmailExists()) {
			addActionError("User Code or Email Exists");
			return ERROR;
		}
		userBean.setRegistrationDate(new Date());
		userBean.setActive(true);
		Long userId = userService.create(userBean);
		return userId > 1 ? SUCCESS : ERROR;
	}
	
	public String doModify() throws Exception {
		if(isUserCodeOrEmailExists()) {
			return ERROR;
		}
		Long userId = (Long)sessionAttributes.get(IConstants.USER_ID_SESSION_ATTRIBUTE_NAME);
		userService.update(userBean, userId);
		return SUCCESS;
	}
	
	public String loadUser() throws Exception {
		super.loadTopMenu();
		List<String> allGroups = findAllGroups();
		this.allPermissions = allGroups;
		UserBean user = userService.findById(selectedUserIdToModify);
		this.userBean = user;
		return SUCCESS;
	}
	
	public String forgotPassword() throws Exception{
		super.loadTopMenu();
		userService.forgotPassword(emailOfForgotUser);
		return SUCCESS;
	}
	
	public String doLogin() throws Exception {
		super.loadTopMenu();
		UserBean bean = userService.authenticate(userBean.getUserCode(), userBean.getPassword());
		if(bean != null) {
			sessionAttributes.put(IConstants.USER_ID_SESSION_ATTRIBUTE_NAME, bean.getId());
			/** Could be done in more efficient way **/
			if(bean.isActive()) {
				List<UserGroupBean> allGroups = userGroupService.findAll();
				if(CollectionUtils.isNotEmpty(allGroups)) {
					if(bean.isSuperAdmin()) {
						setAllPermissionsForSuperAdmin(allGroups);
					} else {
						addPermissionsForUser(bean.getPermissionBeans(), allGroups);
					}
				}
			}
			return SUCCESS;
		}
		return ERROR;
	}

	private void addPermissionsForUser(List<UserPermissionBean> permissionBeans, List<UserGroupBean> allGroups) {
		if(CollectionUtils.isNotEmpty(permissionBeans)) {
			List<String> permissionList = IrroUtils.getPermissionMap(allGroups, permissionBeans);
			if(CollectionUtils.isNotEmpty(permissionList)) {
				List<Long> menuIds = menuMetadataService.findIdsByCodes(permissionList);
				sessionAttributes.put(IConstants.PERMISSION_LIST_SESSION_ATTRIBUTE_NAME, menuIds);
			}
		}
	}

	private void setAllPermissionsForSuperAdmin(List<UserGroupBean> allGroups) {
		List<String> permissionBeans = new ArrayList<String>();
		for(UserGroupBean eachGroup : allGroups) {
			permissionBeans.add(eachGroup.getGroupName());
		}
		List<Long> menuIds = menuMetadataService.findIdsByCodes(permissionBeans);
		sessionAttributes.put(IConstants.PERMISSION_LIST_SESSION_ATTRIBUTE_NAME, menuIds);
	}
	
	public String doLogOut() throws Exception {
		super.loadTopMenu();
		sessionAttributes.remove(IConstants.USER_ID_SESSION_ATTRIBUTE_NAME);
		sessionAttributes.remove(IConstants.PERMISSION_LIST_SESSION_ATTRIBUTE_NAME);
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

	@Override
	public void setSession(Map<String, Object> sessionAttributes) {
		this.sessionAttributes = sessionAttributes;
	}

	public UserService getUserService() {
		return userService;
	}

	public Long getSelectedUserIdToModify() {
		return selectedUserIdToModify;
	}

	public void setSelectedUserIdToModify(Long selectedUserIdToModify) {
		this.selectedUserIdToModify = selectedUserIdToModify;
	}

	public MenuMetadataService getMenuMetadataService() {
		return menuMetadataService;
	}

	public void setMenuMetadataService(MenuMetadataService menuMetadataService) {
		this.menuMetadataService = menuMetadataService;
	}
}