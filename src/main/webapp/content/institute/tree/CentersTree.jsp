<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
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
<li id="Institute"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Institute</s:param>
				</s:url>'>Институт</a>
     <ul>
      <li id="Centers"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Centers</s:param>
					<s:param name="parentMenuName">Institute</s:param>
				</s:url>'>Центры</a>
       <ul>
        <li id="Information"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersInformation</s:param>
					<s:param name="parentMenuName">Centers</s:param>
							</s:url>'>Центр обработки информации и организации ЕГЭ</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersInformationConstitution</s:param>
					<s:param name="parentMenuName">CentersInformation</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersInformationNews</s:param>
					<s:param name="parentMenuName">CentersInformation</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersInformationMaterials</s:param>
					<s:param name="parentMenuName">CentersInformation</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersInformationContacts</s:param>
					<s:param name="parentMenuName">CentersInformation</s:param>
							</s:url>'>Контакты</a></li>
			</ul>
		</li>
        <li id="Regional"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersRegional</s:param>
					<s:param name="parentMenuName">Centers</s:param>
							</s:url>'>Региональный центр по введению ФГОС</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersRegionalNews</s:param>
					<s:param name="parentMenuName">CentersRegional</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersRegionalBasic</s:param>
					<s:param name="parentMenuName">CentersRegional</s:param>
							</s:url>'>Базовые площадки</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersRegionalContacts</s:param>
					<s:param name="parentMenuName">CentersRegional</s:param>
							</s:url>'>Контакты</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersRegionalMaterials</s:param>
					<s:param name="parentMenuName">CentersRegional</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersRegionalConstitution</s:param>
					<s:param name="parentMenuName">CentersRegional</s:param>
							</s:url>'>Состав подразделения</a></li>
			</ul>
		</li>
		<li id="EducationSystem"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersEducationSystem</s:param>
					<s:param name="parentMenuName">Centers</s:param>
							</s:url>'>Центр исследований состояния системы образования</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersEducationSystemConstitution</s:param>
					<s:param name="parentMenuName">CentersEducationSystem</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersEducationSystemNews</s:param>
					<s:param name="parentMenuName">CentersEducationSystem</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersEducationSystemMaterials</s:param>
					<s:param name="parentMenuName">CentersEducationSystem</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersEducationSystemContacts</s:param>
					<s:param name="parentMenuName">CentersEducationSystem</s:param>
							</s:url>'>Контакты</a></li>
			</ul>
		</li>
		<li id="Library"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersLibrary</s:param>
					<s:param name="parentMenuName">Centers</s:param>
							</s:url>'>Библиотечно-информационный центр</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersLibraryShelter</s:param>
					<s:param name="parentMenuName">CentersLibrary</s:param>
							</s:url>'>Библиотекарю ОУ</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersLibraryBibliography</s:param>
					<s:param name="parentMenuName">CentersLibrary</s:param>
							</s:url>'>Библиографические списки</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersLibraryPublications</s:param>
					<s:param name="parentMenuName">CentersLibrary</s:param>
							</s:url>'>Издания и публикации ИРО</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersLibraryExhibitionCalendar</s:param>
					<s:param name="parentMenuName">CentersLibrary</s:param>
							</s:url>'>Календарь выставок</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersLibraryNews</s:param>
					<s:param name="parentMenuName">CentersLibrary</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersLibraryUsefulLinks</s:param>
					<s:param name="parentMenuName">CentersLibrary</s:param>
							</s:url>'>Полезные ссылки</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersLibrarySeminars</s:param>
					<s:param name="parentMenuName">CentersLibrary</s:param>
							</s:url>'>Семинары и вебинары</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersLibraryEducationalPublishing</s:param>
					<s:param name="parentMenuName">CentersLibrary</s:param>
							</s:url>'>Учебное книгоиздание</a></li>
			</ul>
		</li>
		<li id="Administration"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersAdministration</s:param>
					<s:param name="parentMenuName">Centers</s:param>
							</s:url>'>Центр администрирования и технического сопровождения информационных систем</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersAdministrationConstitution</s:param>
					<s:param name="parentMenuName">CentersAdministration</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersAdministrationNews</s:param>
					<s:param name="parentMenuName">CentersAdministration</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersAdministrationMaterials</s:param>
					<s:param name="parentMenuName">CentersAdministration</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersAdministrationContacts</s:param>
					<s:param name="parentMenuName">CentersAdministration</s:param>
							</s:url>'>Контакты</a></li>
			</ul>
		</li>
		<li id="Robotics"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersRobotics</s:param>
					<s:param name="parentMenuName">Centers</s:param>
							</s:url>'>Центр образовательной робототехники</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersRoboticsConstitution</s:param>
					<s:param name="parentMenuName">CentersRobotics</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersRoboticsNews</s:param>
					<s:param name="parentMenuName">CentersRobotics</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersRoboticsMaterials</s:param>
					<s:param name="parentMenuName">CentersRobotics</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersRoboticsContacts</s:param>
					<s:param name="parentMenuName">CentersRobotics</s:param>
							</s:url>'>Контакты</a></li>
			 </ul>
		</li>			
       </ul>
      </li>
     </ul>
</li>
</ul>
</body>