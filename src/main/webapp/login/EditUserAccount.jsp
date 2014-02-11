<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<sj:head locale="ru" jquerytheme="lightness" jqueryui="true"/>
</head>
<body>

<s:form action="/EditUserAccount" theme="xhtml" accept-charset="UTF-8">	   
		<p><s:label>User Modification</s:label></p>
		 	<s:textfield name="userBean.userCode" value="" label="Code" size="40" />
		    <s:textfield name="userBean.userName" value="" label="Name" size="40" /> 
		    <s:textfield name="userBean.userSurname" value="" label="Sur Name" size="40" />    
		    <s:textfield name="userBean.email" value="" label="Email" size="60" />
		    <s:textfield name="userBean.address" value="" label="Address" size="60" />
		    <s:select multiple="true" label="Choose Article permission" list="allPermissionsForUpdate" name="userBean.selectedPermissions"></s:select>
		    <s:submit value="Edit" label="Edit"/>
		    <s:submit value="Cancel" label="Cancel" action="redirectAction:welcomeIrro" />
	</s:form>
	
</body>
</html>