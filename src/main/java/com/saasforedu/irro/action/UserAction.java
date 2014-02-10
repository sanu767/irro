package com.saasforedu.irro.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.saasforedu.irro.bean.UserBean;
import com.saasforedu.irro.bean.UserGroupBean;
import com.saasforedu.irro.service.UserGroupService;
import com.saasforedu.irro.service.UserService;

public class UserAction extends ActionSupport implements SessionAware {
	
	private static final long serialVersionUID = -1415012188305514776L;
	
	private UserService userService;
	
	private UserGroupService userGroupService;
	
	private UserBean userBean;
	
	Map<String, Object> sessionAttributes;
	
	List<String> allPermissions;
	
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
		return "forgotPassword";
	}
	
	
	public String doRegister() throws Exception {
		if(isUserCodeOrEmailExists()) {
			return ERROR;
		}
		userBean.setRegistrationDate(new Date());
		Long userId = userService.create(userBean);
		return userId > 1 ? SUCCESS : ERROR;
	}
	
	public String doModify() throws Exception {
		if(isUserCodeOrEmailExists()) {
			return ERROR;
		}
		Long userId = (Long)sessionAttributes.get("userId");
		userService.update(userBean, userId);
		return SUCCESS;
	}
	
	public String forgotPassword() throws Exception{
		userService.forgotPassword(emailOfForgotUser);
		return SUCCESS;
	}
	
	public String doLogin() throws Exception {
		UserBean bean = userService.authenticate(userBean.getUserCode(), userBean.getPassword());
		if(bean != null) {
			sessionAttributes.put("userId", bean.getId());
			return SUCCESS;
		}
		
		return ERROR;
	}
	
	public String doLogOut() throws Exception {
		sessionAttributes.remove("userId");
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
	
}