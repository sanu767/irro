<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<sj:head locale="ru" jquerytheme="lightness" jqueryui="true"/>
<script type="text/javascript">
window.onload = function() {
	document.getElementById('__multiselect_userBean.selectedPermissions').value = "MyGroup";
};
</script>

</head>

<body>

<s:form action="EditUser" theme="xhtml" accept-charset="UTF-8">	   
		<p><s:label>User Modification</s:label></p>
		    <s:hidden id="userBean.id" name="userBean.id" value="%{userBean.id}"/>
		 	<sj:textfield name="userBean.userCode" id="userBean.userCode" label="Code" size="40" />
		    <sj:textfield name="userBean.userName" id="userBean.userName" label="Name" size="40" /> 
		    <sj:textfield name="userBean.userSurname" id="userBean.userSurname" label="Sur Name" size="40" />    
		    <sj:textfield name="userBean.email" id="userBean.email" label="Email" size="60" />
		    <sj:textfield name="userBean.address" id="userBean.address" label="Address" size="60" />
		    <s:select multiple="true" name="userBean.selectedPermissions" label="Choose Article permission" value="userBean.selectedPermissions" list="allPermissions">
		    </s:select>
		    
		    <s:submit value="Edit" label="Edit"/>
	</s:form>
	
</body>
</html>