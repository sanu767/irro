<%@page import="org.apache.commons.lang.StringUtils"%>
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
</head>
<body>
<ul>
<li id="Institute"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">Institute</s:param>
				</s:url>'>Институт</a>
     <ul>
      <li id="Departments"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">Departments</s:param>
					<s:param name="parentMenuId">Institute</s:param>
				</s:url>'>Кафедры</a>
       <ul>
        <li id="Philosophy"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsPhilosophy</s:param>
					<s:param name="parentMenuId">Departments</s:param>
							</s:url>'>Кафедра философии  и управления образованием</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsPhilosophyConstitution</s:param>
					<s:param name="parentMenuId">DepartmentsPhilosophy</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsPhilosophyNews</s:param>
					<s:param name="parentMenuId">DepartmentsPhilosophy</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsPhilosophyMaterials</s:param>
					<s:param name="parentMenuId">DepartmentsPhilosophy</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsPhilosophyContacts</s:param>
					<s:param name="parentMenuId">DepartmentsPhilosophy</s:param>
							</s:url>'>Контакты</a></li>
							
			</ul>
		</li>
        <li id="Psychology"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsPsychology</s:param>
					<s:param name="parentMenuId">Departments</s:param>
							</s:url>'>Кафедра педагогики и психологии</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsPsychologyConstitution</s:param>
					<s:param name="parentMenuId">DepartmentsPsychology</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsPsychologyNews</s:param>
					<s:param name="parentMenuId">DepartmentsPsychology</s:param>
							</s:url>' href="DepartmentsPsychologyNews">Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsPsychologyMaterials</s:param>
					<s:param name="parentMenuId">DepartmentsPsychology</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsPsychologyReviews</s:param>
					<s:param name="parentMenuId">DepartmentsPsychology</s:param>
							</s:url>'>Отзывы слушателей</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsPsychologyContacts</s:param>
					<s:param name="parentMenuId">DepartmentsPsychology</s:param>
							</s:url>'>Контакты</a></li>
							
			</ul>
		</li>
		<li id="Children"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsChildren</s:param>
					<s:param name="parentMenuId">Departments</s:param>
							</s:url>'>Кафедра методологии и методики образования детей с ОВЗ и детей, оставшихся без попечения родителей</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsChildrenConstitution</s:param>
					<s:param name="parentMenuId">DepartmentsChildren</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsChildrenNews</s:param>
					<s:param name="parentMenuId">DepartmentsChildren</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsChildrenMaterials</s:param>
					<s:param name="parentMenuId">DepartmentsChildren</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsChildrenContacts</s:param>
					<s:param name="parentMenuId">DepartmentsChildren</s:param>
							</s:url>'>Контакты</a></li>
			</ul>
		</li>
		<li id="Science"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsScience</s:param>
					<s:param name="parentMenuId">Departments</s:param>
							</s:url>'>Кафедра естественнонаучного <br>и математического <br>образования</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsScienceConstitution</s:param>
					<s:param name="parentMenuId">DepartmentsScience</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsScienceNews</s:param>
					<s:param name="parentMenuId">DepartmentsScience</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsScienceMaterials</s:param>
					<s:param name="parentMenuId">DepartmentsScience</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsScienceContacts</s:param>
					<s:param name="parentMenuId">DepartmentsScience</s:param>
							</s:url>'>Контакты</a></li>
			</ul>
		</li>
		<li id="Vocational"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsVocational</s:param>
					<s:param name="parentMenuId">Departments</s:param>
							</s:url>'>Кафедра профессионального образования</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsVocationalService</s:param>
					<s:param name="parentMenuId">DepartmentsVocational</s:param>
							</s:url>'>Методическая служба</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsVocationalConstitution</s:param>
					<s:param name="parentMenuId">DepartmentsVocational</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsVocationalNews</s:param>
					<s:param name="parentMenuId">DepartmentsVocational</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsVocationalMaterials</s:param>
					<s:param name="parentMenuId">DepartmentsVocational</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsVocationalContacts</s:param>
					<s:param name="parentMenuId">DepartmentsVocational</s:param>
							</s:url>'>Контакты</a></li>				
			</ul>
		</li>
		<li id="Humanities"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsHumanities</s:param>
					<s:param name="parentMenuId">Departments</s:param>
							</s:url>'>Кафедра гуманитарного образования</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsHumanitiesNews</s:param>
					<s:param name="parentMenuId">DepartmentsHumanities</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsHumanitiesEducationalActivities</s:param>
					<s:param name="parentMenuId">DepartmentsHumanities</s:param>
							</s:url>'>Образовательная деятельность</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsHumanitiesReviews</s:param>
					<s:param name="parentMenuId">DepartmentsHumanities</s:param>
							</s:url>'>Отзывы слушателей</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsHumanitiesMaterialsDepartment</s:param>
					<s:param name="parentMenuId">DepartmentsHumanities</s:param>
							</s:url>'>Материалы кафедры</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsHumanitiesFaculties</s:param>
					<s:param name="parentMenuId">DepartmentsHumanities</s:param>
							</s:url>'>Профессорско-преподавательский состав кафедры</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsHumanitiesContacts</s:param>
					<s:param name="parentMenuId">DepartmentsHumanities</s:param>
							</s:url>'>Контакты</a></li>
			</ul>
		</li>
		<li id="Philological"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsPhilological</s:param>
					<s:param name="parentMenuId">Departments</s:param>
							</s:url>'>Кафедра филологического образования</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsPhilologicalConstitution</s:param>
					<s:param name="parentMenuId">DepartmentsPhilological</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsPhilologicalNews</s:param>
					<s:param name="parentMenuId">DepartmentsPhilological</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsPhilologicalMaterials</s:param>
					<s:param name="parentMenuId">DepartmentsPhilological</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsPhilologicalContacts</s:param>
					<s:param name="parentMenuId">DepartmentsPhilological</s:param>
							</s:url>'>Контакты</a></li>
			</ul>
		</li>
		<li id="IT"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsIT</s:param>
					<s:param name="parentMenuId">Departments</s:param>
							</s:url>'>Кафедра информационных технологий</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsITConstitution</s:param>
					<s:param name="parentMenuId">DepartmentsIT</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsITNews</s:param>
					<s:param name="parentMenuId">DepartmentsIT</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsITMaterials</s:param>
					<s:param name="parentMenuId">DepartmentsIT</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsITContacts</s:param>
					<s:param name="parentMenuId">DepartmentsIT</s:param>
							</s:url>'>Контакты</a></li>
			</ul>
		</li>
		<li id="SocioScientific"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsSocioScientific</s:param>
					<s:param name="parentMenuId">Departments</s:param>
							</s:url>'>Кафедра общественно-научных дисциплин</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsSocioScientificConstitution</s:param>
					<s:param name="parentMenuId">DepartmentsSocioScientific</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsSocioScientificNews</s:param>
					<s:param name="parentMenuId">DepartmentsSocioScientific</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsSocioScientificMaterials</s:param>
					<s:param name="parentMenuId">DepartmentsSocioScientific</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsSocioScientificContacts</s:param>
					<s:param name="parentMenuId">DepartmentsSocioScientific</s:param>
							</s:url>'>Контакты</a></li>
			</ul>
		</li>
		<li id="Cabinet"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsCabinet</s:param>
					<s:param name="parentMenuId">Departments</s:param>
							</s:url>'>Кабинет «ОБЖ и физического воспитания»</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsCabinetConstitution</s:param>
					<s:param name="parentMenuId">DepartmentsCabinet</s:param>
							</s:url>'>Состав подразделения</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsCabinetNews</s:param>
					<s:param name="parentMenuId">DepartmentsCabinet</s:param>
							</s:url>'>Новости</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsCabinetMaterials</s:param>
					<s:param name="parentMenuId">DepartmentsCabinet</s:param>
							</s:url>'>Материалы</a></li>
							
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DepartmentsCabinetContacts</s:param>
					<s:param name="parentMenuId">DepartmentsCabinet</s:param>
							</s:url>'>Контакты</a></li>
			</ul>
		</li>
		<!-- Add Permission -->
		<% List<Long> permissions = (List<Long>)request.getSession().getAttribute("PermissionList");
Long menuId = StringUtils.isNotBlank(request.getParameter("menuId")) ? Long.parseLong(request.getParameter("menuId")) : null;
Long parentMenuId = StringUtils.isNotBlank(request.getParameter("parentMenuId")) ? Long.parseLong(request.getParameter("parentMenuId")) : null;
			if(CollectionUtils.isNotEmpty(permissions) && 
					(permissions.contains(menuId) || permissions.contains(parentMenuId))) {%>
		<li id="LoadCreateDepartmentEvent"><a href="../content/LoadCreateDepartmentEvent">Create Event</a>
		
		</li>
		<%}%>
       </ul>
      </li>
     </ul>
</li>
</ul>
</body>