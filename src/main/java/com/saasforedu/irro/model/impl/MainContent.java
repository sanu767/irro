package com.saasforedu.irro.model.impl;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class MainContent {

	@Column(name = "CONTENT")
	String mainContent;

	public String getMainContent() {
		return mainContent;
	}

	public void setMainContent(String mainContent) {
		this.mainContent = mainContent;
	}

}
