package com.saasforedu.irro.model;

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
	
}
