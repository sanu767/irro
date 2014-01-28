package com.saasforedu.irro.model.institute;

import com.saasforedu.irro.model.IBaseEntity;
import com.saasforedu.irro.model.institute.impl.Institute;

public interface IBranchOffice extends IBaseEntity {

	public String getMainBranch();

	public void setMainBranch(String mainBranch);

	public String getNizhny();

	public void setNizhny(String nizhny);

	public String getKamyshlov();

	public void setKamyshlov(String kamyshlov);

	public String getKrasnoufimsk();

	public void setKrasnoufimsk(String krasnoufimsk);

	public String getSerov();

	public void setSerov(String serov);

	public Institute getInstitute();

	public void setInstitute(Institute institute);
}
