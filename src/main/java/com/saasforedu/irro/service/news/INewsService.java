package com.saasforedu.irro.service.news;

import com.saasforedu.irro.bean.ContentBean;

public interface INewsService {

	public String getMainContent();

	public void updateContent(ContentBean content);
}
