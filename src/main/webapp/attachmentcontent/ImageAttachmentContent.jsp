<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<sj:head locale="ru" jquerytheme="lightness" jqueryui="true"/>
<link rel="stylesheet" type="text/css" href="../themes/imagegallery/css/imagegallery.css" />
<link rel="stylesheet" type="text/css" href="../themes/imagegallery/css/imagegallerycomponent.css" />

<script src="../themes/imagegallery/js/ImageView.js"></script>
<script src="../content/jquery-1.10.2.js"></script>
		

<body>
<a href='<s:url action="LoadArticles"><s:param name="menuId" value="%{menuId}"></s:param>
							<s:param name="parentMenuId" value="%{parentMenuId}"></s:param></s:url>'>
		Go Back								
</a>
	<div class="container">		
		<div class="main">
			<ul id="og-grid" class="og-grid">
				<s:if test="%{menuImages.size() > 0}">
					<s:iterator value="menuImages">
						  <s:if test="active">
						   <li>
							  <s:if test="external">
						  		
								<a href='<s:property value="name" />' 
								data-largesrc='<s:property value="name" />' data-title="IRRO" data-description="IRRO">
									<img src='<s:property value="name" />' alt="img02"/>
								</a>
					 		  </s:if>
					 		  <s:else>
										<a href='<s:url action="LoadArticles"><s:param name="menuId" value="%{menuId}"></s:param>
								<s:param name="parentMenuId" value="%{parentMenuId}"></s:param></s:url>' data-largesrc='<%=request.getContextPath() %><s:property value="location" /><s:property value="name" />' data-title="IRRO" data-description="IRRO">
											<img src='<%=request.getContextPath() %><s:property value="location" /><s:property value="name" />' alt="img02"/>
										</a>
									
							  </s:else>
							</li>
								
							</s:if>
					 </s:iterator>
				</s:if>
			</ul>
			
		</div>
	</div><!-- /container -->
	<script src="../themes/imagegallery/js/grid.js"></script>
	<script>
		$(function() {
			Grid.init();
		});
	</script>
</body>
	
</html>
