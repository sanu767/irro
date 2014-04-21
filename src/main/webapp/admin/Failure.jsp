<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.errorDiv{
	background-color:white;
	border:1px solid black;
	width:485px;
}
</style>
</head>
<body>
Failed  !!! Try again !!!
<s:if test="hasActionErrors()">
		<div class="errorDiv">
			<s:actionerror/>
		</div>
	</s:if>
</body>
</html>