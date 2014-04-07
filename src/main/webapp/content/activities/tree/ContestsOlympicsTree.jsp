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
<style>
ul li {
    margin-left: 20px !important;
}

a {
 font-family : "Calibri";
 color : rgb(127,127,127);
}
</style>
</head>
<body>
<ul>
<li id="Activities"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Activities</s:param>
				</s:url>'>Деятельность</a>
     <ul>
      <li id="Contests"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Contests</s:param>
					<s:param name="parentMenuName">Activities</s:param>
				</s:url>'>Конкурсы</a>
       <ul>
        <li id="Staff"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">ContestsStaff</s:param>
					<s:param name="parentMenuName">Contests</s:param>
				</s:url>'>для педагогических <br>работников</a></li>
        <li id="Organization"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">ContestsOrganization</s:param>
					<s:param name="parentMenuName">Contests</s:param>
				</s:url>'>для образовательных <br>организаций</a></li>
		<li id="Learner"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">ContestsLearner</s:param>
					<s:param name="parentMenuName">Contests</s:param>
				</s:url>'>для обучающихся</a></li>
       </ul>
      </li>
	  <li id="Olympics"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Olympics</s:param>
					<s:param name="parentMenuName">Activities</s:param>
				</s:url>'>Олимпиады</a>
       <ul>
        <li id="AllRussia"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">OlympicsAllRussia</s:param>
					<s:param name="parentMenuName">Olympics</s:param>
				</s:url>'>Всероссийская олимпиада школьников</a></li>
        <li id="School"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">OlympicsSchool</s:param>
					<s:param name="parentMenuName">Olympics</s:param>
				</s:url>'>Предметные олимпиады школьников</a></li>		
       </ul>
      </li>
     </ul>
</li>
</ul>
</body>