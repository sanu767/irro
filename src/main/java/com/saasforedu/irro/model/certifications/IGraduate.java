package com.saasforedu.irro.model.certifications;

import com.saasforedu.irro.model.IBaseEntity;
import com.saasforedu.irro.model.certifications.impl.Certificate;
import com.saasforedu.irro.model.impl.MainContent;

public interface IGraduate extends IBaseEntity {

	public MainContent getContent();

	public void setContent(MainContent content);

	public Integer getType();

	public void setType(Integer type);

	public String getTypeName();

	public void setTypeName(String typeName);

	public String getRegulatoryDocument();

	public void setRegulatoryDocument(String regulatoryDocument);

	public String getStatistics();

	public void setStatistics(String statistics);

	public String getAnalytics();

	public void setAnalytics(String analytics);

	public Certificate getCert();

	public void setCert(Certificate cert);

}
