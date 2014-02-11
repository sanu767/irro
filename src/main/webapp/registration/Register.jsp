<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<html>
<script type="text/javascript">
window.onload = function () { 
	window.location.hash = 'registration';
};
</script>
<body>
<div id="registration">
 <s:form cssClass="registrationwrap" method="POST" id="register-form" action="/Registration" cssStyle="background : white">
 	<p><s:label>User Registration</s:label></p>
 	<s:textfield name="userBean.userCode" label="Code" size="40" required="true" />
 	<s:password name="userBean.password" label="Password" size="40" required="true" />
    <s:textfield name="userBean.userName" label="Name" size="40" required="true" /> 
    <s:textfield name="userBean.userSurname" label="Sur Name" size="40"/>    
    <s:textfield name="userBean.email" label="Email" size="60" required="true"/>
    <s:textfield name="userBean.address" label="Address" size="60" />
    <s:select multiple="true" label="Choose Article permission" list="allPermissions" name="userBean.selectedPermissions"></s:select>
    <s:submit value="Register"/>
    <s:submit value="Cancel" name="redirectAction:welcomeWL"/>
 </s:form>
 </div>
 </body>
 </html>