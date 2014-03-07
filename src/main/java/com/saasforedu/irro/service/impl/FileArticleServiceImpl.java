package com.saasforedu.irro.service.impl;

import java.util.List;

import com.saasforedu.irro.dao.FileArticleDAO;
import com.saasforedu.irro.model.IFileArticle;
import com.saasforedu.irro.model.impl.FileArticle;
import com.saasforedu.irro.service.FileArticleService;

public class FileArticleServiceImpl implements FileArticleService {
	
	private FileArticleDAO fileArticleDAO;

	public void setFileArticleDAO(FileArticleDAO fileArticleDAO) {
		this.fileArticleDAO = fileArticleDAO;
	}

	@Override
	public Long create(IFileArticle fileArticle) {
		return (Long)fileArticleDAO.create((FileArticle)fileArticle);
	}

	@Override
	public void update(IFileArticle fileArticle) {
		fileArticleDAO.update((FileArticle)fileArticle);
	}

	@Override
	public void deleteFile(IFileArticle fileArticle) {
		fileArticleDAO.deleteFile(fileArticle);
	}

	@Override
	public List<IFileArticle> findAll() {
		return fileArticleDAO.findAll();
	}

	@Override
	public List<IFileArticle> findByIds(List<Long> fileArticleIds) {
		return fileArticleDAO.findByIds(fileArticleIds);
	}
}
