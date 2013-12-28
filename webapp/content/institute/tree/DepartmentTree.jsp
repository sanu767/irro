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
				<li><a href="DepartmentsPhilosophy1">Состав подразделения</a></li>
				<li><a href="DepartmentsPhilosophy2">Новости</a></li>
				<li><a href="DepartmentsPhilosophy3">Материалы</a></li>
				<li><a href="DepartmentsPhilosophy4">Контакты</a></li>
			</ul>
		</li>
        <li id="Psychology"><a href="DepartmentsPsychology">Кафедра педагогики и психологии</a>
			<ul>
				<li><a href="DepartmentsPsychology1">Состав подразделения</a></li>
				<li><a href="DepartmentsPsychology2">Новости</a></li>
				<li><a href="DepartmentsPsychology3">Материалы</a></li>
				<li><a href="DepartmentsPsychology4">Отзывы слушателей</a></li>
				<li><a href="DepartmentsPsychology5">Контакты</a></li>
			</ul>
		</li>
		<li id="Children"><a href="DepartmentsChildren">Кафедра методологии и методики образования детей с ОВЗ и детей, оставшихся без попечения родителей</a>
			<ul>
				<li><a href="DepartmentsChildren1">Состав подразделения</a></li>
				<li><a href="DepartmentsChildren2">Новости</a></li>
				<li><a href="DepartmentsChildren3">Материалы</a></li>
				<li><a href="DepartmentsChildren4">Контакты</a></li>
			</ul>
		</li>
		<li id="Science"><a href="DepartmentsScience">Кафедра естественнонаучного <br>и математического <br>образования</a>
			<ul>
				<li><a href="DepartmentsScience1">Состав подразделения</a></li>
				<li><a href="DepartmentsScience2">Новости</a></li>
				<li><a href="DepartmentsScience3">Материалы</a></li>
				<li><a href="DepartmentsScience4">Контакты</a></li>
			</ul>
		</li>
		<li id="Vocational"><a href="DepartmentsVocational">Кафедра естественнонаучного и математического образования</a>
			<ul>
				<li><a href="DepartmentsVocational1">Состав подразделения</a></li>
				<li><a href="DepartmentsVocational2">Новости</a></li>
				<li><a href="DepartmentsVocational3">Материалы</a></li>
				<li><a href="DepartmentsVocational4">Контакты</a></li>
			</ul>
		</li>
		<li id="Humanities"><a href="DepartmentsHumanities">Кафедра гуманитарного образования</a>
			<ul>
				<li><a href="DepartmentsHumanities1">Новости</a></li>
				<li><a href="DepartmentsHumanities2">Образовательная деятельность</a></li>
				<li><a href="DepartmentsHumanities3">Отзывы слушателей</a></li>
				<li><a href="DepartmentsHumanities4">Материалы кафедры</a></li>
				<li><a href="DepartmentsHumanities5">Профессорско-преподавательский состав кафедры</a></li>
				<li><a href="DepartmentsHumanities6">Контакты</a></li>
			</ul>
		</li>
		<li id="Philological"><a href="DepartmentsPhilological">Кафедра филологического образования</a>
			<ul>
				<li><a href="DepartmentsPhilological1">Состав подразделения</a></li>
				<li><a href="DepartmentsPhilological2">Новости</a></li>
				<li><a href="DepartmentsPhilological3">Материалы</a></li>
				<li><a href="DepartmentsPhilological4">Контакты</a></li>
			</ul>
		</li>
		<li id="IT"><a href="DepartmentsIT">Кафедра информационных технологий</a>
			<ul>
				<li><a href="DepartmentsIT1">Состав подразделения</a></li>
				<li><a href="DepartmentsIT2">Новости</a></li>
				<li><a href="DepartmentsIT3">Материалы</a></li>
				<li><a href="DepartmentsIT4">Контакты</a></li>
			</ul>
		</li>
		<li id="SocioScientific"><a href="DepartmentsSocioScientific">Кафедра общественно-научных дисциплин</a>
			<ul>
				<li><a href="DepartmentsSocioScientific1">Состав подразделения</a></li>
				<li><a href="DepartmentsSocioScientific2">Новости</a></li>
				<li><a href="DepartmentsSocioScientific3">Материалы</a></li>
				<li><a href="DepartmentsSocioScientific4">Контакты</a></li>
			</ul>
		</li>
		<li id="Cabinet"><a href="DepartmentsCabinet">Кабинет «ОБЖ и физического воспитания»</a>
			<ul>
				<li><a href="DepartmentsCabinet1">Состав подразделения</a></li>
				<li><a href="DepartmentsCabinet2">Новости</a></li>
				<li><a href="DepartmentsCabinet3">Материалы</a></li>
				<li><a href="DepartmentsCabinet4">Контакты</a></li>
			</ul>
		</li>		
       </ul>
      </li>
     </ul>
</li>
</ul>
</body>