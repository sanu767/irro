<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<sj:head jquerytheme="lightness" jqueryui="true"/>
	<script src="../content/jquery-1.10.2.js"></script>

<style type="text/css">
.myClass{
 background-colour : white
}

.attachmentTable {
background: none;
width : 500px;
background-color:rgb(198,217,241);

}
.file-table {
background: none;
float : left;

}
</style>
</head> 

<body>
<div style="margin : 5px 0px 0px 10px">

	<h1 style="font-size: 18px;font-family: 'Open Sans';">Edit Attachment Bean</h1>
    <div>
	<s:form action="DeleteMenuAttachments" theme="xhtml" accept-charset="UTF-8" method="post" enctype="multipart/form-data" cssClass="attachmentTable">
	
		<s:hidden id="menuId" name="menuId" value="%{menuId}"/>
		<s:hidden id="parentMenuId" name="parentMenuId" value="%{parentMenuId}"/>
		<s:hidden id="id" name="attachmentContent.id" value="%{attachmentContent.id}"/>
		
			  <tr style="padding-bottom:10px">
			    <th style="font-weight:bold;font-size:14px">Select</th>
			    <th style="font-weight:bold;font-size:14px">Имя</th>
			    <th style="font-weight:bold;font-size:14px">Is Active</th>
			  </tr>
			  	 <s:if test="%{menuImages.size() > 0}">
			  		<s:iterator value="menuImages" var="eachDocument">
					  <tr>
					    <td><input type="checkbox" name="checkedId" value="${eachDocument.attachmentId}"></td>
					    <td>
				    		<a href='<%=request.getContextPath() %><s:property value="location" /><s:property value="name" />'>
							  	<s:property value="name" />
							</a>
						</td>
					    <td><s:property value="active" /></td>
					  </tr>
				   </s:iterator>
				  </s:if>
				  
				  <s:if test="%{menuVideos.size() > 0}">
			  		<s:iterator value="menuVideos" var="eachDocument">
					  <tr>
					    <td><input type="checkbox" name="checkedId" value="${eachDocument.attachmentId}"></td>
					    <td>
					    		<a href='<%=request.getContextPath() %><s:property value="location" /><s:property value="name" />'>
								  	<s:property value="name" />
								  </a>
						</td>
					    <td><s:property value="active" /></td>
					  </tr>
				   </s:iterator>
				  </s:if>
				  
				  <s:if test="%{menuOtherDocs.size() > 0}">
			  		<s:iterator value="menuOtherDocs" var="eachDocument">
					  <tr>
					    <td><input type="checkbox" name="checkedId" value="${eachDocument.attachmentId}"></td>
					    <td>
			    		<a href='<%=request.getContextPath() %><s:property value="location" /><s:property value="name" />'>
						  	<s:property value="name" />
						  </a>
						</td>
					    <td><s:property value="active" /></td>
					  </tr>
				   </s:iterator>
				  </s:if>
		  
		  
		<input type="submit" value="активировать" onclick="form.action='ActivateMenuAttachments';">
		<input type="submit" value="Деактивировать" onclick="form.action='DeActivateMenuAttachments';">
		<input type="submit" button="Delete" value="Удалить" />
		
	</s:form>
	</div>
	<!--  Add new files -->
	
	
	<div style="margin-top : 100px;width : 100px">
	Add New Files
	<form id="UploadAttachments" name="UploadAttachments" action="UploadAttachments" method="post" enctype="multipart/form-data">
<table class="wwFormTable">
	    <s:hidden id="menuId" name="menuId" value="%{menuId}"/>
		<s:hidden id="parentMenuId" name="parentMenuId" value="%{parentMenuId}"/>
		<s:hidden id="id" name="attachmentContent.id" value="%{attachmentContent.id}"/>
		
		<th>
		<td style="font-weight:bold">Local File</td>
		<td style="font-weight:bold">Youtube/Vimeo/Mail.RU</td>
        </th>
		
	    <tr>
		<td class="tdLabel"><label for="UploadAttachments_upload" class="label">File:</label></td>
		<td><input type="file" name="upload" size="40" value="[]" id="UploadAttachments_upload"/></td>
		<td><input type="text" name="externalUrl" size="40" id="UploadAttachments_externalUrl"/></td>
        </tr>

	    <tr>
		<td class="tdLabel"><label for="UploadAttachments_upload" class="label">File:</label></td>
		<td><input type="file" name="upload" size="40" value="[]" id="UploadAttachments_upload"/></td>
		<td><input type="text" name="externalUrl" size="40" id="UploadAttachments_externalUrl"/></td>
        </tr>
		<tr>
		<td class="tdLabel"><label for="UploadAttachments_upload" class="label">File:</label></td>
		<td><input type="file" name="upload" size="40" value="[]" id="UploadAttachments_upload"/></td>
		<td><input type="text" name="externalUrl" size="40" id="UploadAttachments_externalUrl"/></td>
        </tr>
		<tr>
		<td class="tdLabel"><label for="UploadAttachments_upload" class="label">File:</label></td>
		<td><input type="file" name="upload" size="40" value="[]" id="UploadAttachments_upload"/></td>
		<td><input type="text" name="externalUrl" size="40" id="UploadAttachments_externalUrl"/></td>
        </tr>
		<tr>
		<td class="tdLabel"><label for="UploadAttachments_upload" class="label">File:</label></td>
		<td><input type="file" name="upload" size="40" value="[]" id="UploadAttachments_upload"/></td>
		<td><input type="text" name="externalUrl" size="40" id="UploadAttachments_externalUrl"/></td>
        </tr>

	    <tr>
    <td colspan="3"><div align="right"><input type="submit" id="UploadAttachments_0" value="Загрузить файл" onclick="setBeanValue()"/>
</div></td>
</tr>
	</table>
	
	</form>
	</div>
	
	
	
</div>
	
</body>
</html>