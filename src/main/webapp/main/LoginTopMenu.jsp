<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="blue">
	<div id="slatenav">
<jsp:include page="/main/MainTopMenu.jsp"/>
<ul>
	 <li><a href='#'><span>My Profile</span></a></li>
	<li><p>Welcome&#160;&#160;&#160;<s:property value="userID"/></p></li>
    <li><a href="<s:url action="logout"/>">Logout</a></li>
</ul>
</div>
</div>