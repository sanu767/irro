package com.saasforedu.irro.dao.certifications.impl;

import com.saasforedu.irro.dao.certifications.IEmployeeDAO;
import com.saasforedu.irro.dao.impl.BaseDAOimpl;
import com.saasforedu.irro.model.certifications.impl.Employee;
import com.saasforedu.irro.model.institute.impl.Rector;

public class EmployeeDAO extends BaseDAOimpl<Employee> implements IEmployeeDAO {

	public String getMainContent() {
		return fetchMainContent("select r.content.mainContent from Employee r");
	}

	public Long findMax() {
		return findMax("select max(r.id) from Employee r");
	}
	
	public Rector findById(Long id) {
		return (Rector) getHibernateTemplate().get(Employee.class, id);
	}
}
