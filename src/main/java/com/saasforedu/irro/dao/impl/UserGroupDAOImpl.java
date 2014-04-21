package com.saasforedu.irro.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.saasforedu.irro.bean.GroupSearchBean;
import com.saasforedu.irro.dao.UserGroupDAO;
import com.saasforedu.irro.model.IUserGroup;
import com.saasforedu.irro.model.impl.UserGroup;
import com.saasforedu.irro.util.IrroUtils;

public class UserGroupDAOImpl extends HibernateDaoSupport implements UserGroupDAO {

	@Override
	public Integer create(IUserGroup userGroup) {
		userGroup.setCreationDate(new Date());
		return (Integer)getHibernateTemplate().save(userGroup);
	}
	
	@Override
	public void update(IUserGroup userGroup) {
		getHibernateTemplate().update(userGroup);
	}

	@Override
	public void delete(List<IUserGroup> groupsToDelete) {
		getHibernateTemplate().deleteAll(groupsToDelete);
	}
	
	@Override
	public void deleteGroup(IUserGroup groupsToDelete) {
		getHibernateTemplate().delete(groupsToDelete);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<IUserGroup> findAll() {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from UserGroup u where active = ?");
		List<IUserGroup> resultUsers = getHibernateTemplate().find(queryBuilder.toString(), true);
		return resultUsers;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<IUserGroup> findByName(String userGroupName) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from UserGroup u  where u.groupName like" +
				"'%" + userGroupName + "%'");
		List<IUserGroup> resultUserGroups = getHibernateTemplate().find(queryBuilder.toString());
		return resultUserGroups;
	}

	@SuppressWarnings("unchecked")
	@Override
	public IUserGroup findByNameAndCode(String groupName) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from UserGroup u  where u.groupName = ? and u.groupCode = ?");
		List<IUserGroup> result = getHibernateTemplate().find(queryBuilder.toString(),
				new Object []  {groupName, groupName});
		return CollectionUtils.isEmpty(result) ? null : result.get(0);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<IUserGroup> findAll(List<Integer> groupIds) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from UserGroup u where u.groupId in  (:listParam) ");
		String[] params = { "listParam" };
		Object [] values = {groupIds};
		List<IUserGroup> resultUsers = getHibernateTemplate().findByNamedParam(queryBuilder.toString(), 
				params, values);
		return resultUsers;
	}

	@Override
	public IUserGroup findById(Integer id) {
		IUserGroup userGroup = (IUserGroup)getHibernateTemplate().get(UserGroup.class, id);
		return userGroup;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<IUserGroup> search(GroupSearchBean groupSearchBean) {
		
		String searchedName = groupSearchBean.getSearchedName();
		boolean isSearchedName = StringUtils.isNotBlank(searchedName);
		
		Date beforeSearchDate = groupSearchBean.getBeforeSearchDate();
		boolean beforeSearchDateSet = beforeSearchDate != null;
		
		Date afterSearchDate = groupSearchBean.getAfterSearchDate();
		boolean afterSearchDateSet = afterSearchDate != null;
		
		//No searched parameter set
		if( !isSearchedName && !beforeSearchDateSet && 
				!afterSearchDateSet) {
			return null;
		} else {
			List<String> params = new ArrayList<String>();			
			List<Object> values = new ArrayList<Object>();
			
			StringBuilder queryBuilder = new StringBuilder("select u from UserGroup u ");
			
			if(isSearchedName) {
				queryBuilder.append("  where u.groupCode like ");
				queryBuilder.append(" '%" +searchedName+"%' ");
				queryBuilder.append(" or u.groupName like ");
				queryBuilder.append(" '%" +searchedName+"%' ");
			}
			
			if(beforeSearchDateSet) {
				if( !isSearchedName) {
					queryBuilder.append(" where ");
				} else {
					queryBuilder.append(" or ");
				}
				queryBuilder.append(" u.creationDate <= (:beforeSearchDate) ");
				params.add("beforeSearchDate");
				values.add(beforeSearchDate);
			}

			if(afterSearchDateSet) {
				if( !isSearchedName && !beforeSearchDateSet) {
					queryBuilder.append(" where ");
				} else {
					queryBuilder.append(" or ");
				}
				queryBuilder.append(" u.creationDate >= (:afterSearchDate) ");
				params.add("afterSearchDate");
				values.add(afterSearchDate);
			}

			List<IUserGroup> groups = getHibernateTemplate().findByNamedParam(queryBuilder.toString(), 
					IrroUtils.getParamArray(params), 
					values.toArray());
			return groups;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public void changeActivation(List<Integer> groupIds, boolean activate) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from UserGroup u where u.groupId in  (:listParam) ");
		String[] params = { "listParam" };
		Object [] values = {groupIds};
		List<IUserGroup> groups = getHibernateTemplate().findByNamedParam(queryBuilder.toString(), 
				params, values);
		if(CollectionUtils.isNotEmpty(groups)) {
			for (IUserGroup userGroup : groups) {
				userGroup.setActive(activate);
			}
			getHibernateTemplate().saveOrUpdateAll(groups);
		}	
	}
}
