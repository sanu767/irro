<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
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

<s:if test="%{#parameters.menuName[0]	== 'Institute' || 
#parameters.menuName[0]	== 'Rector' || 
#parameters.menuName[0]	== 'Documents' || 
#parameters.menuName[0]	== 'History' || 
#parameters.menuName[0]	== 'Logistics' || 
#parameters.menuName[0]	== 'Contacts' || 
#parameters.menuName[0]	== 'Jobs' || 
#parameters.parentMenuName[0]	== 'Rector' || 
#parameters.parentMenuName[0]	== 'Documents' }">
  	<jsp:include page="/content/institute/tree/RectorTree.jsp"></jsp:include>
</s:if>

<s:elseif test="%{#parameters.menuName[0]	== 'Conference' || 
#parameters.parentMenuName[0]	== 'Conference' }">
	<jsp:include page="/content/activities/tree/ConferenceTree.jsp"></jsp:include>
</s:elseif>

<s:elseif test="%{#parameters.menuName[0]	== 'Contests' || 
#parameters.menuName[0]	== 'Olympics' ||
#parameters.parentMenuName[0]	== 'Contests' || 
#parameters.parentMenuName[0]	== 'Olympics' }">
	<jsp:include page="/content/activities/tree/ContestsOlympicsTree.jsp"></jsp:include>
</s:elseif>

<s:elseif test="%{#parameters.menuName[0]	== 'Activities' || 
#parameters.menuName[0]	== 'EducationalActivities' || 
#parameters.menuName[0]	== 'EducationalActivitiesDevelopment' || 
#parameters.menuName[0]	== 'EducationalActivitiesRetraining' || 
#parameters.menuName[0]	== 'EducationalActivitiesDistanceLearning' || 
#parameters.menuName[0]	== 'EducationalActivitiesExtrabudgetary' || 
#parameters.menuName[0]	== 'EducationalActivitiesSeminar' || 
#parameters.parentMenuName[0]	== 'Activities' || 
#parameters.parentMenuName[0]	== 'EducationalActivities' || 
#parameters.parentMenuName[0]	== 'EducationalActivitiesDevelopment' || 
#parameters.parentMenuName[0]	== 'EducationalActivitiesRetraining' || 
#parameters.parentMenuName[0]	== 'EducationalActivitiesDistanceLearning' || 
#parameters.parentMenuName[0]	== 'EducationalActivitiesExtrabudgetary' || 
#parameters.parentMenuName[0]	== 'EducationalActivitiesSeminar'  }">
	<jsp:include page="/content/activities/tree/EducationalActivitiesTree.jsp"></jsp:include>
</s:elseif>

<s:elseif test="%{#parameters.menuName[0]	== 'Certification' || 
#parameters.menuName[0]	== 'Employees' || 
#parameters.menuName[0]	== 'Graduates' || 
#parameters.menuName[0]	== 'GraduatesEGE' || 
#parameters.menuName[0]	== 'GraduatesJEG' || 
#parameters.parentMenuName[0]	== 'Certification' || 
#parameters.parentMenuName[0]	== 'Employees' || 
#parameters.parentMenuName[0]	== 'Graduates' || 
#parameters.parentMenuName[0]	== 'GraduatesEGE' || 
#parameters.parentMenuName[0]	== 'GraduatesJEG'}">
	<jsp:include page="/content/certification/tree/CertificationTree.jsp"></jsp:include>
</s:elseif>

<s:elseif test="%{#parameters.menuName[0]	== 'Centers' || 
#parameters.menuName[0]	== 'CentersInformation' || 
#parameters.menuName[0]	== 'CentersRegional' || 
#parameters.menuName[0]	== 'CentersEducationSystem' || 
#parameters.menuName[0]	== 'CentersLibrary' ||
#parameters.menuName[0]	== 'CentersAdministration' ||
#parameters.menuName[0]	== 'CentersRobotics' ||
#parameters.parentMenuName[0]	== 'Centers' || 
#parameters.parentMenuName[0]	== 'CentersInformation' || 
#parameters.parentMenuName[0]	== 'CentersRegional' || 
#parameters.parentMenuName[0]	== 'CentersEducationSystem' || 
#parameters.parentMenuName[0]	== 'CentersLibrary' ||
#parameters.parentMenuName[0]	== 'CentersAdministration' ||
#parameters.menuName[0]	== 'CentersRobotics' }">
	<jsp:include page="/content/institute/tree/CentersTree.jsp"></jsp:include>

</s:elseif>

