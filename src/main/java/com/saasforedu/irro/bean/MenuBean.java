package com.saasforedu.irro.bean;

import java.util.List;

public class MenuBean {

	private String id;
	private String label;
	private MenuBean parent;
	private List<MenuBean> childerns;
	private boolean selected;

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public MenuBean getParent() {
		return parent;
	}

	public void setParent(MenuBean parent) {
		this.parent = parent;
	}

	public List<MenuBean> getChilderns() {
		return childerns;
	}

	public void setChilderns(List<MenuBean> childerns) {
		this.childerns = childerns;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public boolean isSelected() {
		return selected;
	}

	public void setSelected(boolean selected) {
		this.selected = selected;
	}

}
