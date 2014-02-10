<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<sj:head locale="ru" jquerytheme="lightness" jqueryui="true"/>
</head> 

<body>
<div style="margin : 5px 0px 0px 10px">
	<h1 style="font-size: 18px;font-family: 'Open Sans';">Create Group</h1>

	<s:form action="CreateGroup" theme="xhtml" accept-charset="UTF-8">

		<sj:textfield name="userGroupBean.groupCode" label="Group Code " maxlength="50"
			required="true" placeholder="Enter title" />
			
		<sj:textfield name="userGroupBean.groupName" label="Group Name " maxlength="100"
			required="true" placeholder="Enter Group Name" />

		<sj:submit button="Create" value="Create" />
		
	</s:form>
</div>
	
</body>
</html>