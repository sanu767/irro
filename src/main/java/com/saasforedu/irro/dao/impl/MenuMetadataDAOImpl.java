package com.saasforedu.irro.dao.impl;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;

import com.saasforedu.irro.dao.MenuMetadataDAO;
import com.saasforedu.irro.model.IMenuMetadata;
import com.saasforedu.irro.model.impl.MenuMetadata;

public class MenuMetadataDAOImpl extends BaseDAOimpl<MenuMetadata> implements MenuMetadataDAO {

	@Override
	public void deleteMenuMetadata(IMenuMetadata menuMetadata) {
		getHibernateTemplate().delete(menuMetadata);
	}

	@SuppressWarnings("unchecked")
	@Override
	public IMenuMetadata findByName(String menuName) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from MenuMetadata u where u.name = ? ");
		List<IMenuMetadata> menuMetadata = getHibernateTemplate().find(queryBuilder.toString(), new Object[]{menuName});
		if(CollectionUtils.isEmpty(menuMetadata)) {
			return null;
		}
		return menuMetadata.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Long getLastReferenceArticleId() {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select max(u.referenceArticleId) from MenuMetadata u");
		List<Long> referenceIds = getHibernateTemplate().find(queryBuilder.toString());
		if(CollectionUtils.isEmpty(referenceIds)) {
			return 0l;
		}
		return referenceIds.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public IMenuMetadata getMenuMetadata(String name, String parentName) {
		if(StringUtils.isBlank(parentName)) {
			return getMenuMetadata(name);
		}
		
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from MenuMetadata u where u.name = (:name) and u.parentId = (select p.id from MenuMetadata p where p.name = (:parentName))");
		List<IMenuMetadata> menuMetadatas = getHibernateTemplate().findByNamedParam(queryBuilder.toString(), 
				new String[]{"name", "parentName"}, 
				new Object[]{name, parentName});
		
		if(CollectionUtils.isEmpty(menuMetadatas)) {
			return null;
		}
		return menuMetadatas.get(0);
	}
	
	@SuppressWarnings("unchecked")
	public IMenuMetadata getMenuMetadata(String name) {
		
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from MenuMetadata u where u.name = (:name))");
		List<IMenuMetadata> menuMetadatas = getHibernateTemplate().findByNamedParam(queryBuilder.toString(), 
				new String[]{"name"}, 
				new Object[]{name});
		
		if(CollectionUtils.isEmpty(menuMetadatas)) {
			return null;
		}
		return menuMetadatas.get(0);
	}
}
