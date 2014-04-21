package com.saasforedu.irro.article.bean;

public class MenuAttachmentBean extends AttachmentBean {
	
	private String displayName;
	
	private boolean external;

	public boolean isExternal() {
		return external;
	}

	public void setExternal(boolean external) {
		this.external = external;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
}
