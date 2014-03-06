package com.saasforedu.irro.action;

import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.config.entities.Parameterizable;
import com.saasforedu.irro.bean.DepartmentBean;
import com.saasforedu.irro.service.institute.IInstituteDetailsService;

public class DepartmentAction extends ActionSupport implements Parameterizable {

	private static final long serialVersionUID = 9003088289340318685L;
	
	private Map<String, String> params = new HashMap<String, String>();
	
	private DepartmentBean departmentBean = new DepartmentBean();
	
	private IInstituteDetailsService instituteDetailsService;

	public DepartmentBean getDepartmentBean() {
		return departmentBean;
	}

	public void setDepartmentBean(DepartmentBean departmentBean) {
		this.departmentBean = departmentBean;
	}
	
	public void setInstituteDetailsService(
			IInstituteDetailsService instituteDetailsService) {
		this.instituteDetailsService = instituteDetailsService;
	}

	public String loadMainContent() {
		departmentBean.setMainContent(instituteDetailsService.getMainContent(getDeparmentType()));
		return SUCCESS;
	}

	public String saveContent() {
		instituteDetailsService.updateContent(getDeparmentType(), departmentBean.getMainContent());
		return SUCCESS;
	}
	
	public String loadNews() {
		departmentBean.setNews(instituteDetailsService.getNews(getDeparmentType()));
		return SUCCESS;
	}

	public String saveNews() {
		instituteDetailsService.updateNews(getDeparmentType(), departmentBean.getNews());
		return SUCCESS;
	}
	
	public String loadContacts() {
		departmentBean.setContacts(instituteDetailsService.getContacts(getDeparmentType()));
		return SUCCESS;
	}

	public String saveContacts() {
		instituteDetailsService.updateContacts(getDeparmentType(), departmentBean.getContacts());
		return SUCCESS;
	}
	
	public String loadMaterials() {
		departmentBean.setMaterials(instituteDetailsService.getMaterials(getDeparmentType()));
		return SUCCESS;
	}

	public String saveMaterials() {
		instituteDetailsService.updateMaterials(getDeparmentType(), departmentBean.getMaterials());
		return SUCCESS;
	}
	
	public String loadConstitution() {
		departmentBean.setConstitution(instituteDetailsService.getConstitution(getDeparmentType()));
		return SUCCESS;
	}

	public String saveConstitution() {
		instituteDetailsService.updateConstitution(getDeparmentType(), departmentBean.getConstitution());
		return SUCCESS;
	}
	
	private int getDeparmentType() {
		return Integer.parseInt(params.get("DepartmentType"));
	}

	@Override
	public void addParam(String key, String value) {
		this.params.put(key, value);
	}

	@Override
	public Map<String, String> getParams() {
		return this.params;
	}

	@Override
	public void setParams(Map<String, String> params) {
		this.params = params;
	}
	
}
