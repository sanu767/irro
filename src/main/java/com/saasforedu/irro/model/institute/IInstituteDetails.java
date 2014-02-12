package com.saasforedu.irro.model.institute;

import com.saasforedu.irro.model.IBaseEntity;
import com.saasforedu.irro.model.impl.MainContent;
import com.saasforedu.irro.model.institute.impl.Institute;

public interface IInstituteDetails extends IBaseEntity {
	
	public MainContent getContent();

	public void setContent(MainContent content);

	public Integer getType();

	public void setType(Integer type);

	public String getTypeName();

	public void setTypeName(String typeName);

	public String getConstitution();

	public void setConstitution(String constitution);

	public String getNews();

	public void setNews(String news);

	public String getMaterials();

	public void setMaterials(String materials);

	public String getContacts();

	public void setContacts(String contacts);

	public String getReviews();

	public void setReviews(String reviews);

	public String getEducationalActivies();

	public void setEducationalActivies(String educationalActivies);

	public String getShelter();

	public void setShelter(String shelter);

	public String getBibliography();

	public void setBibliography(String bibliography);

	public String getPublications();

	public void setPublications(String publications);

	public String getExhibitionCalendar();

	public void setExhibitionCalendar(String exhibitionCalendar);

	public String getUsefulLinks();

	public void setUsefulLinks(String usefulLinks);

	public String getSeminar();

	public void setSeminar(String seminar);

	public Integer getInstituteParentId();

	public void setInstituteParentId(Integer instituteParentId);

	public Institute getInstitute();

	public void setInstitute(Institute institute);
}
