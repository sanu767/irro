package com.saasforedu.irro.tags;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;
import org.apache.struts2.views.jsp.ComponentTagSupport;

import com.opensymphony.xwork2.util.ValueStack;

public class TreeTag extends ComponentTagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String menu;
	private String href;
	private String cssClass;
	private String cssStyle;
	private String cssSelection;

	@Override
	public Component getBean(ValueStack arg0, HttpServletRequest arg1,
			HttpServletResponse arg2) {
		return new TreeComponent(arg0);
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}
	
	public void setHref(String href) {
		this.href = href;
	}
	
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
	
	public void setCssStyle(String cssStyle) {
		this.cssStyle = cssStyle;
	}
	
	public void setCssSelection(String cssSelection) {
		this.cssSelection = cssSelection;
	}
	
	@Override
	protected void populateParams() {
		super.populateParams();
		TreeComponent comp = (TreeComponent) component;
		comp.setMenu(menu);
		comp.setCssClass(cssClass);
		comp.setCssStyle(cssStyle);
		comp.setHref(href);
		comp.setCssSelection(cssSelection);
	}
}
