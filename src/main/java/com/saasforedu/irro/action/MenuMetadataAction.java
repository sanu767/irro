
package com.saasforedu.irro.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.saasforedu.irro.article.action.Menu;
import com.saasforedu.irro.bean.MenuBean;
import com.saasforedu.irro.model.IMenuMetadata;
import com.saasforedu.irro.model.impl.MenuMetadata;
import com.saasforedu.irro.service.MenuMetadataService;
import com.saasforedu.irro.util.IrroUtils;

/**
 * @author sanket
 *
 */
public class MenuMetadataAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -8548764028583281745L;
	
	private HttpServletRequest httpServletRequest;
	
	private MenuMetadataService menuMetadataService;
	
	private String menu;
	private String parentMenu;
	
	private MenuBean menuBean = new MenuBean();
	
	private Menu tree = new Menu();
	
	private Long selectedMenuId;
	
	
	public void setMenuMetadataService(MenuMetadataService menuMetadataService) {
		this.menuMetadataService = menuMetadataService;
	}

	
	public String LoadMenuTree() throws Exception {
		IMenuMetadata menuTree = menuMetadataService.getMenuTree();
		Menu root = IrroUtils.formMenuTree(menuTree);
		this.tree =  root ;
		return SUCCESS;
	}
	
	public String createMenuMetadata()  throws Exception {
		IMenuMetadata parentMenuMetadata = menuMetadataService.findByName(parentMenu);
		Long menuId = createMenu(parentMenuMetadata, menu);
		return menuId != null ? SUCCESS : ERROR;
	}
	
	public String createChildren()  throws Exception {
		IMenuMetadata parentMenuMetadata = menuMetadataService.findById(selectedMenuId);
		Long menuId = createMenu(parentMenuMetadata, menu);
		return menuId != null ? SUCCESS : ERROR;
	}


	public String createSibling() throws Exception {
		Long menuId = createMenu(getParent(selectedMenuId), menu);
		return menuId != null ? SUCCESS : ERROR;
	}
	
	public String renameMenu() throws Exception {
		String newName = menu;
		return menuMetadataService.rename(selectedMenuId, newName) != null ? SUCCESS : ERROR;
	}
	
	public String deleteMenu() throws Exception {
		Long result = menuMetadataService.deleteMenu(selectedMenuId);
		return result > 0 ? SUCCESS : ERROR;
	}
	
	/**
	 * It will find all records from table MENU_INFO
	 */
	public String getAllMenus() throws Exception {
		List<IMenuMetadata> menus = menuMetadataService.findAllMenus();
		for (IMenuMetadata menu : menus) {
			createMenuBean(menu);
		}
		return SUCCESS;
	}
	
	/**
	 * It will find records from table MENU_INFO where menu name = menu provided by client.
	 */
	public String getMenuByName() throws Exception {
		IMenuMetadata mainMenu = menuMetadataService.findByName(menu);
		createMenuBean(mainMenu);
		return SUCCESS;
	}

	private Long createMenu(IMenuMetadata parentMenuMetadata, String menu) {
		IMenuMetadata menuMetadata = new MenuMetadata();
		menuMetadata.setName(menu);
		menuMetadata.setLabel(menu);
		menuMetadata.setTree(true);
		menuMetadata.setMenuType(parentMenuMetadata.getMenuType());
		String documentLocation = IrroUtils.getDocumentLocation(menu, parentMenuMetadata.getDocumentLocation());
		menuMetadata.setDocumentLocation(documentLocation);
		createDocumentDirectory(documentLocation);
		menuMetadata.setParentId(parentMenuMetadata != null ? parentMenuMetadata.getId() : null);
		menuMetadata.setReferenceArticleId(menuMetadataService.getNextReferenceArticleId());
		return menuMetadataService.createMenuMetadata(menuMetadata);
		
	}
	
	private IMenuMetadata getParent(Long menu) {
		IMenuMetadata parentMenuMetadata = menuMetadataService.findById(menu);
		return menuMetadataService.findById(parentMenuMetadata.getParentId());
	}
	
	
	/*
		----- --------------- --------------- 
		ID		NAME		   PARENT
		----- --------------- --------------- 
		1		KING			null
		2		Sankar			1
		3		Mukesh			2
		4		Sanket			2
		5		Sunny			4
		6		TS				4
		7		Rakhi			5
		----- --------------- --------------- 
		
		So, when I select "Sanket" then MenuBean on client will be created like :
		
			Sankar
			  |
			Sanket ---> Sunny
						TS
		
		In this, I am not going till the 1st parent of Sanket i.e. KING and till childs of Sanket childs.
	 */
	private void createMenuBean(IMenuMetadata mainMenu) {
		IMenuMetadata parent = menuMetadataService.findById(mainMenu.getParentId());
		List<IMenuMetadata> children = menuMetadataService.findChildren(mainMenu.getId());
		
		MenuBean bean = new MenuBean();
		bean.setId(mainMenu.getId().toString());
		bean.setLabel(mainMenu.getLabel());
		bean.setParent(createParentBean(parent));
		List<MenuBean> menuChildren = new ArrayList<MenuBean>();
		for (IMenuMetadata child : children) {
			MenuBean childBean = new MenuBean();
			childBean.setId(child.getId().toString());
			childBean.setLabel(child.getLabel());
			childBean.setParent(bean);
			menuChildren.add(bean);
		}
		bean.setChilderns(menuChildren);
	}

	/*
	 * In this, parent and children are not set.
	 */
	private MenuBean createParentBean(IMenuMetadata menu) {
		MenuBean bean = new MenuBean();
		bean.setId(menu.getId().toString());
		bean.setLabel(menu.getLabel());
		return bean;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getParentMenu() {
		return parentMenu;
	}

	public void setParentMenu(String parentMenu) {
		this.parentMenu = parentMenu;
	}
	
	public MenuBean getMenuBean() {
		return menuBean;
	}

	public void setMenuBean(MenuBean menuBean) {
		this.menuBean = menuBean;
	}

	@SuppressWarnings("deprecation")
	private void createDocumentDirectory(String destinationPath) {
		String serverPath = httpServletRequest.getRealPath("/");
		StringBuilder documentLocation = new StringBuilder(serverPath);
		documentLocation.append(destinationPath);
		File sliderFolder = new File(documentLocation.toString());
		if(!sliderFolder.exists() || !sliderFolder.isDirectory()) {
			sliderFolder.mkdir();
		}
	}

	@Override
	public void setServletRequest(HttpServletRequest httpServletRequest) {
		this.httpServletRequest = httpServletRequest;
	}

	public Menu getTree() {
		return tree;
	}

	public void setTree(Menu tree) {
		this.tree = tree;
	}

	public Long getSelectedMenuId() {
		return selectedMenuId;
	}

	public void setSelectedMenuId(Long selectedMenuId) {
		this.selectedMenuId = selectedMenuId;
	}
}
