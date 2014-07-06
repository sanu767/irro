package com.skmm.app.example.service.impl;

import com.skmm.app.example.dao.UserDAO;
import com.skmm.app.example.model.User;
import com.skmm.app.example.service.UserService;

public class UserServiceImpl implements UserService {

	UserDAO userDAO;

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	public User findByCode(String code) {
		return userDAO.findByCode(code);
	}

	@Override
	public void save(User user) throws Exception {
		userDAO.save(user);
	}

	@Override
	public boolean isUserAlreadyExist(String code) {
		return userDAO.isUserAlreadyExist(code);
	}

}
