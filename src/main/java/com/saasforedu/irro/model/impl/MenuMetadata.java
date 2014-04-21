/**
 * 
 */
package com.saasforedu.irro.model.impl;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OrderColumn;
import javax.persistence.Table;

import com.saasforedu.irro.model.IMenuMetadata;

/**
 * @author sanket
 * 
 */

@Entity
@NamedQuery(query="select n from MenuMetadata n left join fetch n.children left join fetch n.parent order by n.id", name="findAllMenuWithTheirChildren")
@Table(name = "MENU_INFO")
public class MenuMetadata implements IMenuMetadata {

	public static final String TREE = "findAllMenuWithTheirChildren";

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
	
	@Column(name = "LABEL")
	private String label;
	
	@OneToMany(fetch=FetchType.EAGER) 
	@OrderColumn 
	@JoinColumn(name = "PARENT_ID") 
	private List<MenuMetadata> children = new LinkedList<MenuMetadata>();
	
	@ManyToOne(fetch=FetchType.LAZY) 
	@JoinColumn(name = "PARENT_ID",insertable=false,updatable=false) 
	private MenuMetadata parent; 
	
	@Column(name = "IS_TREE")
	private boolean tree;
	
	/**
	 * 1 for News
	 * 2 for Department
	 */
	@Column(name = "MENU_TYPE")
	private Integer menuType;
	
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

	public List<MenuMetadata> getChildren() {
		return children;
	}

	public void setChildren(List<MenuMetadata> children) {
		this.children = children;
	}

	public MenuMetadata getParent() {
		return parent;
	}

	public void setParent(MenuMetadata parent) {
		this.parent = parent;
	}

	public boolean isTree() {
		return tree;
	}

	public void setTree(boolean tree) {
		this.tree = tree;
	}

	public Integer getMenuType() {
		return menuType;
	}

	public void setMenuType(Integer menuType) {
		this.menuType = menuType;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((children == null) ? 0 : children.hashCode());
		result = prime
				* result
				+ ((documentLocation == null) ? 0 : documentLocation.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((menuType == null) ? 0 : menuType.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result
				+ ((parentId == null) ? 0 : parentId.hashCode());
		result = prime
				* result
				+ ((referenceArticleId == null) ? 0 : referenceArticleId
						.hashCode());
		result = prime * result + (tree ? 1231 : 1237);
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
		if (children == null) {
			if (other.children != null)
				return false;
		} else if (!children.equals(other.children))
			return false;
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
		if (menuType == null) {
			if (other.menuType != null)
				return false;
		} else if (!menuType.equals(other.menuType))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (parent == null) {
			if (other.parent != null)
				return false;
		} else if (!parent.equals(other.parent))
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
		if (tree != other.tree)
			return false;
		return true;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}
}