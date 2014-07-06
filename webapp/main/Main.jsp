<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<h6>Welcome to SDA Russian University</h6>
<h3>Change your Languages</h3>
<ul>
    <li>
        <s:url id="url" action="HelloWorld">
            <s:param name="request_locale">en</s:param>
        </s:url>
        <s:a href="%{url}">English</s:a>
    </li>
    <li>
        <s:url id="url" action="HelloWorld">
            <s:param name="request_locale">eu</s:param>
        </s:url>
        <s:a href="%{url}">Russian</s:a>
    </li>
</ul>
</html>