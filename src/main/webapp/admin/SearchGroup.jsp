<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<sj:head locale="ru" jquerytheme="lightness" jqueryui="true"/>
	
</head> 

<body>
	<div style="margin : 5px 0px 0px 10px">
	<h1 style="font-size: 18px;font-family: 'Open Sans';">Search</h1>

	
	<s:form action="SearchGroup" theme="xhtml" accept-charset="UTF-8">
	
	    <sj:textfield name="groupSearchBean.searchedName"  label="Group Name" maxlength="100" placeholder="Enter Group Name" />
	    
	    <sj:datepicker name="groupSearchBean.beforeSearchDate" displayFormat="dd/mm/yy" label="Before " changeYear="true" changeMonth="true" showOn="focus" />

		<sj:datepicker name="groupSearchBean.afterSearchDate" displayFormat="dd/mm/yy" label="After " changeYear="true" changeMonth="true" showOn="focus" language="English" />
		
		<sj:submit button="Search" style="float:right;height : 25px;margin: 5px 0px 0px 0px;" value="Search"/>
		
	</s:form>
	
	<div style="padding : 20px 0px 0px 0px">
	  <a href="LoadCreateGroup" style="text-decoration:none;color : rgb(6,85,117);font-size: 16px;font-family: 'Open Sans';">Create Group</a>
	</div>
	
	
	</div>
		
</body>
</html>