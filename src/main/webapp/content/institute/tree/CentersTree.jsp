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
				<li><a href="CentersInformationConstitution">Состав подразделения</a></li>
				<li><a href="CentersInformationNews">Новости</a></li>
				<li><a href="CentersInformationMaterials">Материалы</a></li>
				<li><a href="CentersInformationContacts">Контакты</a></li>
			</ul>
		</li>
        <li id="Regional"><a href="CentersRegional">Региональный центр по введению ФГОС</a>
			<ul>
				<li><a href="CentersRegionalNews">Новости</a></li>
				<li><a href="CentersRegionalBasic">Базовые площадки</a></li>
				<li><a href="CentersRegionalContacts">Контакты</a></li>
				<li><a href="CentersRegionalMaterials">Материалы</a></li>
				<li><a href="CentersRegionalConstitution">Состав подразделения</a></li>
			</ul>
		</li>
		<li id="EducationSystem"><a href="CentersEducationSystem">Центр исследований состояния системы образования</a>
			<ul>
				<li><a href="CentersEducationSystemConstitution">Состав подразделения</a></li>
				<li><a href="CentersEducationSystemNews">Новости</a></li>
				<li><a href="CentersEducationSystemMaterials">Материалы</a></li>
				<li><a href="CentersEducationSystemContacts">Контакты</a></li>
			</ul>
		</li>
		<li id="Library"><a href="CentersLibrary">Библиотечно-информационный центр</a>
			<ul>
				<li><a href="CentersLibraryShelter">Библиотекарю ОУ</a></li>
				<li><a href="CentersLibraryBibliography">Библиографические списки</a></li>
				<li><a href="CentersLibraryPublications">Издания и публикации ИРО</a></li>
				<li><a href="CentersLibraryExhibitionCalendar">Календарь выставок</a></li>
				<li><a href="CentersLibraryNews">Новости</a></li>
				<li><a href="CentersLibraryUsefulLinks">Полезные ссылки</a></li>
				<li><a href="CentersLibrarySeminars">Семинары и вебинары</a></li>
				<li><a href="CentersLibraryEducationalPublishing">Учебное книгоиздание</a></li>
			</ul>
		</li>
		<li id="Administration"><a href="CentersAdministration">Центр администрирования и технического сопровождения информационных систем</a>
			<ul>
				<li><a href="CentersAdministrationConstitution">Состав подразделения</a></li>
				<li><a href="CentersAdministrationNews">Новости</a></li>
				<li><a href="CentersAdministrationMaterials">Материалы</a></li>
				<li><a href="CentersAdministrationContacts">Контакты</a></li>
			</ul>
		</li>				
       </ul>
      </li>
     </ul>
</li>
</ul>
</body>