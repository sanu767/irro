package com.skmm.app.example.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.skmm.app.example.dao.ItemDAO;
import com.skmm.app.example.model.Item;

public class ItemDAOImpl extends HibernateDaoSupport implements ItemDAO {

	@Override
	public Serializable create(Item item) {
		return getHibernateTemplate().save(item);
	}

	@Override
	public List<Item> getItems(String eventType) {
		return getHibernateTemplate().find("from Item i where i.type = ?",
				eventType);
	}

	@Override
	public List<Item> getAllItems() {
		return getHibernateTemplate().find("from Item ");
	}
}
