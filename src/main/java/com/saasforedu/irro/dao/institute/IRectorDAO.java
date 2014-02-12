package com.saasforedu.irro.dao.institute;

import com.saasforedu.irro.dao.IBaseDAO;
import com.saasforedu.irro.model.institute.impl.Rector;

public interface IRectorDAO extends IBaseDAO<Rector> {

	public String getMainContent();
	
	public Long findMax();
}
