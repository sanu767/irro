package com.saasforedu.irro.service;

import java.util.List;

import com.saasforedu.irro.model.IFileArticle;

public interface FileArticleService {
	public Long create(IFileArticle fileArticle);
	public void update(IFileArticle fileArticle);
	public void deleteFile(IFileArticle fileArticle);
	public List<IFileArticle> findByIds(List<Long> fileArticleIds);
	public List<IFileArticle> findAll();
}