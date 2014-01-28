package com.saasforedu.irro.model.certifications;

import com.saasforedu.irro.model.IBaseEntity;
import com.saasforedu.irro.model.certifications.impl.Certificate;
import com.saasforedu.irro.model.impl.MainContent;

public interface IEmployee extends IBaseEntity {

	public MainContent getContent();

	public void setContent(MainContent content);

	public String getRegulatoryDocument();

	public void setRegulatoryDocument(String regulatoryDocument);

	public String getInformation();

	public void setInformation(String information);

	public String getMaterial();

	public void setMaterial(String material);

	public Certificate getCert();

	public void setCert(Certificate cert);

}
