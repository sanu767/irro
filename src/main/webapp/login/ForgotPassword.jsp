<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<script type="text/javascript">
window.onload = function () { 
	window.location.hash = 'forgotpassword';
};
</script>
<body>
<div id="forgotpassword">
<s:form action="/ForgotPassword" cssStyle="background : white">
    <s:textfield name="emailOfForgotUser" label="Email" size="60" required="true"/>
    <s:submit value="Send Mail" />
    <s:submit value="Cancel" label="Cancel" action="redirectAction:welcomeIrro" />
</s:form>
</div>
</body>
</html>