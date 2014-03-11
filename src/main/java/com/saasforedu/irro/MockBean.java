package com.saasforedu.irro;

public class MockBean {
	int id;
	String type;
	String title;
	String subtitle;
	String content;
	String url;
	
	public MockBean() {
	}
	
	public MockBean(int id, String type, String title, String subtitle,
			String content, String url) {
		super();
		this.id = id;
		this.type = type;
		this.title = title;
		this.subtitle = subtitle;
		this.content = content;
		this.url = url;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
}
