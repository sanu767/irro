package com.saasforedu.irro.dao;

import java.util.List;

import com.saasforedu.irro.bean.GroupSearchBean;
import com.saasforedu.irro.model.IUserGroup;

public interface UserGroupDAO {
	
	/** Put CRUD in BaseDAO **/
	public Integer create(IUserGroup userGroup);
	public void update(IUserGroup userGroup);
	public void delete(List<IUserGroup> groupsToDelete);
	public List<IUserGroup> findAll();
	public List<IUserGroup> findByName(String userGroupName);
	public List<IUserGroup> findAll(List<Integer> groupIdsToDelete);
	public IUserGroup findById(Integer id);
	public void changeActivation(List<Integer> groupIds, boolean activate);
	public List<IUserGroup> search(GroupSearchBean groupSearchBean);
}
