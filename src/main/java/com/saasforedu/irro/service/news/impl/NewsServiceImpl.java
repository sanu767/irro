package com.saasforedu.irro.service.news.impl;

import com.saasforedu.irro.bean.ContentBean;
import com.saasforedu.irro.dao.news.INewsDAO;
import com.saasforedu.irro.model.news.impl.News;
import com.saasforedu.irro.service.news.INewsService;

public class NewsServiceImpl implements INewsService {

	private INewsDAO newsDAO;

	public void setNewsDAO(INewsDAO newsDAO) {
		this.newsDAO = newsDAO;
	}

	@Override
	public String getMainContent() {
		return newsDAO.getMainContent();
	}

	@Override
	public void updateContent(ContentBean contentBean) {
		Long id = newsDAO.findMax();
		News rector = newsDAO.findById(News.class, id);
		copyProperties(contentBean, rector);
		newsDAO.update(rector);
	}

	private void copyProperties(ContentBean contentBean, News rector) {
		rector.getContent().setMainContent(contentBean.getMainContent());
	}
}
