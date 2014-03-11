<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<body>

<div id="editor" >
</div>
<div></div>
<%-- <s:if test="%{#session.permissionMap['Ректор']}"> --%>
<a id="edittp" ><button class="btn btn-primary" type="button" value="Edit" onclick="edit()">Edit</button></a>
<div id="savetp" style="display:none">
<s:form cssStyle="width: 1px;height: 1px;" action="RectorSave" method="POST">
<s:hidden name="bean" value="%{bean.content}"/>
<s:submit cssClass="btn btn-primary" value="Submit" onclick="save()"/> 
</s:form>
</div>
<a id="canceltp" style="display:none" href="Rector" ><button class="btn btn-link"  type="button" value="Cancel">Cancel</button></a>
<%-- </s:if> --%>
<s:hidden id="hiddenMainContent" name="hiddenMainContent" value="%{bean.content}"/>
<div id="attachement">
</div>
<script src="../editor/ckeditor.js"></script>
<script>

    window.onload = function() {
    	document.getElementById('editor').innerHTML = document.getElementById('hiddenMainContent').value;

    	   	     
    };

	function edit () {

	   	document.getElementById("edittp").style.display="none";
	   	document.getElementById("savetp").style.display="inline";
		document.getElementById("canceltp").style.display="inline-block";
		editor = CKEDITOR.replace( 'editor');
	};

	function save()	{

		document.getElementById("RectorSave_content_mainContent").value=CKEDITOR.instances.editor.getData();
	};
</script>
</body>
</html>
