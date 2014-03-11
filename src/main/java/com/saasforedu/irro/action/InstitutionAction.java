
package com.saasforedu.irro.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.saasforedu.irro.MockBean;
import com.saasforedu.irro.bean.ContentBean;
import com.saasforedu.irro.service.institute.IRectorService;

public class InstitutionAction extends ActionSupport {

	
	private static final long serialVersionUID = 1L;
	private ContentBean content = new ContentBean();
	List<MockBean> beans = new ArrayList<MockBean>();
	MockBean bean;
	String type;
	int id;
	int currentPage =1;
	//TODO it should be come from DB
	int noOfPages = 5;
	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public int getNoOfPages() {
		return noOfPages;
	}

	public MockBean getBean() {
		return bean;
	}
	
	public void setBean(MockBean bean) {
		this.bean = bean;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private IRectorService rectorService;

	public ContentBean getContent() {
		return content;
	}

	public void setContent(ContentBean content) {
		this.content = content;
	}

	public List<MockBean> getBeans() {
		return beans;
	}

	public void setBeans(List<MockBean> beans) {
		this.beans = beans;
	}

	public void setRectorService(IRectorService rectorService) {
		this.rectorService = rectorService;
	}

	public String loadContent() {
		content.setMainContent(rectorService.getMainContent());
		setMockBeans();
		return SUCCESS;
	}
	
	public String loadArticle() {
		content.setMainContent(rectorService.getMainContent());
		bean = new MockBean(id,"RECTOR","Article (grammar) - Wikipedia, the free encyclopedia","SUB",getContent().getMainContent(),null);
		return SUCCESS;
	}
	
	//TODO retericve paginated article from DB for particular type
	private void setMockBeans() {
		noOfPages =10;
		int recordperPage =3;
		int range = recordperPage + currentPage;
		for(int i=currentPage;i<noOfPages;i++) {
			if (i > range)
				break;
			beans.add(new MockBean(i,"RECTOR","Article (grammar) - Wikipedia, the free encyclopedia","SUB"+i,"An article (abbreviated ART) is a word (or prefix or suffix) that is used with a noun to indicate the type of reference being made by the noun. Articles specify ...","URL"+i));
		}
		
	}

	public String saveContent() {
		rectorService.updateContent(getContent());
		return SUCCESS;
	}
}
