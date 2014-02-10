package com.saasforedu.irro.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.saasforedu.irro.bean.GroupSearchBean;
import com.saasforedu.irro.bean.UserGroupBean;
import com.saasforedu.irro.dao.UserGroupDAO;
import com.saasforedu.irro.model.IUserGroup;
import com.saasforedu.irro.model.impl.UserGroup;
import com.saasforedu.irro.service.UserGroupService;
import com.saasforedu.irro.service.UserService;

public class UserGroupServiceImpl implements UserGroupService {
	
	private UserService userService;

	private UserGroupDAO userGroupDAO;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setUserGroupDAO(UserGroupDAO userGroupDAO) {
		this.userGroupDAO = userGroupDAO;
	}

	@Override
	public Integer create(UserGroupBean userGroupBean) {
		IUserGroup userGroup = new UserGroup();
		copyPropeties(userGroupBean, userGroup);
		return userGroupDAO.create(userGroup);
	}

	@Override
	public void update(UserGroupBean userGroupBean) {
		IUserGroup userGroup = userGroupDAO.findById(userGroupBean.getGroupId());
		copyPropeties(userGroupBean, userGroup);
		userGroupDAO.update(userGroup);
	}

	@Override
	public void delete(List<Integer> groupIdsToDelete) {
		List<IUserGroup> groupsToDelete = userGroupDAO.findAll(groupIdsToDelete);
		if(CollectionUtils.isNotEmpty(groupsToDelete)) {
			List<String> groupNames = getGroupNames(groupsToDelete);
			userService.deletePermissionsByGroupNames(groupNames);
		}
		userGroupDAO.delete(groupsToDelete);
	}

	private List<String> getGroupNames(List<IUserGroup> groupsToDelete) {
		List<String> groupNames = new ArrayList<String>();
		for (IUserGroup userGroup : groupsToDelete) {
			String groupName = userGroup.getGroupName();
			groupNames.add(groupName);
		}
		return groupNames;
	}

	@Override
	public List<UserGroupBean> findAll() {
		List<IUserGroup> userGroups = userGroupDAO.findAll();
		List<UserGroupBean> groupBeans = new ArrayList<UserGroupBean>();
		if(CollectionUtils.isNotEmpty(userGroups)) {
			for (IUserGroup userGroup : userGroups) {
				UserGroupBean userGroupBean = new UserGroupBean();
				copyPropeties(userGroup, userGroupBean);
				groupBeans.add(userGroupBean);
			}
		}		
		return groupBeans;
	}

	@Override
	public List<UserGroupBean> findByName(String userGroupName) {
		List<IUserGroup> userGroups = userGroupDAO.findByName(userGroupName);
		List<UserGroupBean> groupBeans = new ArrayList<UserGroupBean>();
		if(CollectionUtils.isNotEmpty(userGroups)) {
			for (IUserGroup userGroup : userGroups) {
				UserGroupBean userGroupBean = new UserGroupBean();
				copyPropeties(userGroup, userGroupBean);
				groupBeans.add(userGroupBean);
			}
		}
		return groupBeans;
	}
	
	@Override
	public List<UserGroupBean> search(GroupSearchBean groupSearchBean) {
		List<IUserGroup> userGroups = userGroupDAO.search(groupSearchBean);
		List<UserGroupBean> groupBeans = new ArrayList<UserGroupBean>();
		if(CollectionUtils.isNotEmpty(userGroups)) {
			for (IUserGroup userGroup : userGroups) {
				UserGroupBean userGroupBean = new UserGroupBean();
				copyPropeties(userGroup, userGroupBean);
				groupBeans.add(userGroupBean);
			}
		}
		return groupBeans;
	}
	
	@Override
	public void changeActivation(List<Integer> selectedGroups, boolean activate) {
		userGroupDAO.changeActivation(selectedGroups, activate);
	}
	
	private void copyPropeties(IUserGroup userGroup, UserGroupBean userGroupBean) {
		userGroupBean.setActive(userGroup.isActive());
		userGroupBean.setGroupId(userGroup.getGroupId());
		userGroupBean.setGroupCode(userGroup.getGroupCode());
		userGroupBean.setGroupName(userGroup.getGroupName());
		userGroupBean.setCreationDate(userGroup.getCreationDate());
	}
	
	private void copyPropeties(UserGroupBean userGroupBean, IUserGroup userGroup) {
		userGroup.setActive(userGroupBean.isActive());
		userGroup.setGroupId(userGroupBean.getGroupId());
		userGroup.setGroupCode(userGroupBean.getGroupCode());
		userGroup.setGroupName(userGroupBean.getGroupName());
		userGroup.setCreationDate(userGroupBean.getCreationDate());
	}

}
