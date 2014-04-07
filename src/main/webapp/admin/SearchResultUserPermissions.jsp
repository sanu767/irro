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
<s:form action="welcomeIrro" theme="xhtml" accept-charset="UTF-8">
		 <display:table name="searchedUsers"  defaultsort="2" pagesize="10" sort="list" requestURI="" uid="eachSearchedUserPermissions" id="eachSearchedUserPermissions">
			  <display:column property="userName" title="Name" sortable="true" style="width : 15px" />
			  <display:column title="Permisions" style="width : 100px" >
				  <s:iterator value="%{#attr.eachSearchedUserPermissions.permissionBeans}" id="eachSearchedUserPermission">
 	<s:property value="#eachSearchedUserPermission.permissionType" />
				   </s:iterator>
			   </display:column>			   
		 </display:table>
		 <s:a value="Approve" href="Grant">Grant</s:a>
		 <s:a value="Revoke" href="Revoke" >Revoke</s:a>
		 <s:submit button="Cancel" value="Cancel"/>
</s:form>
</body>
</html>