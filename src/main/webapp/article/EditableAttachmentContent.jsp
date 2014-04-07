<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<sj:head jquerytheme="lightness" jqueryui="true"/>
<script src="../editor/ckeditor.js"></script>
<script type="text/javascript">

window.onload = function() {    
   	editor = CKEDITOR.replace( 'editor');
	document.getElementById('editor').innerHTML = document.getElementById('attachmentContent.content').value;
}

function save()	{
	document.getElementById("SaveAttachmentContent_attachmentContent_content").value=CKEDITOR.instances.editor.getData();
};

function deActivate(attachmentId)	{
	setBeanValue();
	document.getElementById("selectedFileAttachmentId").value=attachmentId;
	document.getElementById("SaveAttachmentContent").action = "DeActivateAttachmentContent.action";
	document.getElementById("SaveAttachmentContent").submit();
};
function activate(attachmentId)	{
	setBeanValue();
	document.getElementById("selectedFileAttachmentId").value=attachmentId;
	document.getElementById("SaveAttachmentContent").action = "ActivateAttachmentContent.action";
	document.getElementById("SaveAttachmentContent").submit();
};

function deleteAttachment(attachmentId)	{
	setBeanValue();
	document.getElementById("selectedFileAttachmentId").value=attachmentId;
	document.getElementById("SaveAttachmentContent").action = "DeleteAttachmentContentFile.action";
	document.getElementById("SaveAttachmentContent").submit();
};

function setBeanValue()	{
	document.getElementById("attachmentContent.id").value=document.getElementById("id").value;
	document.getElementById("attachmentContent.content").value=CKEDITOR.instances.editor.getData();
};


</script>
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
<%
String path = request.getContextPath();
String basePath = null;
if(path != null) {
	basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
} else {
	basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
}
%>
<div style="margin : 5px 0px 0px 10px" class="pagination-table">
	<h1 style="font-size: 18px;font-family: 'Open Sans';">Edit Attachment Bean</h1>

	<s:form action="SaveNews" theme="xhtml" accept-charset="UTF-8" method="post" enctype="multipart/form-data" style="backgound:white" cssClass="pagination-table">
	
	<s:hidden id="menuName" name="menuName" value="%{menuName}"/>
	<s:hidden id="parentMenuName" name="parentMenuName" value="%{parentMenuName}"/>
	<s:hidden id="id" name="attachmentContent.id" value="%{attachmentContent.id}"/>	
	<s:hidden name="attachmentContent.content" value="%{attachmentContent.content}"/>

		<div id="editor" style="margin : 50px 0px 0px 10px">
		
		</div>

		<table class="pagination-table">
		     <thead>
		         <tr>
		             <th>Name</th>
		             <th>Delete</th>
		             <th>De Activate</th>             
		         </tr>
		     </thead>
		     <tbody>
		        <s:iterator value="attachmentContent.attachmentBeans" var="eachAttachmentBean">
						<tr>
		                    <td><s:property value="name"/></td>
							<td>
							   <s:if test="active">
							       <input type="button" value="DeActivate"  onclick='deActivate(<s:property value="attachmentId" />)' />
							   </s:if>
							   <s:else>
									<input type="button" value="Activate"  onclick='activate(<s:property value="attachmentId" />)' />
							   </s:else>
							</td>
							 <td>
							    <input type="button" value="Delete"  onclick='deleteAttachment(<s:property value="attachmentId" />)' />
							 </td>
		                 </tr>
						 <tr>
			                 <td>
			                 	URL : <%=basePath%><s:property value="location" /><s:property value="name" />
			                 </td>
		                 </tr>
				</s:iterator>
		     </tbody>
		</table>
		
		<s:hidden id="selectedFileAttachmentId" name="selectedFileAttachmentId" />
		<sj:submit style="float:right;height : 25px;margin: 20px 30px 0px 0px;" button="Edit" value="Edit" onclick="save()" />
		
	</s:form>
	
	<!--  Add new files -->
	
	Add New Files
	<s:form action="UploadAttachmentContentFile" method="post" enctype="multipart/form-data" cssClass="pagination-table">
	    <s:hidden name="menuName" value="%{menuName}"/>
		<s:hidden name="parentMenuName" value="%{parentMenuName}"/>
		<s:hidden id="attachmentContent.content" name="attachmentContent.content" value="%{attachmentContent.content}"/>
		<s:hidden id="attachmentContent.id" name="attachmentContent.id" value="%{attachmentContent.id}"/>
	    <s:file name="upload" label="File"/>
	    <s:submit value="Upload File" onclick="setBeanValue()" />
	</s:form>
	
</div>
	
</body>
</html>