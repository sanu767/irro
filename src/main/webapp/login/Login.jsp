<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
<body>
<div class="container">
      <form class="form-signin" role="form" action="<%=request.getContextPath() %>/Login" cssStyle="background : white">
        <h2 class="form-signin-heading">Please sign in</h2>
        <s:textfield name="userBean.userCode"  class="form-control" placeholder="User Code" required="True"/>
        <s:password name="userBean.password" class="form-control" placeholder="Password" required="True" />
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> Remember me
        </label>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>
    </div> 
</body>
</html>