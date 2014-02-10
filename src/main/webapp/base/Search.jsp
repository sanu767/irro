<div style="padding-top:50px;">
 <form class="pure-form" action="/search/irro/browse" method="GET">
 <% if(request.getSession().getAttribute("userId") == null)  { %>
	<a style="float:right;height:19px;padding-left:0px;" href="<%=request.getContextPath() %>/registerWL" >Register</a>
	<a style="float:right;height:19px;padding-left:0px;" href="<%=request.getContextPath() %>/loginWL" >Login</a>
	<% } else { %>
	<a style="float:right;height:19px;padding-left:0px;" href="<%=request.getContextPath() %>/Logout">Log Out</a>
	<a style="float:right;height:19px;padding-left:0px;" href="<%=request.getContextPath() %>/modifyWL" >Edit your account</a>
	<% } %>
<input style="float:right;height:19px;padding-left:0px;" src="images/search/search.png" border="0" alt="search" type="image" id="querySubmit"/>
<input style="float:right;height:16px;" type="search" name="q" />

</form>

</div>