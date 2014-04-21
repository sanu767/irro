package com.saasforedu.irro.article.action;

import java.util.List;

public class Menu {
	private Long id;
	private String label;
	private Menu parent;
	private List<Menu> children;
	private boolean selected;
	private int menuType;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getLabel() {
		return label;
	}
	
	public void setLabel(String label) {
		this.label = label;
	}
	
	public Menu getParent() {
		return parent;
	}
	
	public void setParent(Menu parent) {
		this.parent = parent;
	}

	public boolean isSelected() {
		return selected;
	}
	
	public void setSelected(boolean isSelected) {
		this.selected = isSelected;
	}
	
	public List<Menu> getChildren() {
		return children;
	}
	
	public void setChildren(List<Menu> children) {
		this.children = children;
	}
	
	public int getMenuType() {
		return menuType;
	}
	
	public void setMenuType(int menuType) {
		this.menuType = menuType;
	}	
}
