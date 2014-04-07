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
<li id="Projects"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Projects</s:param>
				</s:url>'>Проекты</a>
     <ul>
      <li id="Sverdlovsk"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Sverdlovsk</s:param>
					<s:param name="parentMenuName">Projects</s:param>
				</s:url>'>Введение ФГОС общего <br>образования как фактор <br>модернизации системы <br>образования Свердловской <br>области</a>
		   <ul>
				<li id="Optional"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">SverdlovskOptional</s:param>
					<s:param name="parentMenuName">Sverdlovsk</s:param>
				</s:url>'>Модели организации <br>внеурочной деятельности</a></li>
				
				<li id="SverdlovskInstitutions"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">SverdlovskInstitutions</s:param>
					<s:param name="parentMenuName">Sverdlovsk</s:param>
				</s:url>'>Моделирование информационной, <br>образовательной среды <br>образовательного учреждения</a></li>
				
				<li id="Children"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">SverdlovskChildren</s:param>
					<s:param name="parentMenuName">Sverdlovsk</s:param>
				</s:url>'>Образовательные модели <br>и технологии работы <br>с одаренными детьми</a></li>
				
				<li id="RuralSchool"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">SverdlovskRuralSchool</s:param>
					<s:param name="parentMenuName">Sverdlovsk</s:param>
				</s:url>'>Основные направления <br>развития сельских <br>школ</a></li>
				
				<li id="ModernEducation"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">SverdlovskModernEducation</s:param>
					<s:param name="parentMenuName">Sverdlovsk</s:param>
				</s:url>'>Создание моделей <br>образовательных систем, <br>обеспечивающих современное 
				<br>качество общего <br>образования</a></li>
				
		   </ul>
      </li>
	  <li id="Basic"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Basic</s:param>
					<s:param name="parentMenuName">Projects</s:param>
				</s:url>'>Базовые площадки</a></li>
				
	  <li id="ContinuingEducation"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">ContinuingEducation</s:param>
				</s:url>'>Разработка и реализация <br>региональной модели <br>сопровождения профессионального <br>самоопределения обучающихся <br>в системе непрерывного <br>образования</a>
		   <ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">ContinuingEducationActionPlan</s:param>
					<s:param name="parentMenuName">ContinuingEducation</s:param>
				</s:url>'>План деятельности площадки</a></li>
				
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">ContinuingEducationSupport</s:param>
					<s:param name="parentMenuName">ContinuingEducation</s:param>
				</s:url>'>Методическое обеспечение деятельности</a></li>
				
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">ContinuingEducationNews</s:param>
					<s:param name="parentMenuName">ContinuingEducation</s:param>
				</s:url>'>Новости проекта</a></li>				
		   </ul>
	  </li>
     </ul>
</li>
</ul>
</body>