package com.saasforedu.irro.article.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.saasforedu.irro.article.dao.IMenuAttachmentDAO;
import com.saasforedu.irro.dao.impl.BaseDAOimpl;
import com.saasforedu.irro.model.IMenuAttachment;
import com.saasforedu.irro.model.impl.MenuAttachment;

public class MenuAttachmentDAOImpl extends BaseDAOimpl<MenuAttachment> implements IMenuAttachmentDAO {
	

	@SuppressWarnings("unchecked")
	@Override
	public List<IMenuAttachment> findByReferenceMenuId(Long referenceMenuId) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from MenuAttachment u where u.referenceMenuId =  ? ");
		queryBuilder.append(" order by u.modificationDate DESC");
		List<IMenuAttachment> resultArticles = getHibernateTemplate().find(queryBuilder.toString(), referenceMenuId);
		return resultArticles;
	}
	
	@Override
	public void createAttachments(List<IMenuAttachment> newAttachments) {
		if(CollectionUtils.isNotEmpty(newAttachments)) {
			List<MenuAttachment> menuAttachments = new ArrayList<MenuAttachment>();
			for (IMenuAttachment newAttachment : newAttachments) {
				MenuAttachment menuAttachment = (MenuAttachment)newAttachment;
				menuAttachments.add(menuAttachment);
			}
			getHibernateTemplate().saveOrUpdateAll(menuAttachments);
		}
	}
	
	@Override
	public void deleteAll(List<IMenuAttachment> removedAttachments) {
		if(CollectionUtils.isNotEmpty(removedAttachments)) {
			getHibernateTemplate().deleteAll(removedAttachments);
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<IMenuAttachment> findAll(List<Long> itemIds) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select i from MenuAttachment i where i.id in  (:listParam) ");
		queryBuilder.append(" order by i.modificationDate DESC");
		String[] params = { "listParam" };
		Object [] values = {itemIds};
		List<IMenuAttachment> resultItems = getHibernateTemplate().findByNamedParam(queryBuilder.toString(), params, values);
		return resultItems;
	}

	@Override
	public void changeActivation(List<Long> menuAttachmentIds, boolean activate) {
		List<IMenuAttachment> menuAttachments = findAll(menuAttachmentIds);
		for (IMenuAttachment menuAttachment : menuAttachments) {
			menuAttachment.setActive(activate);
		}
		getHibernateTemplate().saveOrUpdateAll(menuAttachments);
	}
}