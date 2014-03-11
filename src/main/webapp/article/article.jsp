<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<body>

<div id="main" onmouseover="editButton()"  onmouseout="removeEditButton()">
<s:if test="%{#session.permissionMap['Ректор']}">
<a id="edittp" ><button class="btn btn-primary" onclick="edit()" type="button" value="Edit" >Edit</button></a>	
</s:if>
<div id="editor" >

</div>
<s:if test="%{#session.permissionMap['Ректор']}">
<div id="savetp" style="display:none">
<s:form cssStyle="width: 1px;height: 1px;" action="RectorSave" method="POST">
<s:hidden name="bean" value="%{bean.content}"/>
<s:submit cssClass="btn btn-primary" value="Submit" onclick="save()"/> 
</s:form>
</div>
<a id="canceltp" style="display:none" href='<s:url action="RectorArticle">
			<s:param name="id" value="#bean.id"></s:param>
			<s:param name="type" value="#bean.type"></s:param>
		</s:url>' ><button class="btn btn-link"  type="button" value="Cancel">Cancel</button></a>
</s:if>

</div>
<s:hidden id="hiddenMainContent" name="hiddenMainContent" value="%{bean.content}"/>
<div id="attachement">
</div>
<script src="../editor/ckeditor.js"></script>
<script>

    window.onload = function() {
    	document.getElementById('editor').innerHTML = document.getElementById('hiddenMainContent').value;
    	if(document.getElementById("edittp") != null)
    	document.getElementById("edittp").style.display="none";

    	   	     
    };

	function editButton () {

		if(document.getElementById("edittp") != null)
	   	document.getElementById("edittp").style.display="inline";
	   	
	}; 

	function removeEditButton () {

		if(document.getElementById("edittp") != null)
	   	document.getElementById("edittp").style.display="none";
	   	
	};   

	function edit () {

	   	document.getElementById("edittp").style.display="none";
	   	document.getElementById("main").removeAttribute("onmouseover")	;
	   	document.getElementById("main").removeAttribute("onmouseout")	;
	   	document.getElementById("savetp").style.display="inline";
		document.getElementById("canceltp").style.display="inline-block";
		editor = CKEDITOR.replace( 'editor');
	};

	function save()	{

		document.getElementById("RectorSave_bean").value=CKEDITOR.instances.editor.getData();
	};
</script>
</body>
</html>
