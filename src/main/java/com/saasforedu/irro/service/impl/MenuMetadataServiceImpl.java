package com.saasforedu.irro.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.Stack;

import org.apache.commons.collections.CollectionUtils;

import com.saasforedu.irro.bean.UserGroupBean;
import com.saasforedu.irro.dao.MenuMetadataDAO;
import com.saasforedu.irro.model.IMenuMetadata;
import com.saasforedu.irro.model.IUserGroup;
import com.saasforedu.irro.model.impl.MenuMetadata;
import com.saasforedu.irro.service.MenuMetadataService;
import com.saasforedu.irro.service.UserGroupService;

public class MenuMetadataServiceImpl implements MenuMetadataService {
	
	private MenuMetadataDAO menuMetadataDAO;
	
	private UserGroupService userGroupService;
	
	public void setMenuMetadataDAO(MenuMetadataDAO menuMetadataDAO) {
		this.menuMetadataDAO = menuMetadataDAO;
	}

	public void setUserGroupService(UserGroupService userGroupService) {
		this.userGroupService = userGroupService;
	}

	@Override
	public Long createMenuMetadata(IMenuMetadata menuMetadata) {
		createUserGroup(menuMetadata);
		return (Long)menuMetadataDAO.create((MenuMetadata)menuMetadata);
	}

	public void createUserGroup(IMenuMetadata menuMetadata) {
		UserGroupBean userGroupBean = new UserGroupBean();
		userGroupBean.setGroupCode(menuMetadata.getName());
		userGroupBean.setGroupName(menuMetadata.getLabel());
		userGroupService.create(userGroupBean);
	}

	@Override
	public void updateMenuMetadata(IMenuMetadata menuMetadata) {
		menuMetadataDAO.update((MenuMetadata)menuMetadata);
	}

	@Override
	public void deleteMenuMetadata(IMenuMetadata menuMetadata) {
		menuMetadataDAO.deleteMenuMetadata(menuMetadata);
	}

	/* 
	 * This method will delete all children.
	 */
	@Override
	public Long deleteMenu(Long id) {
		IMenuMetadata menu = findById(id);
		if(menu == null) {
			return 0l;
		}
		
		Set<IMenuMetadata> menuToDelete = new HashSet<IMenuMetadata>();
		menuToDelete.add(menu);
		
		List<IUserGroup> groupsToDelete = new ArrayList<IUserGroup>();
		groupsToDelete.add(findUserGroup(menu));
		
		Stack<Long> stack = new Stack<Long>();
		stack.push(menu.getId());
		
		addItemsToDelete(menuToDelete, groupsToDelete, stack);
		
		if(CollectionUtils.isNotEmpty(groupsToDelete)) {
			userGroupService.deleteAll(groupsToDelete);
		}
		if(CollectionUtils.isNotEmpty(menuToDelete)) {
			menuMetadataDAO.deleteAll(menuToDelete);
		}
		//TODO Delete Articles
		//TODO Delete Attachment
		return id;
	}
	
	@Override
	public IMenuMetadata findByReferenceArticleId(Long referenceArticleId) {
		return menuMetadataDAO.findByReferenceArticleId(referenceArticleId);
	}

	private void addItemsToDelete(Set<IMenuMetadata> menuToDelete,
			List<IUserGroup> groupsToDelete, Stack<Long> stack) {
		Iterator<Long> it = stack.iterator();
		while(it.hasNext()) {
			Long top = stack.pop();
			List<IMenuMetadata> children = findChildren(top);
			for (IMenuMetadata child : children) {
				stack.push(child.getId());
				menuToDelete.add(child);
				groupsToDelete.add(findUserGroup(child));
			}
		}
	}
	
	private IUserGroup findUserGroup(IMenuMetadata menu) {
		return userGroupService.findByNameAndCode(menu.getName());
	}
	
	@Override
	public IMenuMetadata findById(Long menuId) {
		return menuMetadataDAO.findById(MenuMetadata.class, menuId);
	}

	@Override
	public List<IMenuMetadata> findChildren(Long parentId) {
		return menuMetadataDAO.findChildren(parentId);
	}

	@Override
	public IMenuMetadata findByName(String menuName) {
		return menuMetadataDAO.findByName(menuName);
	}
	
	@Override
	public List<IMenuMetadata> findAllMenus() {
		return menuMetadataDAO.findAllMenus();
	}
	
	@Override
	public Long getNextReferenceArticleId() {
		Long lastReferenceArticleId = menuMetadataDAO.getLastReferenceArticleId() == null ? 0L : 
			menuMetadataDAO.getLastReferenceArticleId() ;
		return lastReferenceArticleId + 1;
	}

	@Override
	public IMenuMetadata getMenuMetadata(Long name, Long parentName) {
		return menuMetadataDAO.getMenuMetadata(name, parentName);
	}	
	
	@Override
	public Long rename(Long id, String newMenu) {
		MenuMetadata menu = (MenuMetadata) findById(id);
		String oldName = menu.getLabel();
		menu.setLabel(newMenu);
		menuMetadataDAO.update(menu);
		userGroupService.renameGroup(oldName, newMenu);
		return id;
	}

	@Override
	public IMenuMetadata getMenuTree() {
		return menuMetadataDAO.getTree();
	}

	@Override
	public IMenuMetadata getMenuTreeById(Long id) {
		return menuMetadataDAO.findById(id);
	}

	@Override
	public List<Long> findIdsByCodes(List<String> codes) {
		return menuMetadataDAO.findIdsByCodes(codes);
	}

	@Override
	public IMenuMetadata getMainNewsMenuparameters() {
		return menuMetadataDAO.getMainNewsMenuparameters();
	}
}
