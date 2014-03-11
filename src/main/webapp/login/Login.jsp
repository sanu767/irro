<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<html>
 <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
 <link href="../bootstrap/css/signin.css" rel="stylesheet" type="text/css" />
 <script src="../content/jquery-1.10.2.js"></script>
 <script src="../bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
window.onload = function () { 
	window.location.hash = 'login';
};
</script>

<%-- Don't delete this, used for struts 2 action error
<style type="text/css">
.errorDiv{
	#background-color:white;
	#border:1px solid black;
	width:200px;
	margin-left:450px;
}
</style> 
--%>

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
	return true;
}
</script>

<body>

<%-- Don't delete this, used for struts 2 action error
<s:if test="hasActionErrors()">
	<div class="errorDiv">
		<s:actionerror/>
	</div>
</s:if> 
--%>

<div class="container">
      <form class="form-signin" role="form" action="<%=request.getContextPath() %>/Login" cssStyle="background : white" method="POST">
        <h2 class="form-signin-heading">Please sign in</h2>
        <sj:textfield id="code" name="userBean.userCode"  class="form-control" placeholder="User Code" required="True" />
        <s:password id="password" name="userBean.password" class="form-control" placeholder="Password" required="True" />
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> Remember me
        </label>
        <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="return validate();">Sign in</button>
      </form>
    </div> 
</body>
</html>