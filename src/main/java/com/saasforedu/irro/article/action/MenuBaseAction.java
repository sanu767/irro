package com.saasforedu.irro.article.action;

import com.opensymphony.xwork2.ActionSupport;
import com.saasforedu.irro.enums.MenuType;
import com.saasforedu.irro.model.IMenuMetadata;
import com.saasforedu.irro.service.impl.MenuService;

public class MenuBaseAction extends ActionSupport {

	private static final long serialVersionUID = 3458012466506668912L;
	
	private MenuService menuService;
	
	Menu menu = new Menu();
	Menu topMenu = new Menu();
	
	Long menuId;
	Long parentMenuId;
	
	String menuName;
	String parentMenuName;
	
	MenuType menuType;
	
	String title;

	public void loadMenus() {
		menu = menuService.getMenu(menuId, parentMenuId);
		topMenu = menuService.getMenuTree();
		menuType = MenuType.getType(menu.getMenuType());
		IMenuMetadata menuMetadata = getMenuMetadata(menuId, parentMenuId);
		title = menuMetadata.getLabel();
	}
	
	public void loadNonTreeMenus() {
		menu = menuService.getNonTreeMenu(menuId, parentMenuId);
		topMenu = menuService.getMenuTree();
		IMenuMetadata menuMetadata = getMenuMetadata(menuId, parentMenuId);
		title = menuMetadata.getLabel();
	}
	
	private IMenuMetadata getMenuMetadata(Long menuId, Long parentMenuId) {
		IMenuMetadata menuMetadata = menuService.getMenuMetadata(menuId, parentMenuId);
		return menuMetadata;
	}

	public void loadTopMenu() {
		topMenu = menuService.getMenuTree();
	}
	
	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public Menu getTopMenu() {
		return topMenu;
	}

	public void setTopMenu(Menu topMenu) {
		this.topMenu = topMenu;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	public void setMenuParametersForNews(Long referenceArticleId) {
		IMenuMetadata menuMetadata = menuService.findByReferenceArticleId(referenceArticleId);
		this.menuId = menuMetadata.getId();
		this.parentMenuId = menuMetadata.getParentId();
	}
	
	public IMenuMetadata getMainNewsMenuparameters() {
		return menuService.getMainNewsMenuparameters();
	}
	
	public void setMenuParametersFromMenuName() {
		IMenuMetadata menuMetadata = menuService.findByName(menuName);
		this.menuId = menuMetadata.getId();
		this.parentMenuId = menuMetadata.getParentId();
	}

	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

	public Long getParentMenuId() {
		return parentMenuId;
	}

	public void setParentMenuId(Long parentMenuId) {
		this.parentMenuId = parentMenuId;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public void setParentMenuName(String parentMenuName) {
		this.parentMenuName = parentMenuName;
	}

	public String getParentMenuName() {
		return parentMenuName;
	}

	public String getMenuName() {
		return menuName;
	}

	public MenuType getMenuType() {
		return menuType;
	}

	public void setMenuType(MenuType menuType) {
		this.menuType = menuType;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
}
