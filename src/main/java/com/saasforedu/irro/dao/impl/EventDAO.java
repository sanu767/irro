package com.saasforedu.irro.dao.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.saasforedu.irro.dao.IEventDAO;
import com.saasforedu.irro.model.impl.Event;

public class EventDAO extends BaseDAOimpl<Event> implements IEventDAO {

	public void saveAll(List<Event> events) {
		getHibernateTemplate().saveOrUpdateAll(events);
	}

	@SuppressWarnings("unchecked")
	public List<Event> findEventsForPeriod(int numberOfMonths) {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, -numberOfMonths);
		Date previousDate = cal.getTime();

		String query = "select e from Event e where e.date > ? order by e.date";

		return getHibernateTemplate().find(query, new Object[] { previousDate });
	}
}
