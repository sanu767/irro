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
.pagination-table {
background: none;

}
</style>
</head> 

<body cssClass="myClass">
<div style="margin : 5px 0px 0px 10px" class="pagination-table">
	<h1 style="font-size: 18px;font-family: 'Open Sans';">Edit Attachment Bean</h1>

	<s:form action="DeleteMenuAttachments" theme="xhtml" accept-charset="UTF-8" method="post" enctype="multipart/form-data" style="backgound:white" cssClass="pagination-table">
	
		<s:hidden id="menuName" name="menuName" value="%{menuName}"/>
		<s:hidden id="parentMenuName" name="parentMenuName" value="%{parentMenuName}"/>
		<s:hidden id="id" name="attachmentContent.id" value="%{attachmentContent.id}"/>
		<table style="width:1000px">
			  <tr style="padding-bottom:10px">
			    <th style="font-weight:bold;font-size:14px">Select</th>
			    <th style="font-weight:bold;font-size:14px">Name</th>
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
		  </table>
		  
		<input type="submit" value="Activate" onclick="form.action='ActivateMenuAttachments';">
		<input type="submit" value="DeActivate" onclick="form.action='DeActivateMenuAttachments';">
		<sj:submit style="float:right;height : 25px;margin: 20px 30px 0px 0px;" button="Delete" value="Delete" />
		
	</s:form>
	
	<!--  Add new files -->
	
	Add New Files
	<s:form action="UploadAttachments" method="post" enctype="multipart/form-data" cssClass="pagination-table">
	    <s:hidden name="menuName" value="%{menuName}"/>
		<s:hidden name="parentMenuName" value="%{parentMenuName}"/>
		<s:hidden id="attachmentContent.id" name="attachmentContent.id" value="%{attachmentContent.id}"/>
	    <s:file name="upload" label="File" size="40" />
	    <s:a onlick="removeRow()" >Remove</s:a>
	    <s:file name="upload" label="File" size="40" />
	    <s:a onlick="removeRow()" >Remove</s:a>
	    <s:file name="upload" label="File" size="40" />
	    <s:a onlick="removeRow()" >Remove</s:a>
	    <s:file name="upload" label="File" size="40" />
	    <s:a onlick="removeRow()" >Remove</s:a>
	    <s:file name="upload" label="File" size="40" />
	    <s:a onlick="removeRow()" >Remove</s:a>
	    <tr>
		    <td class="tdLabel"><label for="UploadAttachmentContentFile_upload" class="label">File:</label></td>
		    <td><input type="file" name="upload" size="40" value="" id="UploadAttachmentContentFile_upload"/></td>
		</tr>
	    <s:submit value="Upload File" onclick="setBeanValue()" />
	    
	</s:form>
	
</div>
	
</body>
</html>