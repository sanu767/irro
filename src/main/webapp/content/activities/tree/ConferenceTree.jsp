﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
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
<li id="Activities"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">Activities</s:param>
				</s:url>'>Деятельность</a>
     <ul>
      <li id="Conference"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">Conference</s:param>
					<s:param name="parentMenuId">Activities</s:param>
				</s:url>'>Конференции</a>
       <ul>
			<li id="International"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">ConferenceInternational</s:param>
					<s:param name="parentMenuId">Conference</s:param>
				</s:url>'>Международные</a></li>
			<li id="Russia"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">ConferenceRussia</s:param>
					<s:param name="parentMenuId">Conference</s:param>
				</s:url>'>Всероссийские</a></li>
			<li id="Regional"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">ConferenceRegional</s:param>
					<s:param name="parentMenuId">Conference</s:param>
				</s:url>'>Региональные</a></li>
			<li id="Oblastnyye"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">ConferenceOblastnyye</s:param>
					<s:param name="parentMenuId">Conference</s:param>
				</s:url>'>Областные</a></li>			
       </ul>
      </li>
     </ul>
</li>
</ul>
</body>