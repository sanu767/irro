<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<body>
<s:if test="%{#session.permissionMap['Ректор']}">
  <a id="edittp" ><button class="btn btn-primary" type="button" value="Edit" onclick="edit()">Edit</button></a>
</s:if>
<div id="savetp" >
<s:form cssStyle="width:1px;height: 1px;" action="RectorSave" method="POST">
<s:hidden name="content.mainContent" value="%{content.mainContent}"/>
<s:submit cssClass="btn btn-primary" value="Submit" onclick="save()"/> 
</s:form>
</div>
<s:if test="%{#session.permissionMap['Ректор']}">
<a id="canceltp" href="Rector" ><button class="btn btn-link" type="button" value="Cancel">Cancel</button></a>
</s:if>

<div id="editor" >
</div>


<s:if test="%{#session.permissionMap['Ректор']}">
<a id="editbtm"><button class="btn btn-primary" type="button" value="Edit" onclick="edit()">Edit</button></a>
</s:if>
<div id="savebtm" >
<s:form cssStyle="width: 1px;height: 1px;" action="RectorSave" method="POST">
<!-- <s:hidden name="content.mainContent" value="%{content.mainContent}"/> -->
<s:submit cssClass="btn btn-primary" value="Submit" onclick="save()"/> 
</s:form>
</div>
<s:if test="%{#session.permissionMap['Ректор']}">
<a id="cancelbtm" href="Rector" ><button class="btn btn-link" type="button" value="Cancel">Cancel</button></a>
</s:if>
<s:hidden id="hiddenMainContent" name="hiddenMainContent" value="%{content.mainContent}"/>
<script src="../editor/ckeditor.js"></script>
<link href="../editor/sample.css" rel="stylesheet"/>
<script>

    window.onload = function() {
    	document.getElementById('editor').innerHTML = document.getElementById('hiddenMainContent').value;
    	document.getElementById("savetp").style.display="none";
    	document.getElementById("canceltp").style.display="none";
    	document.getElementById("savebtm").style.display="none";
    	document.getElementById("cancelbtm").style.display="none";
      
    };

	function edit () {
	   	document.getElementById("edittp").style.display="none";
	   	document.getElementById("editbtm").style.display="none";
		document.getElementById("savetp").style.display="inline";
		document.getElementById("canceltp").style.display="inline-block";
		document.getElementById("savebtm").style.display="inline";
		document.getElementById("cancelbtm").style.display="inline-block";
		CKEDITOR.replace( 'editor' );

	};

	function save()	{
		document.getElementById("RectorSave_content_mainContent").value=CKEDITOR.instances.editor.getData();
	};
</script>
</body>
</html>
