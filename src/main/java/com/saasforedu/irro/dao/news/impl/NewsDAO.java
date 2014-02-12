package com.saasforedu.irro.dao.news.impl;

import com.saasforedu.irro.dao.impl.BaseDAOimpl;
import com.saasforedu.irro.dao.news.INewsDAO;
import com.saasforedu.irro.model.institute.impl.Rector;
import com.saasforedu.irro.model.news.impl.News;

public class NewsDAO extends BaseDAOimpl<News> implements INewsDAO {

	public String getMainContent() {
		return fetchMainContent("select r.content.mainContent from News r");
	}

	public Long findMax() {
		return findMax("select max(r.id) from News r");
	}
	
	public Rector findById(Long id) {
		return (Rector) getHibernateTemplate().get(News.class, id);
	}
}
