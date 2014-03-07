package com.saasforedu.irro.dao;

import java.util.List;

import com.saasforedu.irro.model.IFileArticle;
import com.saasforedu.irro.model.impl.FileArticle;

public interface FileArticleDAO extends IBaseDAO<FileArticle>{
	
	/** Put CRUD in BaseDAO **/
	
	public void deleteFile(IFileArticle fileArticle);
	
	public List<IFileArticle> findByIds(List<Long> fileArticleIds);
	public List<IFileArticle> findAll();
	
}
