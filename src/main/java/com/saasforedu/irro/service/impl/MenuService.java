package com.saasforedu.irro.service.impl;

import java.util.LinkedList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.saasforedu.irro.article.action.Menu;
import com.saasforedu.irro.model.IMenuMetadata;
import com.saasforedu.irro.model.impl.MenuMetadata;
import com.saasforedu.irro.service.MenuMetadataService;

public class MenuService {
	MenuMetadataService menuMetadataService;

	public MenuMetadataService getMenuMetadataService() {
		return menuMetadataService;
	}

	public void setMenuMetadataService(MenuMetadataService menuMetadataService) {
		this.menuMetadataService = menuMetadataService;
	}
	
	public Menu getMenuTree() {
		IMenuMetadata menuTree = menuMetadataService.getMenuTree();
		Menu root = new Menu();
		root.setLabel(menuTree.getLabel());
		root.setId(menuTree.getId());
		root.setChildren(buildMenu(root, menuTree));
		return root;
	}
	
	public IMenuMetadata findByReferenceArticleId(Long referenceArticleId) {
		return menuMetadataService.findByReferenceArticleId(referenceArticleId);
	}
	
	
	public IMenuMetadata findByName(String menuName) {
		return menuMetadataService.findByName(menuName);
	}
	
	@Transactional
	public Menu getMenu(Long menuId, Long parentId) {
		IMenuMetadata menuTree = menuMetadataService.getMenuTreeById(menuId);
		Menu currentMenuTree = new Menu();
		currentMenuTree.setLabel(menuTree.getLabel());
		currentMenuTree.setId(menuTree.getId());
		currentMenuTree.setParent(buildParent(menuTree.getParent()));
		currentMenuTree.setChildren(buildMenu(currentMenuTree, menuTree));
		Menu root = getRoot(currentMenuTree);
		root.setMenuType(menuTree.getMenuType());
		setSelected(currentMenuTree, root);
		return root;
	}
	
	@Transactional
	public Menu getNonTreeMenu(Long menuId, Long parentId) {
		IMenuMetadata menuTree = menuMetadataService.getMenuTreeById(menuId);
		Menu currentMenuTree = new Menu();
		currentMenuTree.setLabel(menuTree.getLabel());
		currentMenuTree.setId(menuTree.getId());
		currentMenuTree.setMenuType(menuTree.getMenuType());
		currentMenuTree.setParent(loadNonTreeParent(menuTree.getParent()));
		currentMenuTree.setChildren(loadNonTreeMenu(currentMenuTree, menuTree));
		Menu root = getRoot(currentMenuTree);
		setSelected(currentMenuTree, root);
		return root;
	}
	
	public IMenuMetadata getMainNewsMenuparameters() {
		return menuMetadataService.getMainNewsMenuparameters();
	}
	
	public IMenuMetadata getMenuMetadata(Long menuId, Long parentMenuId) {
		IMenuMetadata menuMetadata = menuMetadataService.getMenuMetadata(menuId, parentMenuId);
		return menuMetadata;
	}
	
	private List<Menu> buildMenu(Menu root, IMenuMetadata menuTree) {
		List<MenuMetadata> childrenMenuMeta = menuTree.getChildren();
		List<Menu> children = new LinkedList<Menu>();
		for (MenuMetadata menuMetadata : childrenMenuMeta) {
			if(menuMetadata.isTree()) {
				Menu child = new Menu();
				child.setId(menuMetadata.getId());
				child.setLabel(menuMetadata.getLabel());
				child.setChildren(buildMenu(child, menuMetadata));
				child.setParent(root);
				child.setMenuType(menuMetadata.getMenuType());
				children.add(child);
			}
		}
		
		return children;
	}
	
	
	private List<Menu> loadNonTreeMenu(Menu root, IMenuMetadata menuTree) {
		List<MenuMetadata> childrenMenuMeta = menuTree.getChildren();
		List<Menu> children = new LinkedList<Menu>();
		for (MenuMetadata menuMetadata : childrenMenuMeta) {
				Menu child = new Menu();
				child.setId(menuMetadata.getId());
				child.setLabel(menuMetadata.getLabel());
				child.setChildren(buildMenu(child, menuMetadata));
				child.setParent(root);
				child.setMenuType(menuMetadata.getMenuType());
				children.add(child);
		}
		return children;
	}
	
	private Menu loadNonTreeParent(IMenuMetadata parent) {
		Menu parentMenu = null;
		if (parent != null) {
			parentMenu = new Menu();
			parentMenu.setId(parent.getId());
			parentMenu.setLabel(parent.getLabel());
			parentMenu.setChildren(loadNonTreeMenu(parentMenu, parent));
			parentMenu.setParent(loadNonTreeParent(parent.getParent()));
		}
		return parentMenu;
	}
	
	
	private void setSelected(Menu currentMenuTree, Menu menu) {
		if(menu.getId().equals(currentMenuTree.getId())) {
			menu.setSelected(true);
			return;
		}
		
		List<Menu> children = menu.getChildren();
		for (Menu child : children) {
			setSelected(currentMenuTree, child);
		}
	}

	private Menu getRoot(Menu currentMenuTree) {
		return currentMenuTree.getParent().getLabel().equalsIgnoreCase("ROOT") ? 
				currentMenuTree : getRoot(currentMenuTree.getParent());
	}

	private Menu buildParent(IMenuMetadata parent) {
		Menu parentMenu = null;
		if (parent != null) {
			parentMenu = new Menu();
			parentMenu.setId(parent.getId());
			parentMenu.setLabel(parent.getLabel());
			parentMenu.setChildren(buildMenu(parentMenu, parent));
			parentMenu.setParent(buildParent(parent.getParent()));
		}
		return parentMenu;
	}
}
