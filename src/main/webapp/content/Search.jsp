<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div style="padding-top:50px;">
 <form class="pure-form" action="/eduSearch" method="GET" onsubmit="return false;">
 <s:if test="%{#session.userId == null}">
	<a style="float:right;height:19px;padding-left:5px;" href="<%=request.getContextPath() %>/loginWL" >Вход</a>	
 </s:if>
 <s:else>
 	<a style="float:right;height:19px;padding-left:5px;" href="<%=request.getContextPath() %>/Logout">Выход</a>
 </s:else>
<input style="float:right;height:19px;padding-left:0px;" src="<%=request.getContextPath() %>/images/search/search.png" border="0" alt="search" type="image" id="querySubmit" onclick="window.location.href=this.form.action +'#/search/q='+ this.form.q.value;"/>
<input style="float:right;height:19px;font-size : 10px;" type="search" name="q" />

</form>

</div>