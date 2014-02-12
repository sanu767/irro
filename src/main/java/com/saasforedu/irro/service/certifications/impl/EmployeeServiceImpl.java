package com.saasforedu.irro.service.certifications.impl;

import com.saasforedu.irro.bean.ContentBean;
import com.saasforedu.irro.dao.certifications.IEmployeeDAO;
import com.saasforedu.irro.model.certifications.impl.Employee;
import com.saasforedu.irro.service.certifications.IEmployeeService;

public class EmployeeServiceImpl implements IEmployeeService {

	private IEmployeeDAO employeeDAO;

	public void setEmployeeDAO(IEmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}

	@Override
	public String getMainContent() {
		return employeeDAO.getMainContent();
	}

	@Override
	public void updateContent(ContentBean contentBean) {
		Long id = employeeDAO.findMax();
		Employee rector = employeeDAO.findById(Employee.class, id);
		copyProperties(contentBean, rector);
		employeeDAO.update(rector);
	}

	private void copyProperties(ContentBean contentBean, Employee rector) {
		rector.getContent().setMainContent(contentBean.getMainContent());
	}
}
