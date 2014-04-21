package com.saasforedu.irro.action;

import com.saasforedu.irro.article.action.Menu;
import com.saasforedu.irro.bean.FeedBackBean;
import com.saasforedu.irro.util.IrroUtils;
import com.saasforedu.irro.util.Mail;


public class ExampleSupport extends ItemSearchAction {
	
	private static final long serialVersionUID = -4005814064030848367L;

	FeedBackBean feedBackBean;
	Menu topMenu;
	
	public String welcome() {
		loadNews();
		loadEvents();
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
	
	public void sendFeedBack() throws Exception {
		Mail mail = IrroUtils.getMail(feedBackBean);
		IrroUtils.sendFeedbackMail(mail);
	}

	public FeedBackBean getFeedBackBean() {
		return feedBackBean;
	}

	public void setFeedBackBean(FeedBackBean feedBackBean) {
		this.feedBackBean = feedBackBean;
	}
	
}
