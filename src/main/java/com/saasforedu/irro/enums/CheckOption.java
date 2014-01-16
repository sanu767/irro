package com.saasforedu.irro.enums;

public enum CheckOption {

	TRUE("T"), FALSE("F");

	private String checked;

	private CheckOption(String checked) {
		this.checked = checked;
	}

	public String getChecked() {
		return checked;
	}
}
