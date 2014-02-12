package com.saasforedu.irro.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.saasforedu.irro.dao.IBaseDAO;
import com.saasforedu.irro.model.IBaseEntity;

public abstract class BaseDAOimpl<E extends IBaseEntity> extends
		HibernateDaoSupport implements IBaseDAO<E> {

	public Serializable create(E entity) {
		return getHibernateTemplate().save(entity);
	}

	public void update(E entity) {
		getHibernateTemplate().update(entity);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public E findById(Class clazz, Long id) {
		return (E) getHibernateTemplate().get(clazz, id);
	}

	@SuppressWarnings("rawtypes")
	public String fetchMainContent(String query) {
		List result = getHibernateTemplate().find(query);
		return (String) result.get(0);
	}

	public Long findMax(String query) {
		return (Long) getHibernateTemplate().find(query).get(0);
	}
}
