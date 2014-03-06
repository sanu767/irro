<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<body>
<s:if test="%{#session.permissionMap['Кафедра философии и управления образованием']}">
  <a id="edittp" ><button class="btn btn-primary" type="button" value="Edit" onclick="edit()">Edit</button></a>
  </s:if>
<div id="savetp" >
<s:form cssStyle="width:1px;height: 1px;" action="DepartmentsPhilosophyConstitutionSave" method="POST">
	<s:hidden name="departmentBean.constitution" value="%{departmentBean.constitution}"/>
<s:submit cssClass="btn btn-primary" value="Submit" onclick="save()"/> 
</s:form>
</div>
<s:if test="%{#session.permissionMap['Кафедра философии и управления образованием']}">
<a id="canceltp" href="DepartmentsPhilosophyConstitution" ><button class="btn btn-link" type="button" value="Cancel">Cancel</button></a>
</s:if>

<div id="editor" >
</div>
	<s:hidden id="hiddenMainContent" name="hiddenMainContent" value="%{departmentBean.constitution}"/>
<script src="../editor/ckeditor.js"></script>
<link href="../editor/sample.css" rel="stylesheet"/>
<script>

	window.onload = function() {
		document.getElementById('editor').innerHTML = document.getElementById('hiddenMainContent').value;
		document.getElementById("savetp").style.display="none";
		document.getElementById("canceltp").style.display="none";      
	};
	
	function edit () {
	   	document.getElementById("edittp").style.display="none";
		document.getElementById("savetp").style.display="inline";
		document.getElementById("canceltp").style.display="inline-block";
		CKEDITOR.replace( 'editor' );
	
	};
	
	function save()	{
		document.getElementById("DepartmentsPhilosophyConstitutionSave_departmentBean_constitution").value=CKEDITOR.instances.editor.getData();
	};
</script>
</body>
</html>