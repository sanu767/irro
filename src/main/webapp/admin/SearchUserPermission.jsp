<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<sj:head locale="ru" jquerytheme="lightness" jqueryui="true"/>
<script src="content/jquery-1.10.2.js"></script>

</head> 

<body>
	<div style="margin : 5px 0px 0px 10px">
	<h1 style="font-size: 18px;font-family: 'Open Sans';">Search</h1>
	
	<s:form action="SearchPermissions" theme="xhtml" accept-charset="UTF-8">
	    
	    <sj:textfield name="userSearchBean.searchedName" label="User Name " maxlength="100" placeholder="Enter User Name" />
		
		<s:label title="User Registered" label="User Registered"/>
		<sj:datepicker name="userSearchBean.beforeSearchDate" label="Before " labelposition="right" changeYear="true" changeMonth="true" showOn="focus" />
   
		<sj:datepicker name="userSearchBean.afterSearchDate" label="After " labelposition="right" changeYear="true" changeMonth="true" showOn="focus" />
		
		
		<s:checkboxlist name="userSearchBean.searchedpermissionNames" label="Select Permissions" list="allPermissions"/>
			
		<s:checkboxlist name="userSearchBean.searchedpermissionIds" label="Select Permission types" list="#{'2':'Pending Approval', '0':'Rejected', '1':'Approved'}" />	
        	
				
		<sj:submit style="float:right;height : 25px;margin: 5px 0px 0px 0px;" button="Search" value="Search"/>
		
	</s:form>
	</div>
	
</body>
</html>