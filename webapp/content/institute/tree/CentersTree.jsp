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
      <li id="Centers"><a href="Centers">Центры</a>
       <ul>
        <li id="Information"><a href="CentersInformation">Центр обработки информации и организации ЕГЭ</a>
			<ul>
				<li><a href="CentersInformation1">Состав подразделения</a></li>
				<li><a href="CentersInformation2">Новости</a></li>
				<li><a href="CentersInformation3">Материалы</a></li>
				<li><a href="CentersInformation4">Контакты</a></li>
			</ul>
		</li>
        <li id="Regional"><a href="CentersRegional">Региональный центр по введению ФГОС</a>
			<ul>
				<li><a href="CentersRegional1">Новости</a></li>
				<li><a href="CentersRegional2">Базовые площадки</a></li>
				<li><a href="CentersRegional3">Контакты</a></li>
				<li><a href="CentersRegional4">Материалы</a></li>
				<li><a href="CentersRegional5">Состав подразделения</a></li>
			</ul>
		</li>
		<li id="EducationSystem"><a href="CentersEducationSystem">Центр исследований состояния системы образования</a>
			<ul>
				<li><a href="CentersEducationSystem1">Состав подразделения</a></li>
				<li><a href="CentersEducationSystem2">Новости</a></li>
				<li><a href="CentersEducationSystem3">Материалы</a></li>
				<li><a href="CentersEducationSystem4">Контакты</a></li>
			</ul>
		</li>
		<li id="Library"><a href="CentersLibrary">Библиотечно-информационный центр</a>
			<ul>
				<li><a href="CentersLibrary1">Библиотекарю ОУ</a></li>
				<li><a href="CentersLibrary2">Библиографические списки</a></li>
				<li><a href="CentersLibrary3">Издания и публикации ИРО</a></li>
				<li><a href="CentersLibrary4">Календарь выставок</a></li>
				<li><a href="CentersLibrary5">Новости</a></li>
				<li><a href="CentersLibrary6">Полезные ссылки</a></li>
				<li><a href="CentersLibrary7">Семинары и вебинары</a></li>
				<li><a href="CentersLibrary8">Учебное книгоиздание</a></li>
			</ul>
		</li>
		<li id="Administration"><a href="CentersAdministration">Центр администрирования и технического сопровождения информационных систем</a>
			<ul>
				<li><a href="CentersAdministration1">Состав подразделения</a></li>
				<li><a href="CentersAdministration2">Новости</a></li>
				<li><a href="CentersAdministration3">Материалы</a></li>
				<li><a href="CentersAdministration4">Контакты</a></li>
			</ul>
		</li>				
       </ul>
      </li>
     </ul>
</li>
</ul>
</body>