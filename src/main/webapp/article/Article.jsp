<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.commons.collections.CollectionUtils"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<body>
<% List<Long> permissions = (List<Long>)request.getSession().getAttribute("PermissionList");
Long menuId = StringUtils.isNotBlank(request.getParameter("menuId")) ? Long.parseLong(request.getParameter("menuId")) : null;
Long parentMenuId = StringUtils.isNotBlank(request.getParameter("parentMenuId")) ? Long.parseLong(request.getParameter("parentMenuId")) : null;

if(CollectionUtils.isNotEmpty(permissions) && 
		(permissions.contains(menuId) || permissions.contains(parentMenuId))) {%>
		<a id="edittp" href='<s:url action="EditArticle">
		     		<s:param name="id" value="%{bean.id}"></s:param>
		     		<s:param name="menuId" value="%{menuId}"></s:param>
					<s:param name="parentMenuId" value="%{parentMenuId}"></s:param>
					</s:url>'>Редактировать статью</a>
		<a id="deletetp" href='<s:url action="DeleteArticle">
		     		<s:param name="id" value="%{bean.id}"></s:param>
		     		<s:param name="menuId" value="%{menuId}"></s:param>
					<s:param name="parentMenuId" value="%{parentMenuId}"></s:param>
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
		  <h1 style="font-size: 16px;font-family: 'Open Sans';">
	             <a href='<%=request.getContextPath() %><s:property value="location" /><s:property value="name" />'>
					<s:property value="name" />
				  </a>
	      </h1>
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
