/**
 * 
 */
package com.saasforedu.irro.model.impl;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.saasforedu.irro.model.IMenuMetadata;

/**
 * @author sanket
 * 
 */

@Entity
@Table(name = "MENU_INFO")
public class MenuMetadata implements IMenuMetadata {

	@Id
	@GeneratedValue
	@Column(name = "MENU_ID")
	private Long id;
	
	@Column(name = "NAME")
	private String name;
	
	@Column(name = "PARENT_ID")
	private Long parentId;
	
	@Column(name = "REF_ARTICLE_ID")
	private Long referenceArticleId;
	
	@Column(name = "DOC_LOCATION")
	private String documentLocation;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public Long getReferenceArticleId() {
		return referenceArticleId;
	}

	public void setReferenceArticleId(Long referenceArticleId) {
		this.referenceArticleId = referenceArticleId;
	}

	public String getDocumentLocation() {
		return documentLocation;
	}

	public void setDocumentLocation(String documentLocation) {
		this.documentLocation = documentLocation;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime
				* result
				+ ((documentLocation == null) ? 0 : documentLocation.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result
				+ ((parentId == null) ? 0 : parentId.hashCode());
		result = prime
				* result
				+ ((referenceArticleId == null) ? 0 : referenceArticleId
						.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MenuMetadata other = (MenuMetadata) obj;
		if (documentLocation == null) {
			if (other.documentLocation != null)
				return false;
		} else if (!documentLocation.equals(other.documentLocation))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (parentId == null) {
			if (other.parentId != null)
				return false;
		} else if (!parentId.equals(other.parentId))
			return false;
		if (referenceArticleId == null) {
			if (other.referenceArticleId != null)
				return false;
		} else if (!referenceArticleId.equals(other.referenceArticleId))
			return false;
		return true;
	}
}