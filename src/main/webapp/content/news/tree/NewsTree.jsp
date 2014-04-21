<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>

<head>
<script type="text/javascript">
window.onload = function () {     
	//Getting First Level children	
	var selectedElem = document.getElementById('Mammals');
		if(selectedElem !- null ) {
		var mychildren = selectedElem.children;	
		if(mychildren != null && mychildren.length > 1) {
			var newchildren = mychildren[1].children;
			hideChildren(newchildren);
		}
			
		//prevElementSibling nextElementSibling - No need to check tagname
		var sibs = getAllSiblings(selectedElem)
		hideChildren(sibs);//u1
		
		var parent = getParent(selectedElem);
		while(parent != null) {
		   var sibs = getAllSiblings(parent);
		   hideSiblings(sibs);
		   parent = getParent(parent);
		}
	}	
};
</script>
</head>
<body>
<ul>
<li id="News"><a href='<s:url action="../content/LoadNews">
					<s:param name="menuId">News</s:param>
				</s:url>'>Новости</a>
     <ul>
      <li><a href='<s:url action="../content/LoadNews">
      				<s:param name="menuId">NewsAnnouncements</s:param>
					<s:param name="parentMenuId">News</s:param>
				</s:url>'>Анонсы</a></li>
				
	  <li><a href='<s:url action="../content/LoadNews">
					<s:param name="menuId">NewsArchive</s:param>
					<s:param name="parentMenuId">News</s:param>
				</s:url>'>Архив</a></li>
     </ul>
</li>
</ul>
</body>