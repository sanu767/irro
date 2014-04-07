<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<sj:head jquerytheme="lightness" jqueryui="true"/>
<style type="text/css">
.deleteCheckBox{
  width : 10px;
  padding-left : 0px;
  margin-left: 0px;
  
}
</style>
</head> 

<body>
     <s:form theme="xhtml" accept-charset="UTF-8" action="DeleteUser">
		 <display:table name="searchedUsers"  defaultsort="2" pagesize="10" sort="list" requestURI="" uid="eachSearchedUser" id="eachSearchedUser">
			  <display:column title="Select">
			    <input type="checkbox" name="selectedUserIds" value="${eachSearchedUser.id}">
			  </display:column>
			  <display:column property="userCode" title="Code" sortable="true" style="width : 15px" />
			  <display:column property="userName" title="Name" sortable="true" style="width : 15px" />
			  <display:column property="userSurname" title="Sur Name" sortable="true" style="width : 15px" />
			  <display:column property="email" title="Email" sortable="true" style="width : 15px" />
			  <display:column property="address" title="Address" style="width : 15px" />
			  <display:column property="active" title="Enabled" sortable="true" style="width : 15px"  />
			  <display:column title="Update"><a href="<s:url action="LoadUser">
		     		<s:param name="selectedUserIdToModify" value="%{#attr.eachSearchedUser.id}"></s:param>
		     		</s:url>"> Edit </a>
		     </display:column>
		 </display:table>
		 
		  <input type="submit" value="Activate" onclick="form.action='ActivateUsers';">
		  <input type="submit" value="DeActivate" onclick="form.action='DeActivateUsers';">
		  <s:submit button="Delete" value="Delete"  name="DeleteUser" onClick="return confirm('Do you want to delete these Users?');" />
	 </s:form>
</body>
</html>