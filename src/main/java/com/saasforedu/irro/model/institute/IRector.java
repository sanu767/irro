package com.saasforedu.irro.model.institute;

import com.saasforedu.irro.model.IBaseEntity;
import com.saasforedu.irro.model.impl.MainContent;
import com.saasforedu.irro.model.institute.impl.Institute;

public interface IRector extends IBaseEntity {

	public MainContent getContent();

	public void setContent(MainContent content);

	public String getMediaReport();

	public void setMediaReport(String mediaReport);

	public String getPublications();

	public void setPublications(String publications);

	public String getPhotoGallery();

	public void setPhotoGallery(String photoGallery);

	public Institute getInstitute();

	public void setInstitute(Institute institute);
}
