<%@ taglib prefix="s" uri="/struts-tags" %>
<div style="padding-top:50px;">
 <form class="pure-form" action="/search/irro/browse" method="GET">
 <s:if test="%{#session.userId == null}">
	<a style="float:right;height:19px;padding-left:5px;" href="<%=request.getContextPath() %>/loginWL" >Login</a>	
 </s:if>
 <s:else>
 	<a style="float:right;height:19px;padding-left:5px;" href="<%=request.getContextPath() %>/Logout">Log Out</a>
 </s:else>
<input style="float:right;height:19px;padding-left:0px;" src="<%=request.getContextPath() %>/images/search/search.png" border="0" alt="search" type="image" id="querySubmit"/>
<input style="float:right;height:16px;" type="search" name="q" />

</form>

</div>