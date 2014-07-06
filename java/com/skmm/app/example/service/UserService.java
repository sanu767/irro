package com.skmm.app.example.service;

import com.skmm.app.example.model.User;

public interface UserService {
	User findByCode(String code);

	void save(User user) throws Exception;

	boolean isUserAlreadyExist(String code);
}
