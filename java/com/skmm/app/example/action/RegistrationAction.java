package com.skmm.app.example.action;

import com.opensymphony.xwork2.ActionSupport;
import com.skmm.app.example.model.User;
import com.skmm.app.example.service.UserService;

public class RegistrationAction extends ActionSupport{

	private static final long serialVersionUID = -994686035185563587L;
	
	private UserService userService ;
	
	private User user;

	public String doRegistration() throws Exception {
		try {
			if(!userService.isUserAlreadyExist(user.getCode()))
				userService.save(user);
			else{
				//TODO set error user id already exist
				return ERROR;
			}
		} catch (Exception e) {
			return ERROR;
		}
		 return SUCCESS;
	}
	
	public UserService getUserService() {
		return userService;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
