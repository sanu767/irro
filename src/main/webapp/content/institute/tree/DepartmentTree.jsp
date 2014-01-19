<html>
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
<li id="Institute"><a href="Institute">Институт</a>
     <ul>
      <li id="Departments"><a href="Departments">Кафедры</a>
       <ul>
        <li id="Philosophy"><a href="DepartmentsPhilosophy">Кафедра философии  и управления образованием</a>
			<ul>
				<li><a href="DepartmentsPhilosophyConstitution">Состав подразделения</a></li>
				<li><a href="DepartmentsPhilosophyNews">Новости</a></li>
				<li><a href="DepartmentsPhilosophyMaterials">Материалы</a></li>
				<li><a href="DepartmentsPhilosophyContacts">Контакты</a></li>
			</ul>
		</li>
        <li id="Psychology"><a href="DepartmentsPsychology">Кафедра педагогики и психологии</a>
			<ul>
				<li><a href="DepartmentsPsychologyConstitution">Состав подразделения</a></li>
				<li><a href="DepartmentsPsychologyNews">Новости</a></li>
				<li><a href="DepartmentsPsychologyMaterials">Материалы</a></li>
				<li><a href="DepartmentsPsychologyReviews">Отзывы слушателей</a></li>
				<li><a href="DepartmentsPsychologyContacts">Контакты</a></li>
			</ul>
		</li>
		<li id="Children"><a href="DepartmentsChildren">Кафедра методологии и методики образования детей с ОВЗ и детей, оставшихся без попечения родителей</a>
			<ul>
				<li><a href="DepartmentsChildrenConstitution">Состав подразделения</a></li>
				<li><a href="DepartmentsChildrenNews">Новости</a></li>
				<li><a href="DepartmentsChildrenMaterials">Материалы</a></li>
				<li><a href="DepartmentsChildrenContacts">Контакты</a></li>
			</ul>
		</li>
		<li id="Science"><a href="DepartmentsScience">Кафедра естественнонаучного <br>и математического <br>образования</a>
			<ul>
				<li><a href="DepartmentsScienceConstitution">Состав подразделения</a></li>
				<li><a href="DepartmentsScienceNews">Новости</a></li>
				<li><a href="DepartmentsScienceMaterials">Материалы</a></li>
				<li><a href="DepartmentsScienceContacts">Контакты</a></li>
			</ul>
		</li>
		<li id="Vocational"><a href="DepartmentsVocational">Кафедра профессионального образования</a>
			<ul>
				<li><a href="DepartmentsVocationalService">Методическая служба</a></li>
				<li><a href="DepartmentsVocationalConstitution">Состав подразделения</a></li>
				<li><a href="DepartmentsVocationalNews">Новости</a></li>
				<li><a href="DepartmentsVocationalMaterials">Материалы</a></li>
				<li><a href="DepartmentsVocationalContacts">Контакты</a></li>				
			</ul>
		</li>
		<li id="Humanities"><a href="DepartmentsHumanities">Кафедра гуманитарного образования</a>
			<ul>
				<li><a href="DepartmentsHumanitiesNews">Новости</a></li>
				<li><a href="DepartmentsHumanitiesEducationalActivities">Образовательная деятельность</a></li>
				<li><a href="DepartmentsHumanitiesReviews">Отзывы слушателей</a></li>
				<li><a href="DepartmentsHumanitiesMaterialsDepartment">Материалы кафедры</a></li>
				<li><a href="DepartmentsHumanitiesFaculties">Профессорско-преподавательский состав кафедры</a></li>
				<li><a href="DepartmentsHumanitiesContacts">Контакты</a></li>
			</ul>
		</li>
		<li id="Philological"><a href="DepartmentsPhilological">Кафедра филологического образования</a>
			<ul>
				<li><a href="DepartmentsPhilologicalConstitution">Состав подразделения</a></li>
				<li><a href="DepartmentsPhilologicalNews">Новости</a></li>
				<li><a href="DepartmentsPhilologicalMaterials">Материалы</a></li>
				<li><a href="DepartmentsPhilologicalContacts">Контакты</a></li>
			</ul>
		</li>
		<li id="IT"><a href="DepartmentsIT">Кафедра информационных технологий</a>
			<ul>
				<li><a href="DepartmentsITConstitution">Состав подразделения</a></li>
				<li><a href="DepartmentsITNews">Новости</a></li>
				<li><a href="DepartmentsITMaterials">Материалы</a></li>
				<li><a href="DepartmentsITContacts">Контакты</a></li>
			</ul>
		</li>
		<li id="SocioScientific"><a href="DepartmentsSocioScientific">Кафедра общественно-научных дисциплин</a>
			<ul>
				<li><a href="DepartmentsSocioScientificConstitution">Состав подразделения</a></li>
				<li><a href="DepartmentsSocioScientificNews">Новости</a></li>
				<li><a href="DepartmentsSocioScientificMaterials">Материалы</a></li>
				<li><a href="DepartmentsSocioScientificContacts">Контакты</a></li>
			</ul>
		</li>
		<li id="Cabinet"><a href="DepartmentsCabinet">Кабинет «ОБЖ и физического воспитания»</a>
			<ul>
				<li><a href="DepartmentsCabinetConstitution">Состав подразделения</a></li>
				<li><a href="DepartmentsCabinetNews">Новости</a></li>
				<li><a href="DepartmentsCabinetMaterials">Материалы</a></li>
				<li><a href="DepartmentsCabinetContacts">Контакты</a></li>
			</ul>
		</li>		
       </ul>
      </li>
     </ul>
</li>
</ul>
</body>