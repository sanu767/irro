<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
 <s:form method="POST" id="register-form" action="/RegistrationAction">
 	<s:textfield name="user.code" value="%{user.code}" label="%{getText('label.userCode')}" size="40"/>
    <s:textfield name="user.name" value="%{user.name}" label="%{getText('label.userName')}" size="40"/>
    <s:textfield name="user.password" value="%{user.password}" label="%{getText('label.password')}" size="40"/>
    <s:textfield name="user.emailID" value="%{user.emailID}" label="%{getText('label.emailID')}" size="60"/>
    <s:submit value="%{getText('button.label.submit')}"/>
    <s:submit value="%{getText('button.label.cancel')}" name="redirect-action:WelcomeWL"/>
 </s:form>