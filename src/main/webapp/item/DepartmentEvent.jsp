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
}

function validateDate()
{
	var start = document.getElementById('startDate').value;
	var end = document.getElementById('endDate').value; 
	
	var sdate = new Date(start);
	var edate = new Date(end);
	
	if(sdate > edate)
    {
        alert('Start date should be less than End date');
        return false; 
    }
	document.getElementById("CreateEvent_itemBean_content").value=CKEDITOR.instances.editor.getData();
	return true;
}

</script>

</head> 

<body>

<%
String path = request.getContextPath();
String basePath = null;
if(path != null) {
	basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
} else {
	basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
}
%>


<div style="margin : 5px 0px 0px 10px">
	<h1 style="font-size: 18px;font-family: 'Open Sans';">Create Event</h1>

	<s:form action="CreateEvent" theme="xhtml" accept-charset="UTF-8" method="post" enctype="multipart/form-data">
        <s:hidden name="itemBean.content" value="%{itemBean.content}"/>
		<sj:textfield name="itemBean.title" label="Title " maxlength="100"
			required="true" placeholder="Enter title" />

		<sj:datepicker id="startDate"  name="itemBean.startDate" label="Start date " changeYear="true" changeMonth="true" showOn="focus"/>

		<sj:datepicker id="endDate" name="itemBean.endDate" label="Last date " changeYear="true" changeMonth="true" showOn="focus"/>

		<sj:textarea name="itemBean.description" label="Short Description "
			rows="2" cols="25" placeholder="Write here..." />

			
		<div id="editor" style="margin : 50px 0px 0px 10px">
		
		</div>

		<s:checkbox name="itemBean.sliderSelected" label="Show in slider " />
		
		<s:file name="uploadSlider" label="Slider Image" key="file" />
		
		<s:if test="%{itemBean.attachmentBeans.isEmpty()}">
			<table class="pagination-table">
			     <thead>
			         <tr>
			             <th>Name</th>
			             <th>Delete</th>
			             <th>De Activate</th>             
			         </tr>
			     </thead>
			     <tbody>
			         <s:iterator value="itemBean.attachmentBeans">
			                 <tr>
			                     <td><s:property value="name"/></td>
			                     <td>
				                    <s:url id="editUrl" action="ChangeFileActivation">
							      		<s:param name="deleteFileId" value="id" />
							    	</s:url>
								    	 <!-- In client just play around the text we show below..
								    	 If Active true show Activate else Deactivate..
								    	 In server I am checking if activated in DB, I deactivate and vice versa -->
								    	 <s:if test="active">
								    	 <s:a href="DeActivateAttachment">
								    	 	DeActivate
								    	 </s:a>
								    	 </s:if>
								    	 <s:else>Activate
								    	 <s:a href="ActivateAttachment">
								    	 	Activate
								    	 </s:a>
								    	 </s:else>
								 </td>
								 <td>
								    <s:url id="editUrl" action="DeleteFile">
							      		<s:param name="id" value="id" />
							    	</s:url>
								    <s:a href="%{editUrl}">
								         Delete
								    </s:a>
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
		
		<s:checkbox id="itemBean.showInHomePage" name="itemBean.showInHomePage" label="Show in Home Page " />
		
		<s:hidden id="selectedFileAttachmentId" name="selectedFileAttachmentId" />

		<sj:submit style="float:right;height : 25px;margin: 20px 30px 0px 0px;" button="Create" value="Create"  onclick="return validateDate();"/>
		
	</s:form>
	
	Add New Files
	<s:form action="UploadEventFile" method="post" enctype="multipart/form-data" cssClass="pagination-table">
	    <s:hidden name="itemBean.files" value="%{itemBean.files}"/>
	    <s:hidden id="itemBean.content" name="itemBean.content" value="%{itemBean.content}"/>
		<s:hidden id="itemBean.title" name="itemBean.title" value="%{itemBean.title}"/>
		<s:hidden id="itemBean.description" name="itemBean.description" value="%{itemBean.description}"/>
		<s:hidden id="itemBean.startDate" name="itemBean.startDate" value="%{itemBean.startDate}"/>
		<s:hidden id="itemBean.endDate" name="itemBean.endDate" value="%{itemBean.endDate}"/>
		<s:hidden id="itemBean.showInHomePage" name="itemBean.showInHomePage" value="%{itemBean.showInHomePage}"/>
	    <s:file name="upload" label="File"/>
	    <s:submit value="Upload File" onclick="setBeanValue()" />
	</s:form>
</div>
	
</body>
</html>