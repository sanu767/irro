package com.saasforedu.irro.service.impl;

import com.saasforedu.irro.dao.MenuMetadataDAO;
import com.saasforedu.irro.model.IMenuMetadata;
import com.saasforedu.irro.model.impl.MenuMetadata;
import com.saasforedu.irro.service.MenuMetadataService;

public class MenuMetadataServiceImpl implements MenuMetadataService {
	
	private MenuMetadataDAO menuMetadataDAO;
	
	public void setMenuMetadataDAO(MenuMetadataDAO menuMetadataDAO) {
		this.menuMetadataDAO = menuMetadataDAO;
	}
	
	@Override
	public Long createMenuMetadata(IMenuMetadata menuMetadata) {
		return (Long)menuMetadataDAO.create((MenuMetadata)menuMetadata);
	}

	@Override
	public void updateMenuMetadata(IMenuMetadata menuMetadata) {
		menuMetadataDAO.update((MenuMetadata)menuMetadata);
	}

	@Override
	public void deleteMenuMetadata(IMenuMetadata menuMetadata) {
		menuMetadataDAO.deleteMenuMetadata(menuMetadata);
	}

	@Override
	public IMenuMetadata findById(Long menuId) {
		return menuMetadataDAO.findById(MenuMetadata.class, menuId);
	}

	@Override
	public IMenuMetadata findByName(String menuName) {
		return menuMetadataDAO.findByName(menuName);
	}

	@Override
	public Long getNextReferenceArticleId() {
		Long lastReferenceArticleId = menuMetadataDAO.getLastReferenceArticleId() == null ? 0L : 
			menuMetadataDAO.getLastReferenceArticleId() ;
		return lastReferenceArticleId + 1;
	}

	@Override
	public IMenuMetadata getMenuMetadata(String name, String parentName) {
		return menuMetadataDAO.getMenuMetadata(name, parentName);
	}	
}
