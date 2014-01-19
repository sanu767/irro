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
<li id="Projects"><a href="Projects">Проекты</a>
     <ul>
      <li id="Sverdlovsk"><a href="Sverdlovsk">Введение ФГОС общего <br>образования как фактор <br>модернизации системы <br>образования Свердловской <br>области</a>
		   <ul>
				<li id="Optional"><a href="SverdlovskOptional">Модели организации <br>внеурочной деятельности</a></li>
				<li id="Institutions"><a href="SverdlovskInstitutions">Моделирование информационной, <br>образовательной среды <br>образовательного учреждения</a></li>
				<li id="Children"><a href="SverdlovskChildren">Образовательные модели <br>и технологии работы <br>с одаренными детьми</a></li>
				<li id="RuralSchool"><a href="SverdlovskRuralSchool">Основные направления <br>развития сельских <br>школ</a></li>
				<li id="ModernEducation"><a href="SverdlovskModernEducation">Создание моделей <br>образовательных систем, <br>обеспечивающих современное 
				<br>качество общего <br>образования</a></li>
		   </ul>
      </li>
	  <li id="Basic"><a href="Basic">Базовые площадки</a></li>
	  <li id="ContinuingEducation"><a href="ContinuingEducation">Разработка и реализация <br>региональной модели <br>сопровождения профессионального <br>самоопределения обучающихся <br>в системе непрерывного <br>образования</a>
		   <ul>
				<li><a href="ContinuingEducationActionPlan">План деятельности площадки</a></li>
				<li><a href="ContinuingEducationSupport">Методическое обеспечение деятельности</a></li>
				<li><a href="ContinuingEducationNews">Новости проекта</a></li>				
		   </ul>
	  </li>
     </ul>
</li>
</ul>
</body>