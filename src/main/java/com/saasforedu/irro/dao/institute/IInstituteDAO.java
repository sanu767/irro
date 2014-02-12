package com.saasforedu.irro.dao.institute;

import com.saasforedu.irro.dao.IBaseDAO;
import com.saasforedu.irro.model.institute.impl.Institute;

public interface IInstituteDAO extends IBaseDAO<Institute> {

	public String getMainContent();

	public Long findMax();
}
