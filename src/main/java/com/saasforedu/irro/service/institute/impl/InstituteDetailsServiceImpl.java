package com.saasforedu.irro.service.institute.impl;

import com.saasforedu.irro.bean.ContentBean;
import com.saasforedu.irro.dao.institute.IInstituteDetailsDAO;
import com.saasforedu.irro.model.impl.MainContent;
import com.saasforedu.irro.model.institute.impl.InstituteDetails;
import com.saasforedu.irro.service.institute.IInstituteDetailsService;

public class InstituteDetailsServiceImpl implements IInstituteDetailsService {

	private IInstituteDetailsDAO instituteDetailsDAO;

	public void setInstituteDetailsDAO(IInstituteDetailsDAO instituteDetailsDAO) {
		this.instituteDetailsDAO = instituteDetailsDAO;
	}

	@Override
	public String getMainContent(int type) {
		return instituteDetailsDAO.getMainContent(type);
	}

	@Override
	public void updateContent(ContentBean contentBean) {
		Long id = instituteDetailsDAO.findMax();
		InstituteDetails rector = instituteDetailsDAO.findById(InstituteDetails.class, id);
		copyProperties(contentBean, rector);
		instituteDetailsDAO.update(rector);
	}

	private void copyProperties(ContentBean contentBean, InstituteDetails rector) {
		rector.getContent().setMainContent(contentBean.getMainContent());
	}

	@Override
	public void updateContent(int type, String mainContent) {
		InstituteDetails instituteDetails = instituteDetailsDAO.findByDepartmentType(type);
		if(instituteDetails == null) {
			instituteDetails = new InstituteDetails();
			MainContent content = new MainContent();
			content.setMainContent(mainContent);
			instituteDetails.setContent(content);
			instituteDetails.setType(type);
			instituteDetailsDAO.create(instituteDetails);
			return;
		}
		instituteDetails.getContent().setMainContent(mainContent);
		instituteDetailsDAO.update(instituteDetails);
	}

	@Override
	public String getNews(int type) {
		return instituteDetailsDAO.getNews(type);
	}
	
	@Override
	public void updateNews(int type, String news) {
		InstituteDetails instituteDetails = instituteDetailsDAO.findByDepartmentType(type);
		if(instituteDetails == null) {
			instituteDetails = new InstituteDetails();
			instituteDetails.setNews(news);
			instituteDetails.setType(type);
			instituteDetailsDAO.create(instituteDetails);
			return;
		}
		instituteDetails.setNews(news);
		instituteDetailsDAO.update(instituteDetails);
	}
	
	@Override
	public String getContacts(int type) {
		return instituteDetailsDAO.getContacts(type);
	}
	
	@Override
	public void updateContacts(int type, String contacts) {
		InstituteDetails instituteDetails = instituteDetailsDAO.findByDepartmentType(type);
		if(instituteDetails == null) {
			instituteDetails = new InstituteDetails();
			instituteDetails.setContacts(contacts);
			instituteDetails.setType(type);
			instituteDetailsDAO.create(instituteDetails);
			return;
		}
		instituteDetails.setContacts(contacts);
		instituteDetailsDAO.update(instituteDetails);
	}
	
	@Override
	public String getMaterials(int type) {
		return instituteDetailsDAO.getMaterials(type);
	}
	
	@Override
	public void updateMaterials(int type, String materials) {
		InstituteDetails instituteDetails = instituteDetailsDAO.findByDepartmentType(type);
		if(instituteDetails == null) {
			instituteDetails = new InstituteDetails();
			instituteDetails.setMaterials(materials);
			instituteDetails.setType(type);
			instituteDetailsDAO.create(instituteDetails);
			return;
		}
		instituteDetails.setMaterials(materials);
		instituteDetailsDAO.update(instituteDetails);
	}
	
	@Override
	public String getConstitution(int type) {
		return instituteDetailsDAO.getConstitution(type);
	}
	
	@Override
	public void updateConstitution(int type, String constitution) {
		InstituteDetails instituteDetails = instituteDetailsDAO.findByDepartmentType(type);
		if(instituteDetails == null) {
			instituteDetails = new InstituteDetails();
			instituteDetails.setConstitution(constitution);
			instituteDetails.setType(type);
			instituteDetailsDAO.create(instituteDetails);
			return;
		}		
		instituteDetails.setConstitution(constitution);
		instituteDetailsDAO.update(instituteDetails);
	}
}
