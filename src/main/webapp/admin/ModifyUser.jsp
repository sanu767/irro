<%@page import="com.saasforedu.irro.bean.UserBean"%>
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


<div style="height : 300 px">

	<s:form action="EditUser" theme="xhtml" accept-charset="UTF-8">
	
	    <s:textfield name="userAdminBean.id" label="User Id" size="40" required="true" />	   
        <s:textfield name="userAdminBean.userCode" label="Code" size="40" required="true" />
	 	<s:password name="userAdminBean.password" label="Password" size="40" required="true" />
	    <s:textfield name="userAdminBean.userName" label="Name" size="40" required="true"/> 
	    <s:textfield name="userAdminBean.userSurname" label="Sur Name" size="40" required="true"/>    
	    <s:textfield name="userAdminBean.email" label="Email" size="60" required="true"/>
	    <s:textfield name="userAdminBean.address" label="Address" size="60" />
	    
		<sj:submit button="Edit" value="Edit" />		
	</s:form>
</div>
	
</body>
</html>