package com.saasforedu.irro.model.institute;

import java.util.List;

import com.saasforedu.irro.model.IBaseEntity;
import com.saasforedu.irro.model.impl.MainContent;
import com.saasforedu.irro.model.institute.impl.BranchOffice;
import com.saasforedu.irro.model.institute.impl.Document;
import com.saasforedu.irro.model.institute.impl.InstituteDetails;
import com.saasforedu.irro.model.institute.impl.Rector;

public interface IInstitute extends IBaseEntity {

	public MainContent getContent();

	public void setContent(MainContent content);

	public String getHistory();

	public void setHistory(String history);

	public String getLogistics();

	public void setLogistics(String logistics);

	public String getJobs();

	public void setJobs(String jobs);

	public String getContacts();

	public void setContacts(String contacts);

	public Rector getRector();

	public void setRector(Rector rector);

	public Document getDocument();

	public void setDocument(Document document);

	public BranchOffice getBranchOffice();

	public void setBranchOffice(BranchOffice branchOffice);

	public List<InstituteDetails> getInstituteDetails();

	public void setInstituteDetails(List<InstituteDetails> instituteDetails);
}
