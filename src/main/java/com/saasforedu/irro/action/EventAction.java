package com.saasforedu.irro.action;

import com.saasforedu.irro.util.IConstants;

public class EventAction extends BaseEventAction {
	
	private static final long serialVersionUID = 2742380585957700718L;

	public String loadCreateDepartmentEvent() {
		super.loadMenus();
		getSession().removeAttribute(IConstants.UPLOADED_EVENTS_FILES_SESSION_ATTRIBUTE_NAME);
		return SUCCESS;
	}

	@Override
	public String createEvent() throws Exception {
		return super.createEvent();
	}

	@Override
	public String createItem() throws Exception {
		super.loadMenus();
		return super.createItem();
	}

	@Override
	public String doUploadEventFile() throws Exception {
		super.loadMenus();
		return super.doUploadEventFile();
	}

	@Override
	public String loadEvent() {
		super.loadTopMenu();
		return super.loadEvent();
	}

	@Override
	public String modifyItem() throws Exception {
		super.loadMenus();
		return super.modifyItem();
	}

	@Override
	public String deleteItem() throws Exception {
		super.loadMenus();
		return super.deleteItem();
	}

	@Override
	public String activateAttachment() {
		super.loadMenus();
		return super.activateAttachment();
	}

	@Override
	public String deActivateAttachment() {
		super.loadMenus();
		return super.deActivateAttachment();
	}

	@Override
	public String removeAttachment() {
		super.loadMenus();
		return super.removeAttachment();
	}

	@Override
	public String execute() throws Exception {
		super.loadMenus();
		return super.execute();
	}
}