<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<sj:head locale="ru" jquerytheme="lightness" jqueryui="true"/>
<script src="../editor/ckeditor.js"></script>
<script type="text/javascript">

window.onload = function() {    
   	editor = CKEDITOR.replace( 'editor');
	document.getElementById('editor').innerHTML = document.getElementById('bean.content').value;
}

function save()	{
	document.getElementById("CreateEvent_bean_content").value=CKEDITOR.instances.editor.getData();
};

function deActivate(attachmentName)	{
    setBeanValue();
	document.getElementById("selectedFileAttachmentName").value=attachmentName;
	document.getElementById("CreateEvent").action = "DeActivateEventAttachment.action";
	document.getElementById("CreateEvent").submit();
};
function activate(attachmentName)	{
    setBeanValue();
	document.getElementById("selectedFileAttachmentName").value=attachmentName;
	document.getElementById("CreateEvent").action = "ActivateEventAttachment.action";
	document.getElementById("CreateEvent").submit();
};

function deleteAttachment(attachmentName)	{
    setBeanValue();
	document.getElementById("selectedFileAttachmentName").value=attachmentName;
	document.getElementById("CreateEvent").action = "DeleteEventFile.action";
	document.getElementById("CreateEvent").submit();
};

function setBeanValue()	{

	document.getElementById("bean.title").value=document.getElementById("title").value;
	document.getElementById("bean.description").value=document.getElementById("description").value;
	document.getElementById("bean.content").value=CKEDITOR.instances.editor.getData();
	
	document.getElementById("bean.startDate").value=document.getElementById("startDate").value;
	document.getElementById("bean.endDate").value=document.getElementById("endDate").value;
	document.getElementById("bean.showInHomePage").value=document.getElementById("showInHomePage").value;
	
};

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
	
	document.getElementById("CreateEvent_bean_content").value=CKEDITOR.instances.editor.getData();
	return true;
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
	<h1 style="font-size: 18px;font-family: 'Open Sans';">Создать событие подразделения</h1>

	<s:if test="hasActionErrors()">
			<div class="errorDiv">
				<s:actionerror/>
			</div>
	</s:if>
	
	<s:form action="CreateEvent" theme="xhtml" accept-charset="UTF-8" method="post" enctype="multipart/form-data" style="backgound:white" cssClass="pagination-table">
	<s:hidden id="menuId" name="menuId" value="%{menuId}"/>
	<s:hidden id="parentMenuId" name="parentMenuId" value="%{parentMenuId}"/>
	
	<s:hidden name="bean.content" value="%{bean.content}"/>
	
	
	<sj:textfield id="title" name="bean.title" label="Title " maxlength="100"
			required="true" placeholder="Введите заголовок" />


		<sj:textarea id="description" name="bean.description" label="Short Description "
			rows="2" cols="25" placeholder="Write here..." />

			
		<div id="editor" style="margin : 50px 0px 0px 10px">
		
		</div>
		
		
		<sj:datepicker displayFormat="mm/dd/yy" id="startDate" name="bean.startDate" label="Start date " changeYear="true" changeMonth="true" showOn="focus"/>

		<sj:datepicker displayFormat="mm/dd/yy" id="endDate" name="bean.endDate" label="Last date " changeYear="true" changeMonth="true" showOn="focus"/>
		
		
		<s:checkbox id="sliderSelected" name="bean.sliderSelected" label="Show in slider " />
		
		<s:file name="uploadSlider" label="Slider Image" />
		
		<s:checkbox id="showInHomePage" name="bean.showInHomePage" label="Show in Home Page " />
		
		<table class="pagination-table">
		     <thead>
		         <tr>
		             <th>Name</th>
		             <th>Change Activation</th>
		             <th>Delete</th>             
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
		
		<s:hidden id="selectedFileAttachmentName" name="selectedFileAttachmentName" />
		
		<sj:submit style="float:right;height : 25px;margin: 20px 30px 0px 0px;" button="Create" value="Create" onclick="save()" />
		
	</s:form>
	
	<!--  Add new files -->
	
	Add New Files
	<s:form action="UploadEventFile" method="post" enctype="multipart/form-data" cssClass="pagination-table">
	<s:hidden id="menuId" name="menuId" value="%{menuId}"/>
	<s:hidden id="parentMenuId" name="parentMenuId" value="%{parentMenuId}"/>
		<s:hidden id="bean.content" name="bean.content" value="%{bean.content}"/>
		<s:hidden id="bean.title" name="bean.title" value="%{bean.title}"/>
		<s:hidden id="bean.description" name="bean.description" value="%{bean.description}"/>
		<s:hidden id="bean.startDate" name="bean.startDate" value="%{bean.startDate}"/>
		<s:hidden id="bean.endDate" name="bean.endDate" value="%{bean.endDate}"/>
		<s:hidden id="bean.showInHomePage" name="bean.showInHomePage" value="%{bean.showInHomePage}"/>
		<s:file name="upload" label="File"/>
	    <s:submit value="Upload File" onclick="setBeanValue()" />
	</s:form>
	
</div>
	
</body>
</html>

