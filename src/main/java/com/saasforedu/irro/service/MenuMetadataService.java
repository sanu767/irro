package com.saasforedu.irro.service;

import java.util.List;

import com.saasforedu.irro.model.IMenuMetadata;


public interface MenuMetadataService {
	public Long createMenuMetadata(IMenuMetadata menuMetadata);
	public void updateMenuMetadata(IMenuMetadata menuMetadata);
	public void deleteMenuMetadata(IMenuMetadata menuMetadata);
	public IMenuMetadata findById(Long menuId);
	public IMenuMetadata findByName(String menuName);
	public Long getNextReferenceArticleId();
	public IMenuMetadata getMenuMetadata(Long name, Long parentName);
	public List<IMenuMetadata> findChildren(Long parentId);
	public List<IMenuMetadata> findAllMenus();
	public Long rename(Long id, String newMenu);
	public Long deleteMenu(Long id);
	public IMenuMetadata getMenuTree();
	public IMenuMetadata getMenuTreeById(Long id);
	public List<Long> findIdsByCodes(List<String> codes);
	public IMenuMetadata findByReferenceArticleId(Long referenceArticleId);
	public IMenuMetadata getMainNewsMenuparameters();
}