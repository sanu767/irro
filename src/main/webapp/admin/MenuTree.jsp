<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjt" uri="/struts-jquery-tree-tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<sj:head jquerytheme="lightness" jqueryui="true"/>
	
<script src="content/jquery-1.10.2.js"></script>

<script type="text/javascript">

function DeleteTreeNode(obj) {
   var isDelete = confirm("Are you want to delete");
   if(isDelete == true) {
      document.getElementById("ChangeMenu").action = "DeleteMenu.action?selectedMenuId="+obj;
      document.getElementById("ChangeMenu").submit();
   }
}

function CreateChildrenMenu(obj) {
var url = "CreateChildrenMenu.jsp?selectedMenuId=";
url = url+obj;
window.open(url, "_blank","toolbar=yes, scrollbars=yes, resizable=yes, top=100, left=300, width=400, height=250");
}

function RenameMenu(obj) {
	var url = "RenameMenu.jsp?selectedMenuId=";
	url = url+obj;
	window.open(url, "_blank","toolbar=yes, scrollbars=yes, resizable=yes, top=100, left=300, width=400, height=250");
}

function CreateSiblingMenu(obj) {
	var url = "CreateSiblingMenu.jsp?selectedMenuId=";
	url = url+obj;
	window.open(url, "_blank","toolbar=yes, scrollbars=yes, resizable=yes, top=100, left=300, width=400, height=250");
}
</script>

</head> 

<body>
<s:form id="ChangeMenu" name="ChangeMenu" action="DeleteMenu"> 
<s:set id="contextPath"  value="#request.get('javax.servlet.forward.context_path')" />
<div style="margin : 10px 0px 0px 10px" style="width : 100px ! important">
		<sjt:tree 
		    id="treeDynamicAjax" 
		    jstreetheme="default" 
			rootNode="tree"
			childCollectionProperty="children" 
			nodeTitleProperty="label"
			nodeIdProperty="id"
			types="{'valid_children' : [ 'root' ],
                                        'types' : {
                                                'root' : {
                                                        'icon' : { 
                                                                'image' : '%{contextPath}/images/file.png' 
                                                        },
                                                        'valid_children' : [ 'folder', 'file' ]
                                                },
                                                'folder' : {
                                                        'icon' : { 
                                                                'image' : '%{contextPath}/images/folder.png' 
                                                        },
                                                        'valid_children' : [ 'folder', 'file' ]
                                                },
                                                'file' : {
                                                        'icon' : { 
                                                                'image' : '%{contextPath}/images/file.png'
                                                        },
                                                        'valid_children' : [ 'none' ]
                                                }
                                }
                }"
			contextmenu="{
                        items: { 
                                'create' : false,
                                'rename' : false,
								'remove' : false,
                                'ccp' : false,
								'Create Children' : { 
                                        'label': 'Create Children', 
                                        'action':  function (obj) { CreateChildrenMenu(obj[0].id); }
                                },
								'Create Sibling' : { 
                                        'label': 'Create Sibling', 
                                        'action':  function (obj) { CreateSiblingMenu(obj[0].id); }
                                },
								'Rename Menu' : { 
                                        'label': 'Rename Menu', 
                                        'action':  function (obj) { RenameMenu(obj[0].id); }
                                },
                                'Delete Menu' : { 
                                        'label': 'Delete Menu', 
                                        'action':  function (obj) { DeleteTreeNode(obj[0].id); }
                                } 
                        } 
                }"
			/>
</div>
</s:form>
</body>
</html>