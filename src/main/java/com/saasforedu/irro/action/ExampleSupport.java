package com.saasforedu.irro.action;

import com.saasforedu.irro.article.action.Menu;


public class ExampleSupport extends ItemSearchAction {
	
	private static final long serialVersionUID = -4005814064030848367L;

	Menu topMenu;
	
	public String welcome() {
		loadNews();
		loadEvents();
		loadSliderItems();
		topMenu = getMenuService().getMenuTree();
        return SUCCESS;
    }

    public String search() {
		loadSliderItems();
		topMenu = getMenuService().getMenuTree();
        return SUCCESS;
	}
	
	public String login() {
        return "login";
    }
	public String register() {
		return "register";
	}

	public String resource() {
		return "resource";
	}

	public Menu getTopMenu() {
		return topMenu;
	}

	public void setTopMenu(Menu topMenu) {
		this.topMenu = topMenu;
	}
	
}
