package com.saasforedu.irro.dao;

import java.util.List;
import java.util.Set;

import com.saasforedu.irro.model.IMenuMetadata;
import com.saasforedu.irro.model.impl.MenuMetadata;


public interface MenuMetadataDAO extends IBaseDAO<MenuMetadata> {
	
	public void deleteMenuMetadata(IMenuMetadata menuMetadata);
	public IMenuMetadata findByName(String menuId);
	public Long getLastReferenceArticleId();
	public IMenuMetadata getMenuMetadata(Long menuId, Long parentMenuId);
	public List<IMenuMetadata> findAllMenus();
	public List<IMenuMetadata> findChildren(Long parentId);
	public void deleteAll(Set<IMenuMetadata> itemsToDelete);
	public IMenuMetadata getTree();
	public IMenuMetadata findById(Long id);
	public List<Long> findIdsByCodes(List<String> codes);
	public IMenuMetadata findByReferenceArticleId(Long referenceArticleId);
	public IMenuMetadata getMainNewsMenuparameters();
}
