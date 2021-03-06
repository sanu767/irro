package com.saasforedu.irro.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;

import com.saasforedu.irro.bean.UserSearchBean;
import com.saasforedu.irro.dao.UserDAO;
import com.saasforedu.irro.model.IUser;
import com.saasforedu.irro.model.IUserPermission;
import com.saasforedu.irro.model.impl.User;
import com.saasforedu.irro.util.IrroUtils;

public class UserDAOImpl extends BaseDAOimpl<User> implements UserDAO {

	@Override
	public void delete(List<IUser> usersToDelete) {
		getHibernateTemplate().deleteAll(usersToDelete);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<IUser> findAll(List<Long> userIds) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from User u where u.id in  (:listParam) ");
		String[] params = { "listParam" };
		Object [] values = {userIds};
		List<IUser> resultUsers = getHibernateTemplate().findByNamedParam(queryBuilder.toString(), 
				params, values);
		return resultUsers;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public IUser findbyEmailId(String emailId) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from User u where u.email =  ? ");
		List<IUser> resultUsers = getHibernateTemplate().find(queryBuilder.toString(), emailId);
		return resultUsers.get(0);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<IUser> search(UserSearchBean userSearchBean) {
		
		List<Integer> searchedPermissionIds = userSearchBean.getSearchedpermissionIds();
		boolean permissionIdsSearched = CollectionUtils.isNotEmpty(searchedPermissionIds);
		
		List<String> searchedPermissionNames = userSearchBean.getSearchedpermissionNames();
		boolean permissionNamesSearched = CollectionUtils.isNotEmpty(searchedPermissionNames);
		
		String searchedName = userSearchBean.getSearchedName();
		boolean isSearchedName = StringUtils.isNotEmpty(searchedName);
		
		Date beforeSearchDate = userSearchBean.getBeforeSearchDate();
		boolean beforeSearchDateSet = beforeSearchDate != null;
		
		Date afterSearchDate = userSearchBean.getAfterSearchDate();
		boolean afterSearchDateSet = afterSearchDate != null;
		
		Long maxUploadSize = userSearchBean.getMaxUploadFileSize();
		boolean maxUploadSizeSet = maxUploadSize != null;
		
		
		//No searched parameter set
		if(!permissionIdsSearched && !permissionNamesSearched && 
				!isSearchedName && !beforeSearchDateSet && 
				!afterSearchDateSet && !maxUploadSizeSet) {
			return null;
		} else {
			List<String> params = new ArrayList<String>();
			
			List<Object> values = new ArrayList<Object>();
			
			StringBuilder queryBuilder = new StringBuilder("select u from User u ");
			
			if(permissionIdsSearched || 
					permissionNamesSearched) {
				
				queryBuilder.append(" where u in  ");
				queryBuilder.append(" (select p.user from UserPermission p where ");
				
				if(permissionIdsSearched) {
					queryBuilder.append(" p.permissionType in (:paramTypes) ");
					params.add("paramTypes");
					values.add(searchedPermissionIds);
				}
				
				if(permissionNamesSearched) {
					if(permissionIdsSearched) {
						queryBuilder.append(" or ");
					}
					queryBuilder.append(" p.permissionName in (:paramNames) ");
					params.add("paramNames");
					values.add(searchedPermissionNames);
				}			
				queryBuilder.append(" ) ");
			}
			
			if(isSearchedName) {
				if( !permissionIdsSearched && !permissionNamesSearched) {
					queryBuilder.append(" where ");
				} else {
					queryBuilder.append(" or ");
				}
				queryBuilder.append(" u.userCode like ");
				queryBuilder.append(" '%" + searchedName +"%' ");
				queryBuilder.append(" or u.userName like ");
				queryBuilder.append(" '%" + searchedName +"%' ");
				queryBuilder.append(" or u.userSurname like ");
				queryBuilder.append(" '%" + searchedName +"%' ");
			}
			
			if(beforeSearchDateSet) {
				if( !permissionIdsSearched && !permissionNamesSearched && !isSearchedName) {
					queryBuilder.append(" where ");
				} else {
					queryBuilder.append(" or ");
				}
				queryBuilder.append(" u.registrationDate <= (:beforeSearchDate) ");
				params.add("beforeSearchDate");
				values.add(beforeSearchDate);
			}

			if(afterSearchDateSet) {
				if( !permissionIdsSearched && !permissionNamesSearched && !isSearchedName && !beforeSearchDateSet) {
					queryBuilder.append(" where ");
				} else {
					queryBuilder.append(" or ");
				}
				queryBuilder.append(" u.registrationDate >= (:afterSearchDate) ");
				params.add("afterSearchDate");
				values.add(afterSearchDate);
			}
			
			if(maxUploadSizeSet) {
				if( !permissionIdsSearched && !permissionNamesSearched 
						&& !isSearchedName && 
						!beforeSearchDateSet && !afterSearchDateSet) {
					queryBuilder.append(" where ");
				} else {
					queryBuilder.append(" or ");
				}
				queryBuilder.append(" u.maxUploadFileSize <= (:maxUploadFileSize) ");
				params.add("maxUploadFileSize");
				values.add(maxUploadSize);
			}

			List<IUser> users = getHibernateTemplate().findByNamedParam(queryBuilder.toString(), 
					IrroUtils.getParamArray(params), 
					values.toArray());
			return users;
		}		
	}

	@SuppressWarnings("unchecked")
	@Override
	public IUser authenticate(String userCode, String password) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from User u where u.userCode = ? and u.password = ? ");
		List<IUser> users = getHibernateTemplate().find(queryBuilder.toString(), new Object[]{userCode, password});
		if(CollectionUtils.isNotEmpty(users) && users.size() == 1 ) {
			return users.get(0);
		}
		return null;
	}

	@Override
	public void changeActivation(List<Long> userIds, boolean activate) {
		List<IUser> users = findAll(userIds);
		for (IUser user : users) {
			user.setActive(activate);
		}
		getHibernateTemplate().saveOrUpdateAll(users);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public boolean isUserCodeOrEmailExists(String userCode, String email) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from User u where u.userCode = ? or u.email = ? ");
		List<IUser> users = getHibernateTemplate().find(queryBuilder.toString(), new Object[]{userCode, email});
		if(CollectionUtils.isNotEmpty(users)) {
			return true;
		}
		return false;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void deletePermissionsByGroupNames(List<String> groupNames) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select u from UserPermission u where u.permissionName in (:listParam)");
		String[] params = { "listParam" };
		Object [] values = {groupNames};
		List<IUserPermission> permissions = getHibernateTemplate().findByNamedParam(queryBuilder.toString(), params, values);
		if(CollectionUtils.isNotEmpty(permissions)) {
			getHibernateTemplate().deleteAll(permissions);
		}
	}
	
	@Override
	public void update(IUser user, List<IUserPermission> removedPermissions) {
		deletePermissions(removedPermissions);
		super.update((User)user);
	}
	
	private void deletePermissions(List<IUserPermission> removedPermissions) {
		if(CollectionUtils.isNotEmpty(removedPermissions)) {
			getHibernateTemplate().deleteAll(removedPermissions);
		}
	}
}
