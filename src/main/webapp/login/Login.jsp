<%@ page contentType="text/html;charset=UTF-8" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<body>
<s:form action="LoginAction">
    <s:textfield key="userID" label="%{getText('label.userCode')}"/>
    <s:password key="password" label="%{getText('label.password')}" />
    <s:submit value="%{getText('button.label.submit')}"/>
    <s:submit value="%{getText('button.label.cancel')}" name="redirectAction:welcomeWL"/>
</s:form>
</body>
</html>
