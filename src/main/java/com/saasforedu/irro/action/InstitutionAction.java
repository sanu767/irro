package com.saasforedu.irro.action;

import com.opensymphony.xwork2.ActionSupport;
import com.saasforedu.irro.bean.ContentBean;
import com.saasforedu.irro.service.institute.IRectorService;

public class InstitutionAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private ContentBean content = new ContentBean();

	private IRectorService rectorService;

	public ContentBean getContent() {
		return content;
	}

	public void setContent(ContentBean content) {
		this.content = content;
	}

	public void setRectorService(IRectorService rectorService) {
		this.rectorService = rectorService;
	}

	public String loadContent() {
		content.setMainContent(rectorService.getMainContent());
		return SUCCESS;
	}
	
	public String saveContent() {
		content.setMainContent(rectorService.getMainContent() + ": My Favour Data to update Владимировна");
		rectorService.updateContent(content);
		return SUCCESS;
	}
}
