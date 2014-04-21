package com.saasforedu.irro.article.action;


public class NewsAction extends BaseNewsAction {
	
	private static final long serialVersionUID = 161255011804368764L;
	
	@Override
	public String loadAllNews() {
		super.loadMenus();
		return super.loadAllNews();
	}

	@Override
	public String loadSelectedNews() throws Exception {
		return super.loadSelectedNews();
	}

	@Override
	public String createNews() throws Exception {
		super.loadMenus();
		return super.createNews();
	}

	@Override
	public String saveNews() throws Exception {
		super.loadMenus();
		return super.saveNews();
	}

	@Override
	public String deleteNews() throws Exception {
		super.loadMenus();
		return super.deleteNews();
	}

	@Override
	public String doUploadNewsFile() throws Exception {
		super.loadMenus();
		return super.doUploadNewsFile();
	}

	@Override
	public String activateAttachment() throws Exception {
		super.loadMenus();
		return super.activateAttachment();
	}

	@Override
	public String deActivateAttachment() throws Exception {
		super.loadMenus();
		return super.deActivateAttachment();
	}

	@Override
	public String removeAttachment() throws Exception {
		super.loadMenus();
		return super.removeAttachment();
	}

	@Override
	public String execute() throws Exception {
		super.loadMenus();
		return super.execute();
	}
}