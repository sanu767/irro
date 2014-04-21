package com.saasforedu.irro.dao.impl;

import java.util.Collections;
import java.util.List;
import java.util.Set;

import org.apache.commons.collections.CollectionUtils;
import org.hibernate.Query;

import com.saasforedu.irro.dao.MenuMetadataDAO;
import com.saasforedu.irro.enums.MenuType;
import com.saasforedu.irro.model.IMenuMetadata;
import com.saasforedu.irro.model.impl.MenuMetadata;

public class MenuMetadataDAOImpl extends BaseDAOimpl<MenuMetadata> implements MenuMetadataDAO {

	@Override
	public void deleteMenuMetadata(IMenuMetadata menuMetadata) {
		getHibernateTemplate().delete(menuMetadata);
	}

	@Override
	public void deleteAll(Set<IMenuMetadata> menuMetadata) {
		getHibernateTemplate().deleteAll(menuMetadata);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<IMenuMetadata> findAllMenus() {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from MenuMetadata u");
		List<IMenuMetadata> menuMetadata = getHibernateTemplate().find(queryBuilder.toString());
		return CollectionUtils.isEmpty(menuMetadata) ? Collections.EMPTY_LIST : menuMetadata;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<IMenuMetadata> findChildren(Long parentId) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from MenuMetadata u where u.parentId = ? ");
		List<IMenuMetadata> menuMetadata = getHibernateTemplate()
				.find(queryBuilder.toString(), new Object[] { parentId });
		return CollectionUtils.isEmpty(menuMetadata) ? Collections.EMPTY_LIST : menuMetadata;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public IMenuMetadata findByName(String menuId) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from MenuMetadata u where u.name = ? ");
		List<IMenuMetadata> menuMetadata = getHibernateTemplate().find(queryBuilder.toString(), new Object[]{menuId});
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
	public IMenuMetadata getMenuMetadata(Long menuId, Long parentMenuId) {
		if(parentMenuId == null || parentMenuId == 0L) {
			return getMenuMetadata(menuId);
		}
		
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from MenuMetadata u where u.id = (:menuId) and u.parentId = (select p.id from MenuMetadata p where p.id = (:parentMenuId))");
		List<IMenuMetadata> menuMetadatas = getHibernateTemplate().findByNamedParam(queryBuilder.toString(), 
				new String[]{"menuId", "parentMenuId"}, 
				new Object[]{menuId, parentMenuId });
		
		if(CollectionUtils.isEmpty(menuMetadatas)) {
			return null;
		}
		return menuMetadatas.get(0);
	}
	
	@SuppressWarnings("unchecked")
	public IMenuMetadata getMenuMetadata(Long menuId) {
		
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from MenuMetadata u where u.id = (:menuId))");
		List<IMenuMetadata> menuMetadatas = getHibernateTemplate().findByNamedParam(queryBuilder.toString(), 
				new String[]{"menuId"}, 
				new Object[]{menuId});
		
		if(CollectionUtils.isEmpty(menuMetadatas)) {
			return null;
		}
		return menuMetadatas.get(0);
	}

	@Override
	public IMenuMetadata getTree() {
		Query namedQuery = getSession().getNamedQuery(MenuMetadata.TREE);
		@SuppressWarnings("unchecked")
		List<MenuMetadata> list = namedQuery.list();
		MenuMetadata root = null;
		for (MenuMetadata node : list) {
			if (node.getParent() == null) {
				root = node;
				break;
			}
		}
		return root;
	}

	@Override
	public IMenuMetadata findById(Long id) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder
				.append("select n from MenuMetadata n left join fetch n.children left join fetch n.parent where n.id = (:id)");
		@SuppressWarnings("unchecked")
		List<IMenuMetadata> menuMetadatas = getHibernateTemplate()
				.findByNamedParam(queryBuilder.toString(),
						new String[] { "id" }, new Object[] { id });
		if (CollectionUtils.isEmpty(menuMetadatas)) {
			return null;
		}
		return menuMetadatas.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Long> findIdsByCodes(List<String> codes) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select i.id from MenuMetadata i where i.label in  (:codes) ");
		String[] params = { "codes" };
		Object [] values = {codes};
		List<Long> resultItems = getHibernateTemplate().findByNamedParam(queryBuilder.toString(), params, values);
		return resultItems;
	}

	@SuppressWarnings("unchecked")
	@Override
	public IMenuMetadata findByReferenceArticleId(Long referenceArticleId) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from MenuMetadata u where u.referenceArticleId = (:referenceArticleId))");
		List<IMenuMetadata> menuMetadatas = getHibernateTemplate().findByNamedParam(queryBuilder.toString(), 
				new String[]{"referenceArticleId"}, 
				new Object[]{referenceArticleId});
		
		if(CollectionUtils.isEmpty(menuMetadatas)) {
			return null;
		}
		return menuMetadatas.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public IMenuMetadata getMainNewsMenuparameters() {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from MenuMetadata u where u.menuType = (:menuType) and u.parentId = (select p.id from MenuMetadata p where p.parentId is NULL)");
		List<IMenuMetadata> menuMetadatas = getHibernateTemplate().findByNamedParam(queryBuilder.toString(), 
				new String[]{"menuType"}, 
				new Object[]{MenuType.NEWS.getTypeId()});
		
		if(CollectionUtils.isEmpty(menuMetadatas)) {
			return null;
		}
		return menuMetadatas.get(0);
	}
}
