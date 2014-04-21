<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<body>
			
<ul>
		
	<s:if test="%{menuVideos.size() > 0}">
		<s:iterator value="menuVideos">
		
			  <s:if test="active">	
			  <li>				      									
			   <s:if test="external">
			      <iframe src="<s:property value='name' />" 
			      width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen>
			      </iframe>
			   </s:if>
			   <s:else>
				   <video src="<%=request.getContextPath() %><s:property value='location' /><s:property value='name' />" controls></video>
				</s:else>
				</li>
			  </s:if>
			  
			 
		 </s:iterator>
	 </s:if>

</ul>

</body>
</html>