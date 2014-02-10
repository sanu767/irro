package com.saasforedu.irro.service;

import java.util.List;

import com.saasforedu.irro.bean.GroupSearchBean;
import com.saasforedu.irro.bean.UserGroupBean;

public interface UserGroupService {
	
	public Integer create(UserGroupBean userGroupBean);
	public void update(UserGroupBean userGroupBean);
	public void delete(List<Integer> groupsToDelete);
	public List<UserGroupBean> findAll();
	public List<UserGroupBean> findByName(String userGroupName);
	public List<UserGroupBean> search(GroupSearchBean groupSearchBean);
	public void changeActivation(List<Integer> selectedGroups, boolean activate);
	
}