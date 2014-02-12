package com.saasforedu.irro.dao.certifications;

import com.saasforedu.irro.dao.IBaseDAO;
import com.saasforedu.irro.model.certifications.impl.Certificate;

public interface ICertificateDAO extends IBaseDAO<Certificate> {

	public String getMainContent();
	
	public Long findMax();
}
