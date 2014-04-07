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

<h4 style="font-weight:bold;font-size: 18px;font-family: 'Open Sans';color : rgb(88, 103, 168);">
	<s:property value="bean.title" />
</h4>

<h1 style="font-size: 16px;font-family: 'Open Sans';">
	<s:property value="bean.description" />
</h1>


<h1 style="font-size: 18px;font-family: 'Open Sans';">
	<s:property value="bean.startDate" />
</h1>

<h1 style="font-size: 18px;font-family: 'Open Sans';">
	<s:property value="bean.endDate" />
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
