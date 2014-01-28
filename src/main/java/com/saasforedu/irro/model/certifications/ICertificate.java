package com.saasforedu.irro.model.certifications;

import java.util.List;

import com.saasforedu.irro.model.IBaseEntity;
import com.saasforedu.irro.model.certifications.impl.Employee;
import com.saasforedu.irro.model.certifications.impl.Graduate;
import com.saasforedu.irro.model.impl.MainContent;

public interface ICertificate extends IBaseEntity {

	public MainContent getContent();

	public void setContent(MainContent content);

	public Employee getEmployee();

	public void setEmployee(Employee employee);

	public List<Graduate> getGraduates();

	public void setGraduates(List<Graduate> graduates);

}
