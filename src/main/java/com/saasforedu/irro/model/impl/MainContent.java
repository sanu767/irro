package com.saasforedu.irro.model.impl;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Lob;

@Embeddable
public class MainContent {

	@Lob
	@Column(name = "CONTENT")
	String mainContent;

	public String getMainContent() {
		return mainContent;
	}

	public void setMainContent(String mainContent) {
		this.mainContent = mainContent;
	}

}
