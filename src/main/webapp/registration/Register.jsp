<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<html>
<script type="text/javascript">
window.onload = function () { 
	window.location.hash = 'registration';
};
</script>

<script type="text/javascript">
function validate()
{
	var code = document.getElementById('code').value; 
    if(!code.match(/\S/)) {
        alert ('Enter user code');
		document.myForm.code.focus() ;
        return false;
    } 
	
	var password = document.getElementById('password').value; 
	if(!password.match(/\S/)) {
        alert ('Enter password');
        return false;
    } 
	
	var name = document.getElementById('name').value; 
    if(!name.match(/\S/)) {
        alert ('Enter user name');
		document.myForm.name.focus() ;
        return false;
    } 
	
	var mail=document.getElementById('mail').value; 
    var atpos=mail.indexOf("@");
    var dotpos=mail.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=mail.length)
    {
      alert('Not a valid e-mail address');
      return false;
    }
	return true;
}
</script>

<body>
<div id="registration">
 <s:form cssClass="registrationwrap" method="POST" id="register-form" action="Registration" cssStyle="background : white">
 	<p><s:label>User Registration</s:label></p>
 	<sj:textfield name="userBean.userCode" label="Code" size="40" required="true"  id="code"/>
 	<s:password name="userBean.password" label="Password" size="40" required="true" id="password"/>
    <sj:textfield name="userBean.userName" label="Name" size="40" required="true" id="name"/> 
    <sj:textfield name="userBean.userSurname" label="Sur Name" size="40"/>    
    <sj:textfield name="userBean.email" label="Email" size="60" required="true" placeholder="username@domain.com" id="mail"/>
    <sj:textfield name="userBean.address" label="Address" size="60" />
    <s:checkbox id="superAdmin" name="userBean.superAdmin" label="Super Admin" />
    <s:select multiple="true" label="Choose Article permission" list="allPermissions" name="userBean.selectedPermissions"></s:select>
    <s:submit value="Register" onclick="return validate();"/>
 </s:form>
 </div>
 </body>
 </html>