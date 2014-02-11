<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
  <h1>Registration Failed.</h1>
<br>User code or email already exists <br>
<br>Edit again
  <a href="<%=request.getContextPath() %>/modifyWL" >Edit</a> 
<br>
or 
<a href="<s:url action="welcomeIrro"/>">Go Back</a>
</html>