<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<sj:head locale="ru" jquerytheme="lightness" jqueryui="true"/>
	<style type="text/css">
	.errors {
		background-color:#FFCCCC;
		border:1px solid #CC0000;
		width:400px;
		margin-bottom:8px;
	}
	.errors li{
		list-style: none;
	}
    </style>
</head> 

<body>

<table>
     <thead>
         <tr>
             <th>Name</th>
             <th>Delete</th>
             <th>De Activate</th>             
         </tr>
     </thead>
     <tbody>
         <s:iterator value="eventFiles">
                 <tr>
                     <td><s:property value="fileName"/></td>
                     <td>
	                    <s:url id="editUrl" action="ChangeFileActivation">
				      		<s:param name="deleteFileId" value="id" />
				    	</s:url>
					    <s:a href="%{editUrl}">
					    	 <!-- In client just play around the text we show below..
					    	 If Active true show Activate else Deactivate..
					    	 In server I am checking if activated in DB, I deactivate and vice versa -->
					    	 <s:if test="active">DeActivate</s:if>
					    	 <s:else>Activate</s:else>
					    </s:a>
					 </td>
					 <td>
					    <s:url id="editUrl" action="DeleteFile">
				      		<s:param name="deleteFileId" value="id" />
				    	</s:url>
					    <s:a href="%{editUrl}">
					         Delete
					    </s:a>
					 </td>
                 </tr>
                 <tr>
	                 <td>
	                 	URL : <s:property value="location"/> <s:property value="fileName"/>
	                 </td>
                 </tr>                 
         </s:iterator>
     </tbody>
</table>

<!--  Add new files -->
Add New Files
<s:form action="UploadEventFile" method="post" enctype="multipart/form-data">
    <s:file name="upload" label="File"/>
    <s:submit/>
</s:form>
	
</body>
</html>