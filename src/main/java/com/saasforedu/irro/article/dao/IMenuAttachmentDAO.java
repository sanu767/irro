package com.saasforedu.irro.article.dao;

import java.util.List;

import com.saasforedu.irro.dao.IBaseDAO;
import com.saasforedu.irro.model.IMenuAttachment;
import com.saasforedu.irro.model.impl.MenuAttachment;

public interface IMenuAttachmentDAO extends IBaseDAO<MenuAttachment>{
	public void createAttachments(List<IMenuAttachment> newAttachments);
	public List<IMenuAttachment> findByReferenceMenuId(Long referenceMenuId);
	public void deleteAll(List<IMenuAttachment> removedAttachments);
	public List<IMenuAttachment> findAll(List<Long> itemIds);
	public void changeActivation(List<Long> menuAttachmentIds, boolean activate);
}
