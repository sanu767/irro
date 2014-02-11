<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% if(request.getSession().getAttribute("userCode") == null)  { %>
<a style="float:right;height:19px;padding-left:0px;" href="<s:url action="user/registerWL" />">Register</a>
<a style="float:right;height:19px;padding-left:0px;" href="<s:url action="user/loginWL" />">Login</a>
<% } else { %>
<a style="float:right;height:19px;padding-left:0px;" href="<s:url action="user/LogOutAction" />">Log Out</a>
<a style="float:right;height:19px;padding-left:0px;" href="<s:url action="user/ModifyUserAction" />">Edit</a>
<% } %>