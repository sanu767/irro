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
<% List<String> permissions = (List<String>)request.getSession().getAttribute("PermissionList");
String menuName = request.getParameter("menuName");
String parentMenuName = request.getParameter("parentMenuName");
if(CollectionUtils.isNotEmpty(permissions) && 
		(permissions.contains(menuName) || permissions.contains(parentMenuName))) {%>
	<a id="add" href='<s:url action="AddArticle"><s:param name="menuName" value="%{menuName}"></s:param>
			<s:param name="parentMenuName" value="%{parentMenuName}"></s:param></s:url>'>
				<button class="btn btn-primary" type="button" value="Add New" >Add New</button>
	</a>
<%}%>
<display:table name="beans" defaultsort="2" pagesize="5" sort="list" requestURI="" uid="bean" id="bean" class="pagination-table">
	<display:column>
		<div class="result-document">
		<h4>
	      <a href='<s:url action="LoadSelectedArticle">
	     		<s:param name="menuName" value="%{menuName}"></s:param>
				<s:param name="parentMenuName" value="%{parentMenuName}"></s:param>
				<s:param name="id" value="%{#attr.bean.id}"></s:param></s:url>'>
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

<s:if test="%{#parameters.menuName[0]	== 'MainContacts' || 
#parameters.menuName[0]	== 'MainContacts' }">
	<jsp:include page="/content/MainContacts.jsp"></jsp:include>
</s:if>

<s:else>

</s:else>

</body>
</html>