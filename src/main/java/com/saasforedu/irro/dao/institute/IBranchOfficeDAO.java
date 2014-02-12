package com.saasforedu.irro.dao.institute;

import com.saasforedu.irro.dao.IBaseDAO;
import com.saasforedu.irro.model.institute.impl.BranchOffice;

public interface IBranchOfficeDAO extends IBaseDAO<BranchOffice> {

	public String getMainContent();

	public Long findMax();
}
