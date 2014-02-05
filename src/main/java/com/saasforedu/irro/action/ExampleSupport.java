package com.saasforedu.irro.action;


public class ExampleSupport extends ItemSearchAction {
	
	private static final long serialVersionUID = -4005814064030848367L;

	public String welcome() {
		loadNews();
		loadEvents();
		loadSliderItems();
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
	
	
}
