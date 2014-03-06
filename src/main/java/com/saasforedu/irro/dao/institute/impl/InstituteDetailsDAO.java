package com.saasforedu.irro.dao.institute.impl;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import com.saasforedu.irro.dao.impl.BaseDAOimpl;
import com.saasforedu.irro.dao.institute.IInstituteDetailsDAO;
import com.saasforedu.irro.model.institute.impl.InstituteDetails;

public class InstituteDetailsDAO extends BaseDAOimpl<InstituteDetails> implements
		IInstituteDetailsDAO {

	@SuppressWarnings("unchecked")
	public String getMainContent(int type) {
		String query = "select r.content.mainContent from InstituteDetails r where r.type = "+type;
		List<String> mainContentList = getHibernateTemplate().find(query);
		return  getInstituteDetailProperty(mainContentList);
	}

	public Long findMax() {
		return findMax("select max(r.id) from InstituteDetails r");
	}
	
	public InstituteDetails findById(Long id) {
		return (InstituteDetails) getHibernateTemplate().get(InstituteDetails.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public InstituteDetails findByDepartmentType(int type) {
		String query = "select r from InstituteDetails r where r.type = "+type;
		List<InstituteDetails> instituteDetails = getHibernateTemplate().find(query);
		return  CollectionUtils.isEmpty(instituteDetails) || instituteDetails.get(0) == null ? 
				null : 
					instituteDetails.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public String getNews(int type) {
		String query = "select r.news from InstituteDetails r where r.type = "+type;
		List<String> newsList = getHibernateTemplate().find(query);
		return  getInstituteDetailProperty(newsList);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public String getContacts(int type) {
		String query = "select r.contacts from InstituteDetails r where r.type = "+type;
		List<String> contactsList = getHibernateTemplate().find(query);
		return  getInstituteDetailProperty(contactsList);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public String getMaterials(int type) {
		String query = "select r.materials from InstituteDetails r where r.type = "+type;
		List<String> materialList = getHibernateTemplate().find(query);
		return  getInstituteDetailProperty(materialList);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public String getConstitution(int type) {
		String query = "select r.constitution from InstituteDetails r where r.type = "+type;
		List<String> constituteList = getHibernateTemplate().find(query);
		return  getInstituteDetailProperty(constituteList);
	}
	

	private String getInstituteDetailProperty(List<String> contactsList) {
		return CollectionUtils.isEmpty(contactsList) || contactsList.get(0) == null ? 
				StringUtils.EMPTY : 
					(String)contactsList.get(0);
	}
}
