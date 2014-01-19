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
				<li><a href="EducationalActivitiesDevelopmentYearlySchedule">График  на год</a></li>
				<li><a href="EducationalActivitiesDevelopmentMonthlyPlan">План на месяц</a></li>
				<li><a href="EducationalActivitiesDevelopmentCatalog">Аннотированный каталог</a></li>
		   </ul>
		</li>
        <li id="Retraining"><a href="EducationalActivitiesRetraining">Профессиональная переподготовка</a>
			<ul>
				<li><a href="EducationalActivitiesRetrainingYearlySchedule">График  на год</a></li>
				<li><a href="EducationalActivitiesRetrainingMonthlyPlan">План на месяц</a></li>
				<li><a href="EducationalActivitiesRetrainingCatalog">Аннотированный каталог</a></li>
		   </ul>
		</li>
		<li id="Internship"><a href="EducationalActivitiesInternship">Стажировка</a>
			<ul>
				<li><a href="EducationalActivitiesInternshipYearlySchedule">График  на год</a></li>
				<li><a href="EducationalActivitiesInternshipMonthlyPlan">План на месяц</a></li>
				<li><a href="EducationalActivitiesInternshipCatalog">Аннотированный каталог</a></li>
		   </ul>
		</li>
		<li id="DistanceLearning"><a href="EducationalActivitiesDistanceLearning">Дистанционное обучение</a>
			<ul>
				<li><a href="EducationalActivitiesDistanceLearningContract">Договор оферты</a></li>
				<li><a href="EducationalActivitiesDistanceLearningCatalog">Аннотированный каталог (Описание и ссылка для перехода на http://elearn.irro.ru/)</a></li>			
		   </ul>
		</li>	
		<li id="Extrabudgetary"><a href="EducationalActivitiesExtrabudgetary">Внебюджетная деятельность</a>
		   <ul>
				<li><a href="EducationalActivitiesExtrabudgetaryContract">Договор</a></li>
				<li><a href="EducationalActivitiesExtrabudgetaryCatalog">Аннотированный каталог</a></li>			
		   </ul>
		</li>
		<li id="Seminar"><a href="EducationalActivitiesSeminar">Семинары</a></li>
       </ul>
       </li>
     </ul>
</li>
</ul>
</body>