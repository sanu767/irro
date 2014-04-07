<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<body>
<%
String path = request.getContextPath();
String basePath = null;
if(path != null) {
	basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
} else {
	basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
}
%>

<div id="main" onmouseover="editButton()"  onmouseout="removeEditButton()">
<a id="edittp" href='<s:url action="EditArticle">
     		<s:param name="id" value="%{attachmentContent.id}"></s:param>
     		<s:param name="menuName" value="%{menuName}"></s:param>
			<s:param name="parentMenuName" value="%{parentMenuName}"></s:param>
			</s:url>'>Edit</a>

	<div id="editor">

	</div>

	 <s:iterator value="attachmentContent.attachmentBeans">
	  <s:if test="active">
	  <a href='<%=request.getContextPath() %><s:property value="location" /><s:property value="name" />'>
	  	<s:property value="name" />
	  </a>
	  </s:if>
	 </s:iterator>

</div>

<s:hidden id="hiddenMainContent" name="hiddenMainContent" value="%{attachmentContent.content}"/>


<script src="../editor/ckeditor.js"></script>
<script>
	
window.onload = function() {
	document.getElementById('editor').innerHTML = document.getElementById('hiddenMainContent').value;
};
</script>
</body>
</html>
