<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<sj:head locale="ru" jquerytheme="lightness" jqueryui="true"/>
<style type="text/css">
.deleteCheckBox{
  width : 10px;
  padding-left : 0px;
  margin-left: 0px;
  
}
</style>
</head> 

<body>
     <s:form action="DeleteGroup" theme="xhtml" accept-charset="UTF-8">
		 <display:table name="searchedUserGroups"  defaultsort="2" pagesize="10" sort="list" requestURI="" uid="eachSearchedGroup" id="eachSearchedGroup">
		 	  <display:column title="Select">
			     <input type="checkbox" name="selectedGroupIds" value="${eachSearchedGroup.groupId}">
			  </display:column>
			  <display:column property="groupCode" title="Code" sortable="true" style="width : 15px" />
			  <display:column property="groupName" title="Name" sortable="true" />
			  <display:column property="active" title="Is Active" sortable="true" style="width : 15px" />
		 </display:table>
		 <input type="submit" value="Activate" onclick="form.action='ActivateGroups';">
		 <input type="submit" value="DeActivate" onclick="form.action='DeActivateGroups';">
		 <sj:submit button="Delete" value="Delete" onClick="return confirm('Do you want to delete these Groups?');" />
	 </s:form>
</body>
</html>