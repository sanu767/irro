package com.skmm.app.example.dao;

import com.skmm.app.example.model.User;

public interface UserDAO {
	User findByCode(String code);
	void save(User user) throws Exception;
	boolean isUserAlreadyExist(String code);
}
