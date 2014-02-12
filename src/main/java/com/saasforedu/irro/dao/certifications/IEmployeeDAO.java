package com.saasforedu.irro.dao.certifications;

import com.saasforedu.irro.dao.IBaseDAO;
import com.saasforedu.irro.model.certifications.impl.Employee;

public interface IEmployeeDAO extends IBaseDAO<Employee> {

	public String getMainContent();
	
	public Long findMax();
}
