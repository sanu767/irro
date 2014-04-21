<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<body>
	
<ul>
	
	<s:if test="%{menuOtherDocs.size() > 0}">
		<s:iterator value="menuOtherDocs">
			  <s:if test="active">
			  <li>	
			     <s:if test="external">
				  	   <s:property value="name" />
			     </s:if>
			     <s:else>			      									
				   <a href='<%=request.getContextPath() %><s:property value="location" /><s:property value="name" />'>
				  	     <s:property value="name" />
				    </a>
				  </s:else>	
			</li>
			  </s:if>
		 </s:iterator>
	 </s:if>

</ul>

</body>
</html>
