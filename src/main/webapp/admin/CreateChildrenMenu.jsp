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
<%
String selectedMenuId = request.getParameter("selectedMenuId");

%>
<div style="margin : 5px 0px 0px 10px">
	<h1 style="font-size: 18px;font-family: 'Open Sans';">Create Menu</h1>

	<s:form action="CreateChildrenMenu" theme="xhtml" accept-charset="UTF-8">
		<input type="hidden" id="selectedMenuId" name="selectedMenuId" value="<%=  selectedMenuId %>" />
		
		<sj:textfield name="menu" label="Name " maxlength="50"
			required="true" placeholder="Enter Menu Name" />

		<sj:submit button="Create" value="Create" />
		
	</s:form>
</div>
	
</body>
</html>