<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.commons.collections.CollectionUtils"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<sj:head locale="ru" jquerytheme="lightness" jqueryui="true" />
<script src="jquery.carouFredSel-6.0.4-packed.js" type="text/javascript"></script>

<script type="text/javascript">
	$(function() {
		$('#carousel').carouFredSel({
			width: 210,
			height: 210,
			direction: 'down',
			items: 1,
			scroll: {
				duration: 600,
				onBefore: function( data ) {
					data.items.visible.children().css( 'opacity', 0 ).delay( 200 ).fadeTo( 400, 1 );
					data.items.old.children().fadeTo( 400, 0 );
				}
			}
		});
	});
</script>
<style type="text/css">
	
	#carousel .item {
		width: 900px;
		height: 540px;
		float: left;
	}
	#carousel .item > div {
		width: 800px;
		height: 540px;
		padding: 0px;
		overflow: hidden;
	}
	#carousel .item img {
		width: 300px;
		height: 540px;
		float: left;
		box-shadow: 0 0 20px #999;
	}
	#carousel .item div.text {
		background-color: #fff;
		width:  400px;
		height: 540px;
		padding: 20px 40px;
		margin-left: 20px;
		float: left;
		position: relative;
		box-shadow: 0 0 20px #999;
	}
	#carousel .item div.text:after {
		content: " ";
		border: 10px solid transparent;
		border-right-color: #fff;
		display: block;
		width: 0;
		height: 0;
		margin-top: -10px;
		position: absolute;
		left: -20px;
		top: 50%;
	}
	
	
</style>
<body>

<% List<Long> permissions = (List<Long>)request.getSession().getAttribute("PermissionList");
Long menuId = StringUtils.isNotBlank(request.getParameter("menuId")) ? Long.parseLong(request.getParameter("menuId")) : null;
Long parentMenuId = StringUtils.isNotBlank(request.getParameter("parentMenuId")) ? Long.parseLong(request.getParameter("parentMenuId")) : null;
if(CollectionUtils.isNotEmpty(permissions) && 
		(permissions.contains(menuId) || permissions.contains(parentMenuId))) {%>
	<a id="edittp" href='<s:url action="LoadChangeAttachment">
     		<s:param name="menuId" value="%{menuId}"></s:param>
			<s:param name="parentMenuId" value="%{parentMenuId}"></s:param>
			</s:url>'>Редактировать</a>
<%}%>


<ul>

<li>
<a id="imagetp" href='<s:url action="ShowImages">
     		<s:param name="menuId" value="%{menuId}"></s:param>
			<s:param name="parentMenuId" value="%{parentMenuId}"></s:param>
			</s:url>' style="font-weight : bold ; font-color : black; font-size : 20px">Изображения</a>
			
			<div class="underline"></div>
			
			<div id="carousel">
			<s:iterator value="menuImages">
				<s:if test="active">
				<div class="item">
					<div>
					     <s:if test="external">
					     
					     <a href='<s:url action="ShowImages"><s:param name="menuId" value="%{menuId}"></s:param>
									<s:param name="parentMenuId" value="%{parentMenuId}"></s:param></s:url>'>
									<img src="<s:property value='name' />" width="300" height="300px" border="0" /></a>
									
						</s:if>
						<s:else>
						
									<a href='<s:url action="ShowImages"><s:param name="menuId" value="%{menuId}"></s:param>
									<s:param name="parentMenuId" value="%{parentMenuId}"></s:param></s:url>'>
									<img src="<%=request.getContextPath() %><s:property value='location' /><s:property value='name' />" width="300" height="300px" border="0" /></a>
								
						</s:else>
					</div>
				</div>
				</s:if>
			</s:iterator>
			</div>
			
</li>

			
	
<li>
<a id="videotp" href='<s:url action="ShowVideos">
   	<s:param name="menuId" value="%{menuId}"></s:param>
	<s:param name="parentMenuId" value="%{parentMenuId}"></s:param>
	</s:url>' style="font-weight : bold ; font-color : black; font-size : 20px">Видео</a>
	<div class="underline"></div>

	<s:if test="%{menuVideos.size() > 0}">
		<div style="border:1px solid black;width:210px;height:200px;overflow:scroll;overflow-y:scroll;overflow-x:hidden;">
			<s:iterator value="menuVideos">
				  <s:if test="active">
				    <s:if test="external">
				      <iframe src="<s:property value='name' />" 
			      					width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen>
			           </iframe>
					</s:if>
					<s:else>				      									
						<video src="<%=request.getContextPath() %><s:property value='location' /><s:property value='name' />"  
						width="180px" height="180px" controls></video>
					</s:else>					   
				  </s:if>
			 </s:iterator>
		</div>
	 </s:if>
</li>

			
<li>	
<a id="documenttp" href='<s:url action="ShowDocuments">
   	<s:param name="menuId" value="%{menuId}"></s:param>
	<s:param name="parentMenuId" value="%{parentMenuId}"></s:param>
	</s:url>' style="font-weight : bold ; font-color : black; font-size : 20px">Документы</a>
	<div class="underline"></div></li>
	<s:if test="%{menuOtherDocs.size() > 0}">
		<s:iterator value="menuOtherDocs">
			  <s:if test="active">
				  <s:if test="external">
				  		<li>
					   <a href='<s:property value='name' />'>
					   <s:property value='name' />
					   </a>
					    </li>
				  </s:if>
				  
				  <s:else>
				     <li>
					  <a href='<%=request.getContextPath() %><s:property value="location" /><s:property value="name" />'>
					  	<s:property value="displayName" />
					  </a>
					 </li>
				  </s:else>
			  </s:if>
		 </s:iterator>
	</s:if>
</ul>


</body>
</html>
