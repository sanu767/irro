package com.saasforedu.irro.dao.institute;

import com.saasforedu.irro.dao.IBaseDAO;
import com.saasforedu.irro.model.institute.impl.InstituteDetails;

public interface IInstituteDetailsDAO extends IBaseDAO<InstituteDetails> {

	public String getMainContent(int type);

	public Long findMax();
	
	public InstituteDetails findByDepartmentType(int type);

	public String getNews(int type);

	String getContacts(int type);

	String getMaterials(int type);

	String getConstitution(int type);
}
