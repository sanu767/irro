<%@page import="org.apache.commons.collections.CollectionUtils"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<body>
<% List<String> permissions = (List<String>)request.getSession().getAttribute("PermissionList");
String menuName = request.getParameter("menuName");
String parentMenuName = request.getParameter("parentMenuName");
if(CollectionUtils.isNotEmpty(permissions) && 
		(permissions.contains(menuName) || permissions.contains(parentMenuName))) {%>
		<a id="edittp" href='<s:url action="EditArticle">
		     		<s:param name="id" value="%{bean.id}"></s:param>
		     		<s:param name="menuName" value="%{menuName}"></s:param>
					<s:param name="parentMenuName" value="%{parentMenuName}"></s:param>
					</s:url>'>Edit</a>
		<a id="deletetp" href='<s:url action="DeleteArticle">
		     		<s:param name="id" value="%{bean.id}"></s:param>
		     		<s:param name="menuName" value="%{menuName}"></s:param>
					<s:param name="parentMenuName" value="%{parentMenuName}"></s:param>
					</s:url>' onClick="return confirm('Do you want to delete these Article?');">Delete</a>
<%}%>

<div id="main" onmouseover="editButton()"  onmouseout="removeEditButton()">	

<h4 style="font-weight:bold;font-size: 18px;font-family: 'Open Sans';color : rgb(88, 103, 168);">
	<s:property value="bean.title" />
</h4>

<h1 style="font-size: 16px;font-family: 'Open Sans';">
	<s:property value="bean.description" />
</h1>

	<div id="editor">

	</div>

	 <s:iterator value="bean.attachmentBeans">
	  <s:if test="active">
	  <a href='<%=request.getContextPath() %><s:property value="location" /><s:property value="name" />'>
	  	<s:property value="name" />
	  </a>
	  </s:if>
	 </s:iterator>

</div>

<s:hidden id="hiddenMainContent" name="hiddenMainContent" value="%{bean.content}"/>

<script src="../editor/ckeditor.js"></script>
<script>
	
window.onload = function() {
	document.getElementById('editor').innerHTML = document.getElementById('hiddenMainContent').value;
};
</script>
</body>
</html>
