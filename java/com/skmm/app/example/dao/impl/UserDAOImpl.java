package com.skmm.app.example.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.skmm.app.example.dao.UserDAO;
import com.skmm.app.example.model.User;

public class UserDAOImpl extends HibernateDaoSupport implements UserDAO {

	@Override
	public User findByCode(String code) {
		List findByNamedQuery = getHibernateTemplate().find(
				"select u from User u where u.code=?", code);
		return findByNamedQuery.size() > 0 ? (User) findByNamedQuery.get(0)
				: null;
	}

	@Override
	public void save(User user) throws Exception {
		getHibernateTemplate().save(user);
	}

	@Override
	public boolean isUserAlreadyExist(String code) {
		return findByCode(code) == null ? false : true;
	}
}