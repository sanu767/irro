<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<script type="text/javascript">
window.onload = function () { 
	window.location.hash = 'login';
};
</script>
<body>
<div id="login">
<s:form action="/Login" cssStyle="background : white">
    <s:textfield name="userBean.userCode"  label="User Code"/>
    <s:password name="userBean.password" label="Password" />
    <s:submit value="Login" />
    <s:submit value="Cancel" label="Cancel" action="redirectAction:welcomeIrro" />
</s:form>
</div>
</body>
</html>