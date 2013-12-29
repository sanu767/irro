<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<p>Thank you <s:property value="user.name"/> for Registration </p>
<p>Your password is <s:property value="user.password"/> </p>
<s:url id="loginUrl"  action="LoginAction"/>
<p>Now you can proceed with <a href="<s:property value="#loginUrl"/>">Login</a>
</html>