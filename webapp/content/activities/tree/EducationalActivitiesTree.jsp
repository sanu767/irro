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
<li id="Activities"><a href="Activities">Деятельность</a>
     <ul>
      <li id="EducationalActivities"><a href="EducationalActivities">Образовательная деятельность</a>
       <ul>
        <li id="Development"><a href="EducationalActivitiesDevelopment">Повышение квалификации</a>
			<ul>
				<li><a href="EducationalActivitiesDevelopment1">График  на год</a></li>
				<li><a href="EducationalActivitiesDevelopment2">План на месяц</a></li>
				<li><a href="EducationalActivitiesDevelopment3">Аннотированный каталог</a></li>
		   </ul>
		</li>
        <li id="Retraining"><a href="EducationalActivitiesRetraining">Профессиональная переподготовка</a>
			<ul>
				<li><a href="EducationalActivitiesRetraining1">График  на год</a></li>
				<li><a href="EducationalActivitiesRetraining2">План на месяц</a></li>
				<li><a href="EducationalActivitiesRetraining3">Аннотированный каталог</a></li>
		   </ul>
		</li>
		<li id="Internship"><a href="EducationalActivitiesInternship">Стажировка</a>
			<ul>
				<li><a href="EducationalActivitiesInternship1">График  на год</a></li>
				<li><a href="EducationalActivitiesInternship2">План на месяц</a></li>
				<li><a href="EducationalActivitiesInternship3">Аннотированный каталог</a></li>
		   </ul>
		</li>
		<li id="DistanceLearning"><a href="EducationalActivitiesDistanceLearning">Дистанционное обучение</a>
			<ul>
				<li><a href="EducationalActivitiesDistanceLearning1">Договор оферты</a></li>
				<li><a href="EducationalActivitiesDistanceLearning2">Аннотированный каталог (Описание и ссылка для перехода на http://elearn.irro.ru/)</a></li>			
		   </ul>
		</li>	
		<li id="Extrabudgetary"><a href="EducationalActivitiesExtrabudgetary">Внебюджетная деятельность</a>
		   <ul>
				<li><a href="EducationalActivitiesExtrabudgetary1">Договор</a></li>
				<li><a href="EducationalActivitiesExtrabudgetary2">Аннотированный каталог</a></li>			
		   </ul>
		</li>
		<li id="Seminar"><a href="EducationalActivitiesSeminar">Семинары</a></li>
       </ul>
       </li>
     </ul>
</li>
</ul>
</body>