package com.saasforedu.irro.tags;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;
import org.apache.struts2.views.jsp.ComponentTagSupport;

import com.opensymphony.xwork2.util.ValueStack;

public class TopMenuTag extends ComponentTagSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String href;
	private String name;

	@Override
	public Component getBean(ValueStack arg0, HttpServletRequest arg1,
			HttpServletResponse arg2) {
		return new TopMenuComponent(arg0);
	}

	public void setHref(String href) {
		this.href = href;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	protected void populateParams() {
		super.populateParams();
		TopMenuComponent topMenuComponent = (TopMenuComponent) component;
		topMenuComponent.setHref(href);
		topMenuComponent.setName(name);
	}
}
