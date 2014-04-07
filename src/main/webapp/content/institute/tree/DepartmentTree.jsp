<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.apache.commons.collections.CollectionUtils"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
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
      <li id="Departments"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Departments</s:param>
					<s:param name="parentMenuName">Institute</s:param>
				</s:url>'>Кафедры</a>
       <ul>
        <li id="Philosophy"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsPhilosophy</s:param>
					<s:param name="parentMenuName">Departments</s:param>
							</s:url>'>Кафедра философии  и управления образованием</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsPhilosophyConstitution</s:param>
					<s:param name="parentMenuName">DepartmentsPhilosophy</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsPhilosophyNews</s:param>
					<s:param name="parentMenuName">DepartmentsPhilosophy</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsPhilosophyMaterials</s:param>
					<s:param name="parentMenuName">DepartmentsPhilosophy</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsPhilosophyContacts</s:param>
					<s:param name="parentMenuName">DepartmentsPhilosophy</s:param>
							</s:url>'>Контакты</a></li>
							
			</ul>
		</li>
        <li id="Psychology"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsPsychology</s:param>
					<s:param name="parentMenuName">Departments</s:param>
							</s:url>'>Кафедра педагогики и психологии</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsPsychologyConstitution</s:param>
					<s:param name="parentMenuName">DepartmentsPsychology</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsPsychologyNews</s:param>
					<s:param name="parentMenuName">DepartmentsPsychology</s:param>
							</s:url>' href="DepartmentsPsychologyNews">Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsPsychologyMaterials</s:param>
					<s:param name="parentMenuName">DepartmentsPsychology</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsPsychologyReviews</s:param>
					<s:param name="parentMenuName">DepartmentsPsychology</s:param>
							</s:url>'>Отзывы слушателей</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsPsychologyContacts</s:param>
					<s:param name="parentMenuName">DepartmentsPsychology</s:param>
							</s:url>'>Контакты</a></li>
							
			</ul>
		</li>
		<li id="Children"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsChildren</s:param>
					<s:param name="parentMenuName">Departments</s:param>
							</s:url>'>Кафедра методологии и методики образования детей с ОВЗ и детей, оставшихся без попечения родителей</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsChildrenConstitution</s:param>
					<s:param name="parentMenuName">DepartmentsChildren</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsChildrenNews</s:param>
					<s:param name="parentMenuName">DepartmentsChildren</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsChildrenMaterials</s:param>
					<s:param name="parentMenuName">DepartmentsChildren</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsChildrenContacts</s:param>
					<s:param name="parentMenuName">DepartmentsChildren</s:param>
							</s:url>'>Контакты</a></li>
			</ul>
		</li>
		<li id="Science"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsScience</s:param>
					<s:param name="parentMenuName">Departments</s:param>
							</s:url>'>Кафедра естественнонаучного <br>и математического <br>образования</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsScienceConstitution</s:param>
					<s:param name="parentMenuName">DepartmentsScience</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsScienceNews</s:param>
					<s:param name="parentMenuName">DepartmentsScience</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsScienceMaterials</s:param>
					<s:param name="parentMenuName">DepartmentsScience</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsScienceContacts</s:param>
					<s:param name="parentMenuName">DepartmentsScience</s:param>
							</s:url>'>Контакты</a></li>
			</ul>
		</li>
		<li id="Vocational"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsVocational</s:param>
					<s:param name="parentMenuName">Departments</s:param>
							</s:url>'>Кафедра профессионального образования</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsVocationalService</s:param>
					<s:param name="parentMenuName">DepartmentsVocational</s:param>
							</s:url>'>Методическая служба</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsVocationalConstitution</s:param>
					<s:param name="parentMenuName">DepartmentsVocational</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsVocationalNews</s:param>
					<s:param name="parentMenuName">DepartmentsVocational</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsVocationalMaterials</s:param>
					<s:param name="parentMenuName">DepartmentsVocational</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsVocationalContacts</s:param>
					<s:param name="parentMenuName">DepartmentsVocational</s:param>
							</s:url>'>Контакты</a></li>				
			</ul>
		</li>
		<li id="Humanities"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsHumanities</s:param>
					<s:param name="parentMenuName">Departments</s:param>
							</s:url>'>Кафедра гуманитарного образования</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsHumanitiesNews</s:param>
					<s:param name="parentMenuName">DepartmentsHumanities</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsHumanitiesEducationalActivities</s:param>
					<s:param name="parentMenuName">DepartmentsHumanities</s:param>
							</s:url>'>Образовательная деятельность</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsHumanitiesReviews</s:param>
					<s:param name="parentMenuName">DepartmentsHumanities</s:param>
							</s:url>'>Отзывы слушателей</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsHumanitiesMaterialsDepartment</s:param>
					<s:param name="parentMenuName">DepartmentsHumanities</s:param>
							</s:url>'>Материалы кафедры</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsHumanitiesFaculties</s:param>
					<s:param name="parentMenuName">DepartmentsHumanities</s:param>
							</s:url>'>Профессорско-преподавательский состав кафедры</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsHumanitiesContacts</s:param>
					<s:param name="parentMenuName">DepartmentsHumanities</s:param>
							</s:url>'>Контакты</a></li>
			</ul>
		</li>
		<li id="Philological"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsPhilological</s:param>
					<s:param name="parentMenuName">Departments</s:param>
							</s:url>'>Кафедра филологического образования</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsPhilologicalConstitution</s:param>
					<s:param name="parentMenuName">DepartmentsPhilological</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsPhilologicalNews</s:param>
					<s:param name="parentMenuName">DepartmentsPhilological</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsPhilologicalMaterials</s:param>
					<s:param name="parentMenuName">DepartmentsPhilological</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsPhilologicalContacts</s:param>
					<s:param name="parentMenuName">DepartmentsPhilological</s:param>
							</s:url>'>Контакты</a></li>
			</ul>
		</li>
		<li id="IT"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsIT</s:param>
					<s:param name="parentMenuName">Departments</s:param>
							</s:url>'>Кафедра информационных технологий</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsITConstitution</s:param>
					<s:param name="parentMenuName">DepartmentsIT</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsITNews</s:param>
					<s:param name="parentMenuName">DepartmentsIT</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsITMaterials</s:param>
					<s:param name="parentMenuName">DepartmentsIT</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsITContacts</s:param>
					<s:param name="parentMenuName">DepartmentsIT</s:param>
							</s:url>'>Контакты</a></li>
			</ul>
		</li>
		<li id="SocioScientific"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsSocioScientific</s:param>
					<s:param name="parentMenuName">Departments</s:param>
							</s:url>'>Кафедра общественно-научных дисциплин</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsSocioScientificConstitution</s:param>
					<s:param name="parentMenuName">DepartmentsSocioScientific</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsSocioScientificNews</s:param>
					<s:param name="parentMenuName">DepartmentsSocioScientific</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsSocioScientificMaterials</s:param>
					<s:param name="parentMenuName">DepartmentsSocioScientific</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsSocioScientificContacts</s:param>
					<s:param name="parentMenuName">DepartmentsSocioScientific</s:param>
							</s:url>'>Контакты</a></li>
			</ul>
		</li>
		<li id="Cabinet"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsCabinet</s:param>
					<s:param name="parentMenuName">Departments</s:param>
							</s:url>'>Кабинет «ОБЖ и физического воспитания»</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsCabinetConstitution</s:param>
					<s:param name="parentMenuName">DepartmentsCabinet</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsCabinetNews</s:param>
					<s:param name="parentMenuName">DepartmentsCabinet</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsCabinetMaterials</s:param>
					<s:param name="parentMenuName">DepartmentsCabinet</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsCabinetContacts</s:param>
					<s:param name="parentMenuName">DepartmentsCabinet</s:param>
							</s:url>'>Контакты</a></li>
			</ul>
		</li>
		<!-- Add Permission -->
		<% List<String> permissions = (List<String>)request.getSession().getAttribute("PermissionList");
			String menuName = request.getParameter("menuName");
			String parentMenuName = request.getParameter("parentMenuName");
			if(CollectionUtils.isNotEmpty(permissions) && 
					(permissions.contains(menuName) || permissions.contains(parentMenuName))) {%>
		<li id="LoadCreateDepartmentEvent"><a href="../content/LoadCreateDepartmentEvent">Create Event</a>
		
		</li>
		<%}%>
       </ul>
      </li>
     </ul>
</li>
</ul>
</body>