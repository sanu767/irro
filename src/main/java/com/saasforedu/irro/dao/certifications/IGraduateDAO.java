package com.saasforedu.irro.dao.certifications;

import com.saasforedu.irro.dao.IBaseDAO;
import com.saasforedu.irro.model.certifications.impl.Graduate;

public interface IGraduateDAO extends IBaseDAO<Graduate> {

	public String getMainContent();
	
	public Long findMax();
}
