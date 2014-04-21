<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.commons.collections.CollectionUtils"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<sj:head locale="ru" jquerytheme="lightness" jqueryui="true"/>
<style type="text/css">

.result-document {
  border-bottom: 1px solid #999;
  border-color: rgb(0,0,128);
  padding: 5px;
  margin: 5px;
  margin-left: 5px;
  margin-bottom: 15px;
}

.pagination {
	margin-top: 10px;
}

.result-document div{
  padding: 5px;

}

.result-title{
  width:60%;
}

.result-body{
  background: #00BFFF;
}

.pagination-table {
background: none;
width : 600px;

}

.pagination-table td {
  font-size: 10px;
  width: 1%;

}

.pagination-table a {
  font-weight : bold;
  color : rgb(88, 103, 168);
}

</style>
</head> 

<body>
<div class="pagination">

<% List<Long> permissions = (List<Long>)request.getSession().getAttribute("PermissionList");
Long menuId = StringUtils.isNotBlank(request.getParameter("menuId")) ? Long.parseLong(request.getParameter("menuId")) : null;
Long parentMenuId = StringUtils.isNotBlank(request.getParameter("parentMenuId")) ? Long.parseLong(request.getParameter("parentMenuId")) : null;
if(CollectionUtils.isNotEmpty(permissions) && 
		(permissions.contains(menuId) || permissions.contains(parentMenuId))) {%>
<a id="add" href='<s:url action="AddNews"><s:param name="menuId" value="%{menuId}"></s:param>
			<s:param name="parentMenuId" value="%{parentMenuId}"></s:param></s:url>'>
<button class="btn btn-primary" type="button" value="Add New" >Add New</button>
</a>
<%}%>

<display:table name="beans" defaultsort="2" pagesize="5" sort="list" requestURI="" uid="bean" id="bean" class="pagination-table">
	<display:column>
		<div class="result-document">
		<h4>
	      <a href='<s:url action="LoadSelectedNews">
	     		<s:param name="menuId" value="%{menuId}"></s:param>
				<s:param name="parentMenuId" value="%{parentMenuId}"></s:param>
				<s:param name="selectedItemId" value="%{#attr.bean.id}"></s:param></s:url>'>
				<p>
					<s:property value="%{#attr.bean.title}"/>
				</p>
	      </a>
			</h4>
			<span>
	      		<s:property value="%{#attr.bean.description}"/>
	      	</span>
	      	
	      	<s:if test="%{beans.size() == 1}">
				<s:hidden id="hiddenMainContent" name="hiddenMainContent" value="%{#attr.bean.content}"/>
	      	  	<div id="editor">
				 <script>
				    document.getElementById('editor').innerHTML = document.getElementById('hiddenMainContent').value;
				 </script>
				</div>
				
				<s:iterator value="%{#attr.bean.attachmentBeans}" var="attachmentBean">
				  <s:if test="active">
					  <a href='<%=request.getContextPath() %><s:property value="#attachmentBean.location" /><s:property value="#attachmentBean.name" />'>
					  	<s:property value="#attachmentBean.name" />
					  </a>
				  </s:if>
				</s:iterator>
			</s:if>
	   	</div>
	</display:column>
</display:table>
</div>
</body>
</html>