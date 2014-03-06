package com.saasforedu.irro.service.institute;

import com.saasforedu.irro.bean.ContentBean;

public interface IInstituteDetailsService {

	public String getMainContent(int type);

	public void updateContent(ContentBean content);

	public void updateContent(int type, String mainContent);

	public String getNews(int deparmentType);

	void updateNews(int type, String news);

	String getContacts(int type);

	void updateContacts(int type, String contacts);

	String getMaterials(int type);

	void updateMaterials(int type, String materials);

	String getConstitution(int type);

	void updateConstitution(int type, String constitution);
}
