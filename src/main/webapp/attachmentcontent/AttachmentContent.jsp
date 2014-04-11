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
	<a id="edittp" href='<s:url action="LoadChangeAttachment">
     		<s:param name="menuName" value="%{menuName}"></s:param>
			<s:param name="parentMenuName" value="%{parentMenuName}"></s:param>
			</s:url>'>Edit</a>
<%}%>

<ul>
<li>
<a id="imagetp" href='<s:url action="ShowImages">
     		<s:param name="menuName" value="%{menuName}"></s:param>
			<s:param name="parentMenuName" value="%{parentMenuName}"></s:param>
			</s:url>'>Images</a></li>
			
			<s:if test="%{menuImages.size() > 0}">
				<s:iterator value="menuImages">
					  <s:if test="active">
					     <li>
							  <a href='<%=request.getContextPath() %><s:property value="location" /><s:property value="name" />'>
							  	<s:property value="name" />
							  </a>
						  </li>
					  </s:if>
				 </s:iterator>
			</s:if>
<li>
<a id="videotp" href='<s:url action="ShowVideos">
     		<s:param name="menuName" value="%{menuName}"></s:param>
			<s:param name="parentMenuName" value="%{parentMenuName}"></s:param>
			</s:url>'>Videos</a></li>
			
			<s:if test="%{menuVideos.size() > 0}">
				<s:iterator value="menuVideos">
					  <s:if test="active">
					      <li>
							  <a href='<%=request.getContextPath() %><s:property value="location" /><s:property value="name" />'>
							  	<s:property value="name" />
							  </a>
						   </li>
					  </s:if>
				 </s:iterator>
			</s:if>
<li>	
<a id="documenttp" href='<s:url action="ShowDocuments">
     		<s:param name="menuName" value="%{menuName}"></s:param>
			<s:param name="parentMenuName" value="%{parentMenuName}"></s:param>
			</s:url>'>Documents</a></li>
			
			<s:if test="%{menuOtherDocs.size() > 0}">
				<s:iterator value="menuOtherDocs">
					  <s:if test="active">
					     <li>
						  <a href='<%=request.getContextPath() %><s:property value="location" /><s:property value="name" />'>
						  	<s:property value="name" />
						  </a>
						  </li>
					  </s:if>
				 </s:iterator>
			</s:if>
</ul>	
</body>
</html>
