<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<body>
<div>
	<s:textarea label="Title"></s:textarea>
</div>
<div id="editor" >
</div>
<div></div>
<s:form cssStyle="width: 1px;height: 1px;" action="RectorSave" method="POST">
<s:hidden name="content.mainContent" value="%{content.mainContent}"/>
<s:submit cssClass="btn btn-primary" value="Save" onclick="save()"/> 
</s:form>
<a id="canceltp"  href="Rector" ><button class="btn btn-link"  type="button" value="Cancel">Cancel</button></a>
<script src="../editor/ckeditor.js"></script>

<div id="attachement" >
</div>
<script>
    window.onload = function() {
		editor = CKEDITOR.appendTo( 'editor', config, html );
    };

	function save()	{
		document.getElementById("RectorSave_content_mainContent").value=CKEDITOR.instances.editor.getData();
	};
</script>
</body>
</html>
