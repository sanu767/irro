package com.saasforedu.irro.model;

import java.util.List;
import com.saasforedu.irro.model.impl.MenuMetadata;

public interface IMenuMetadata extends IBaseEntity {
	
	public String getName();
	public void setName(String name);

	public Long getParentId();
	public void setParentId(Long parentId) ;

	public Long getReferenceArticleId();
	public void setReferenceArticleId(Long referenceArticleId);

	public String getDocumentLocation();
	public void setDocumentLocation(String documentLocation);

	public Long getId();
	public void setId(Long id);

	public List<MenuMetadata> getChildren();
	public void setChildren(List<MenuMetadata> children);

	public MenuMetadata getParent();
	public void setParent(MenuMetadata parent);
	
	public boolean isTree();
	public void setTree(boolean tree);

	public Integer getMenuType();
	public void setMenuType(Integer menuType);
	
	public String getLabel();
	public void setLabel(String label);
	
}
