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
	document.getElementById('editor').innerHTML = document.getElementById('bean.content').value;
}

function save()	{
	document.getElementById("SaveArticle_bean_content").value=CKEDITOR.instances.editor.getData();
};

function deActivate(attachmentName)	{
	setBeanValue();
	document.getElementById("selectedFileAttachmentName").value=attachmentName;
	document.getElementById("SaveArticle").action = "DeActivateAttachmentForSavedArticle.action";
	document.getElementById("SaveArticle").submit();
};
function activate(attachmentName)	{
	setBeanValue();
	document.getElementById("selectedFileAttachmentName").value=attachmentName;
	document.getElementById("SaveArticle").action = "ActivateAttachmentForSavedArticle.action";
	document.getElementById("SaveArticle").submit();
};

function deleteAttachment(attachmentName)	{
	setBeanValue();
	document.getElementById("selectedFileAttachmentName").value=attachmentName;
	document.getElementById("SaveArticle").action = "DeleteFileForSavedArticle.action";
	document.getElementById("SaveArticle").submit();
};

function setBeanValue()	{
	document.getElementById("bean.id").value=document.getElementById("id").value;
    document.getElementById("bean.title").value=document.getElementById("title").value;
	document.getElementById("bean.description").value=document.getElementById("description").value;
	document.getElementById("bean.content").value=CKEDITOR.instances.editor.getData();	
};

</script>
<style type="text/css">
.myClass{
 background-colour : white
}
.pagination-table {
background: none;

}
.errorDiv{
	background-color:white;
	border:1px solid black;
	width:485px;
}

.pagination-form {
margin-top : 15px;
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
	<h1 style="font-size: 18px;font-family: 'Open Sans';">Edit Article</h1>
	
	<s:if test="hasActionErrors()">
		<div class="errorDiv">
			<s:actionerror/>
		</div>
	</s:if>

	<s:form action="SaveArticle" theme="xhtml" accept-charset="UTF-8" method="post" enctype="multipart/form-data" style="backgound:white" cssClass="pagination-form">
	
	<s:hidden id="menuId" name="menuId" value="%{menuId}"/>
	<s:hidden id="parentMenuId" name="parentMenuId" value="%{parentMenuId}"/>
	<s:hidden id="id" name="bean.id" value="%{bean.id}"/>	
	<s:hidden name="bean.content" value="%{bean.content}"/>

		<sj:textfield id="title" name="bean.title" label="Title " maxlength="100"
			required="true" placeholder="Введите заголовок" />


		<sj:textarea id="description" name="bean.description" label="Short Description "
			rows="2" cols="25" placeholder="Write here..." />

			
		<div id="editor" style="margin : 50px 0px 0px 10px">
		
		</div>

		<s:if test="%{bean.attachmentBeans.size() > 0}">		
		<table class="pagination-table">
		     <thead>
		         <tr>
		             <th>Name</th>
		             <th>Delete</th>
		             <th>De Activate</th>             
		         </tr>
		     </thead>
		     <tbody>
		        <s:iterator value="bean.attachmentBeans" var="eachAttachmentBean">
						<tr>
		                    <td><s:property value="name"/></td>
							<td>
							   <s:if test="active">
							       <input type="button" value="DeActivate"  onclick='deActivate("<s:property value="name" />")' />
							   </s:if>
							   <s:else>
									<input type="button" value="Activate"  onclick='activate("<s:property value="name" />")' />
							   </s:else>
							</td>
							 <td>
							    <input type="button" value="Delete"  onclick='deleteAttachment("<s:property value="name" />")' />
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
		</s:if>
		
		<s:hidden id="selectedFileAttachmentName" name="selectedFileAttachmentName" />
		<sj:submit style="float:right;height : 25px;margin: 20px 30px 0px 0px;" button="Edit" value="Edit" onclick="save()" />
		
	</s:form>
	
	<!--  Add new files -->
	
	Add New Files
	<s:form action="UploadFileForSavedArticle" method="post" enctype="multipart/form-data" cssClass="pagination-table">
	    <s:hidden name="menuId" value="%{menuId}"/>
		<s:hidden name="parentMenuId" value="%{parentMenuId}"/>
		<s:hidden id="bean.content" name="bean.content" value="%{bean.content}"/>
		<s:hidden id="bean.title" name="bean.title" value="%{bean.title}"/>
		<s:hidden id="bean.description" name="bean.description" value="%{bean.description}"/>
		<s:hidden id="bean.id" name="bean.id" value="%{bean.id}"/>
	    <s:file name="upload" label="File"/>
	    <s:submit value="Upload File" onclick="setBeanValue()" />
	</s:form>
	
</div>
	
</body>
</html>