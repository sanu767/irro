package com.saasforedu.irro.model.institute;

import com.saasforedu.irro.model.IBaseEntity;
import com.saasforedu.irro.model.impl.MainContent;
import com.saasforedu.irro.model.institute.impl.Institute;

public interface IDocument extends IBaseEntity {

	public MainContent getContent();

	public void setContent(MainContent content);

	public String getLicense();

	public void setLicense(String license);

	public String getConstitution();

	public void setConstitution(String constitution);

	public String getSupervisoryBoard();

	public void setSupervisoryBoard(String supervisoryBoard);

	public String getPaidEducationalServices();

	public void setPaidEducationalServices(String paidEducationalServices);

	public String getLabourLawRegulations();

	public void setLabourLawRegulations(String labourLawRegulations);

	public String getControlMeasures();

	public void setControlMeasures(String controlMeasures);

	public Institute getInstitute();

	public void setInstitute(Institute institute);
}
