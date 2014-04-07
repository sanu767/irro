package com.saasforedu.irro.service;

import com.saasforedu.irro.model.IMenuMetadata;


public interface MenuMetadataService {
	public Long createMenuMetadata(IMenuMetadata menuMetadata);
	public void updateMenuMetadata(IMenuMetadata menuMetadata);
	public void deleteMenuMetadata(IMenuMetadata menuMetadata);
	public IMenuMetadata findById(Long menuId);
	public IMenuMetadata findByName(String menuName);
	public Long getNextReferenceArticleId();
	public IMenuMetadata getMenuMetadata(String name, String parentName);
}