<s:elseif test="%{#parameters.menuName[0]	== 'Departments' || 
#parameters.menuName[0]	== 'DepartmentsPhilosophy' || 
#parameters.menuName[0]	== 'DepartmentsChildren' || 
#parameters.menuName[0]	== 'DepartmentsScience' || 
#parameters.menuName[0]	== 'DepartmentsVocational' ||
#parameters.menuName[0]	== 'DepartmentsHumanities' || 
#parameters.menuName[0]	== 'DepartmentsPhilological' || 
#parameters.menuName[0]	== 'DepartmentsIT' || 
#parameters.menuName[0]	== 'DepartmentsSocioScientific' || 
#parameters.menuName[0]	== 'DepartmentsCabinet' ||
#parameters.parentMenuName[0]	== 'Departments' || 
#parameters.parentMenuName[0]	== 'DepartmentsPhilosophy' || 
#parameters.parentMenuName[0]	== 'DepartmentsChildren' || 
#parameters.parentMenuName[0]	== 'DepartmentsScience' || 
#parameters.parentMenuName[0]	== 'DepartmentsVocational' ||
#parameters.parentMenuName[0]	== 'DepartmentsHumanities' || 
#parameters.parentMenuName[0]	== 'DepartmentsPhilological' || 
#parameters.parentMenuName[0]	== 'DepartmentsPsychology' || 
#parameters.parentMenuName[0]	== 'DepartmentsIT' || 
#parameters.parentMenuName[0]	== 'DepartmentsSocioScientific' || 
#parameters.parentMenuName[0]	== 'DepartmentsCabinet' }">
	<jsp:include page="/content/institute/tree/DepartmentTree.jsp"></jsp:include>

</s:elseif>

<s:elseif test="%{#parameters.menuName[0]	== 'Divisions' || 
#parameters.menuName[0]	== 'DivisionsEscort' || 
#parameters.menuName[0]	== 'DivisionsEditorial' || 
#parameters.menuName[0]	== 'DivisionsCustomerEvaluation' || 
#parameters.menuName[0]	== 'DivisionsPostUniversity' ||
#parameters.menuName[0]	== 'DivisionsTechSupport' || 
#parameters.menuName[0]	== 'DivisionsLaw' || 
#parameters.menuName[0]	== 'DivisionsOrganization' || 
#parameters.menuName[0]	== 'BranchOffice' || 
#parameters.parentMenuName[0]	== 'Divisions' || 
#parameters.parentMenuName[0]	== 'DivisionsEscort' || 
#parameters.parentMenuName[0]	== 'DivisionsEditorial' || 
#parameters.parentMenuName[0]	== 'DivisionsCustomerEvaluation' || 
#parameters.parentMenuName[0]	== 'DivisionsPostUniversity' ||
#parameters.parentMenuName[0]	== 'DivisionsTechSupport' || 
#parameters.parentMenuName[0]	== 'DivisionsLaw' || 
#parameters.parentMenuName[0]	== 'DivisionsOrganization' || 
#parameters.parentMenuName[0]	== 'BranchOffice'}">
	<jsp:include page="/content/institute/tree/DivisionsTree.jsp"></jsp:include>

</s:elseif>

<s:elseif test="%{#parameters.menuName[0]	== 'Projects' || 
#parameters.menuName[0]	== 'Sverdlovsk' ||
#parameters.menuName[0]	== 'SverdlovskOptional' ||
#parameters.menuName[0]	== 'SverdlovskInstitutions' ||
#parameters.menuName[0]	== 'SverdlovskChildren' ||
#parameters.menuName[0]	== 'SverdlovskRuralSchool' ||
#parameters.menuName[0]	== 'SverdlovskModernEducation' ||
#parameters.menuName[0]	== 'Basic' ||
#parameters.menuName[0]	== 'ContinuingEducation' ||
#parameters.parentMenuName[0]	== 'Projects' || 
#parameters.parentMenuName[0]	== 'Sverdlovsk' ||
#parameters.parentMenuName[0]	== 'SverdlovskOptional' ||
#parameters.parentMenuName[0]	== 'SverdlovskInstitutions' ||
#parameters.parentMenuName[0]	== 'SverdlovskChildren' ||
#parameters.parentMenuName[0]	== 'SverdlovskRuralSchool' ||
#parameters.parentMenuName[0]	== 'SverdlovskModernEducation' ||
#parameters.parentMenuName[0]	== 'Basic' ||
#parameters.parentMenuName[0]	== 'ContinuingEducation' }">
	<jsp:include page="/content/projects/tree/ProjectsTree.jsp"></jsp:include>
</s:elseif>

<s:elseif test="%{#parameters.menuName[0]	== 'News' || 
#parameters.parentMenuName[0]	== 'News' }">
	<jsp:include page="/content/news/tree/NewsTree.jsp"></jsp:include>
</s:elseif>

<s:else>
	<jsp:include page="/content/institute/tree/RectorTree.jsp"></jsp:include>	
</s:else>
</body>

