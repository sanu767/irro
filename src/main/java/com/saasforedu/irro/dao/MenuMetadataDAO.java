package com.saasforedu.irro.dao;

import com.saasforedu.irro.model.IMenuMetadata;
import com.saasforedu.irro.model.impl.MenuMetadata;


public interface MenuMetadataDAO extends IBaseDAO<MenuMetadata> {
	
	public void deleteMenuMetadata(IMenuMetadata menuMetadata);
	public IMenuMetadata findByName(String menuName);
	public Long getLastReferenceArticleId();
	public IMenuMetadata getMenuMetadata(String name, String parentName);
}
