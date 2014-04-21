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
</head>
<body>
<ul>
<li id="Institute"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">Institute</s:param>
				</s:url>'>Институт</a>
     <ul>
      <li id="Centers"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">Centers</s:param>
					<s:param name="parentMenuId">Institute</s:param>
				</s:url>'>Центры</a>
       <ul>
        <li id="Information"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersInformation</s:param>
					<s:param name="parentMenuId">Centers</s:param>
							</s:url>'>Центр обработки информации и организации ЕГЭ</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersInformationConstitution</s:param>
					<s:param name="parentMenuId">CentersInformation</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersInformationNews</s:param>
					<s:param name="parentMenuId">CentersInformation</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersInformationMaterials</s:param>
					<s:param name="parentMenuId">CentersInformation</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersInformationContacts</s:param>
					<s:param name="parentMenuId">CentersInformation</s:param>
							</s:url>'>Контакты</a></li>
			</ul>
		</li>
        <li id="Regional"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersRegional</s:param>
					<s:param name="parentMenuId">Centers</s:param>
							</s:url>'>Региональный центр по введению ФГОС</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersRegionalNews</s:param>
					<s:param name="parentMenuId">CentersRegional</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersRegionalBasic</s:param>
					<s:param name="parentMenuId">CentersRegional</s:param>
							</s:url>'>Базовые площадки</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersRegionalContacts</s:param>
					<s:param name="parentMenuId">CentersRegional</s:param>
							</s:url>'>Контакты</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersRegionalMaterials</s:param>
					<s:param name="parentMenuId">CentersRegional</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersRegionalConstitution</s:param>
					<s:param name="parentMenuId">CentersRegional</s:param>
							</s:url>'>Состав подразделения</a></li>
			</ul>
		</li>
		<li id="EducationSystem"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersEducationSystem</s:param>
					<s:param name="parentMenuId">Centers</s:param>
							</s:url>'>Центр исследований состояния системы образования</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersEducationSystemConstitution</s:param>
					<s:param name="parentMenuId">CentersEducationSystem</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersEducationSystemNews</s:param>
					<s:param name="parentMenuId">CentersEducationSystem</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersEducationSystemMaterials</s:param>
					<s:param name="parentMenuId">CentersEducationSystem</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersEducationSystemContacts</s:param>
					<s:param name="parentMenuId">CentersEducationSystem</s:param>
							</s:url>'>Контакты</a></li>
			</ul>
		</li>
		<li id="Library"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersLibrary</s:param>
					<s:param name="parentMenuId">Centers</s:param>
							</s:url>'>Библиотечно-информационный центр</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersLibraryShelter</s:param>
					<s:param name="parentMenuId">CentersLibrary</s:param>
							</s:url>'>Библиотекарю ОУ</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersLibraryBibliography</s:param>
					<s:param name="parentMenuId">CentersLibrary</s:param>
							</s:url>'>Библиографические списки</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersLibraryPublications</s:param>
					<s:param name="parentMenuId">CentersLibrary</s:param>
							</s:url>'>Издания и публикации ИРО</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersLibraryExhibitionCalendar</s:param>
					<s:param name="parentMenuId">CentersLibrary</s:param>
							</s:url>'>Календарь выставок</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersLibraryNews</s:param>
					<s:param name="parentMenuId">CentersLibrary</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersLibraryUsefulLinks</s:param>
					<s:param name="parentMenuId">CentersLibrary</s:param>
							</s:url>'>Полезные ссылки</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersLibrarySeminars</s:param>
					<s:param name="parentMenuId">CentersLibrary</s:param>
							</s:url>'>Семинары и вебинары</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersLibraryEducationalPublishing</s:param>
					<s:param name="parentMenuId">CentersLibrary</s:param>
							</s:url>'>Учебное книгоиздание</a></li>
			</ul>
		</li>
		<li id="Administration"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersAdministration</s:param>
					<s:param name="parentMenuId">Centers</s:param>
							</s:url>'>Центр администрирования и технического сопровождения информационных систем</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersAdministrationConstitution</s:param>
					<s:param name="parentMenuId">CentersAdministration</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersAdministrationNews</s:param>
					<s:param name="parentMenuId">CentersAdministration</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersAdministrationMaterials</s:param>
					<s:param name="parentMenuId">CentersAdministration</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersAdministrationContacts</s:param>
					<s:param name="parentMenuId">CentersAdministration</s:param>
							</s:url>'>Контакты</a></li>
			</ul>
		</li>
		<li id="Robotics"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersRobotics</s:param>
					<s:param name="parentMenuId">Centers</s:param>
							</s:url>'>Центр образовательной робототехники</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersRoboticsConstitution</s:param>
					<s:param name="parentMenuId">CentersRobotics</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersRoboticsNews</s:param>
					<s:param name="parentMenuId">CentersRobotics</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersRoboticsMaterials</s:param>
					<s:param name="parentMenuId">CentersRobotics</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">CentersRoboticsContacts</s:param>
					<s:param name="parentMenuId">CentersRobotics</s:param>
							</s:url>'>Контакты</a></li>
			 </ul>
		</li>			
       </ul>
      </li>
     </ul>
</li>
</ul>
</body>