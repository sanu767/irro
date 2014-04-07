
package com.saasforedu.irro.action;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.saasforedu.irro.model.IMenuMetadata;
import com.saasforedu.irro.model.impl.MenuMetadata;
import com.saasforedu.irro.service.MenuMetadataService;
import com.saasforedu.irro.util.IrroUtils;

public class MenuMetadataAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -8548764028583281745L;
	
	private HttpServletRequest httpServletRequest;
	
	MenuMetadataService menuMetadataService;
	
	String menu;
	String parentMenu;
	
	public void setMenuMetadataService(MenuMetadataService menuMetadataService) {
		this.menuMetadataService = menuMetadataService;
	}
	
	public void createMenuMetadata()  throws Exception {
		IMenuMetadata parentMenuMetadata = menuMetadataService.findByName(parentMenu);
		IMenuMetadata menuMetadata = new MenuMetadata();
		menuMetadata.setName(menu);
		String documentLocation = IrroUtils.getDocumentLocation(menu, parentMenu);
		menuMetadata.setDocumentLocation(documentLocation);
		createDocumentDirectory(documentLocation);
		menuMetadata.setParentId(parentMenuMetadata != null ? parentMenuMetadata.getId() : null);
		menuMetadata.setReferenceArticleId(menuMetadataService.getNextReferenceArticleId());
		menuMetadataService.createMenuMetadata(menuMetadata);
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
}
