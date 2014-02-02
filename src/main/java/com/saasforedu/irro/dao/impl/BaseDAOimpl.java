package com.saasforedu.irro.dao.impl;

import java.io.Serializable;

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
}
