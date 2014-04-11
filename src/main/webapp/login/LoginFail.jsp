<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<h1>Login Failed.</h1>
<br>Login again or click 
	<a href="<%=request.getContextPath() %>/forgotPasswordWL" >"Forgot Password"</a> 
	<br>
	We will send you password in your registration mail Id.

<jsp:include page="/login/Login.jsp"></jsp:include>
</html>