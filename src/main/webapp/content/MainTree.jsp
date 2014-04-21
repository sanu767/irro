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
.leftmenu {

}

.leftmenu ul li {
    margin-left: 20px;
}

a {
 font-family : "Calibri";
 color : rgb(127,127,127);
}
</style>
</head>
<body>
<div class="leftmenu">
<s:if test="%{#parameters.menuId[0]	== 'Institute' || 
#parameters.menuId[0]	== 'Rector' || 
#parameters.menuId[0]	== 'Documents' || 
#parameters.menuId[0]	== 'History' || 
#parameters.menuId[0]	== 'Logistics' || 
#parameters.menuId[0]	== 'Contacts' || 
#parameters.menuId[0]	== 'Jobs' || 
#parameters.parentMenuId[0]	== 'Rector' || 
#parameters.parentMenuId[0]	== 'Documents' }">
  	<jsp:include page="/content/institute/tree/RectorTree.jsp"></jsp:include>
</s:if>

<s:elseif test="%{#parameters.menuId[0]	== 'Conference' || 
#parameters.parentMenuId[0]	== 'Conference' }">
	<jsp:include page="/content/activities/tree/ConferenceTree.jsp"></jsp:include>
</s:elseif>

<s:elseif test="%{#parameters.menuId[0]	== 'Contests' || 
#parameters.menuId[0]	== 'Olympics' ||
#parameters.parentMenuId[0]	== 'Contests' || 
#parameters.parentMenuId[0]	== 'Olympics' }">
	<jsp:include page="/content/activities/tree/ContestsOlympicsTree.jsp"></jsp:include>
</s:elseif>

<s:elseif test="%{#parameters.menuId[0]	== 'Activities' || 
#parameters.menuId[0]	== 'EducationalActivities' || 
#parameters.menuId[0]	== 'EducationalActivitiesDevelopment' || 
#parameters.menuId[0]	== 'EducationalActivitiesRetraining' || 
#parameters.menuId[0]	== 'EducationalActivitiesDistanceLearning' || 
#parameters.menuId[0]	== 'EducationalActivitiesExtrabudgetary' || 
#parameters.menuId[0]	== 'EducationalActivitiesSeminar' || 
#parameters.parentMenuId[0]	== 'Activities' || 
#parameters.parentMenuId[0]	== 'EducationalActivities' || 
#parameters.parentMenuId[0]	== 'EducationalActivitiesDevelopment' || 
#parameters.parentMenuId[0]	== 'EducationalActivitiesRetraining' || 
#parameters.parentMenuId[0]	== 'EducationalActivitiesDistanceLearning' || 
#parameters.parentMenuId[0]	== 'EducationalActivitiesExtrabudgetary' || 
#parameters.parentMenuId[0]	== 'EducationalActivitiesSeminar'  }">
	<jsp:include page="/content/activities/tree/EducationalActivitiesTree.jsp"></jsp:include>
</s:elseif>

<s:elseif test="%{#parameters.menuId[0]	== 'Certification' || 
#parameters.menuId[0]	== 'Employees' || 
#parameters.menuId[0]	== 'Graduates' || 
#parameters.menuId[0]	== 'GraduatesEGE' || 
#parameters.menuId[0]	== 'GraduatesJEG' || 
#parameters.parentMenuId[0]	== 'Certification' || 
#parameters.parentMenuId[0]	== 'Employees' || 
#parameters.parentMenuId[0]	== 'Graduates' || 
#parameters.parentMenuId[0]	== 'GraduatesEGE' || 
#parameters.parentMenuId[0]	== 'GraduatesJEG'}">
	<jsp:include page="/content/certification/tree/CertificationTree.jsp"></jsp:include>
</s:elseif>

<s:elseif test="%{#parameters.menuId[0]	== 'Centers' || 
#parameters.menuId[0]	== 'CentersInformation' || 
#parameters.menuId[0]	== 'CentersRegional' || 
#parameters.menuId[0]	== 'CentersEducationSystem' || 
#parameters.menuId[0]	== 'CentersLibrary' ||
#parameters.menuId[0]	== 'CentersAdministration' ||
#parameters.menuId[0]	== 'CentersRobotics' ||
#parameters.parentMenuId[0]	== 'Centers' || 
#parameters.parentMenuId[0]	== 'CentersInformation' || 
#parameters.parentMenuId[0]	== 'CentersRegional' || 
#parameters.parentMenuId[0]	== 'CentersEducationSystem' || 
#parameters.parentMenuId[0]	== 'CentersLibrary' ||
#parameters.parentMenuId[0]	== 'CentersAdministration' ||
#parameters.menuId[0]	== 'CentersRobotics' }">
	<jsp:include page="/content/institute/tree/CentersTree.jsp"></jsp:include>

</s:elseif>

<s:elseif test="%{#parameters.menuId[0]	== 'Departments' || 
#parameters.menuId[0]	== 'DepartmentsPhilosophy' || 
#parameters.menuId[0]	== 'DepartmentsChildren' || 
#parameters.menuId[0]	== 'DepartmentsScience' || 
#parameters.menuId[0]	== 'DepartmentsVocational' ||
#parameters.menuId[0]	== 'DepartmentsHumanities' || 
#parameters.menuId[0]	== 'DepartmentsPhilological' || 
#parameters.menuId[0]	== 'DepartmentsIT' || 
#parameters.menuId[0]	== 'DepartmentsSocioScientific' || 
#parameters.menuId[0]	== 'DepartmentsCabinet' ||
#parameters.parentMenuId[0]	== 'Departments' || 
#parameters.parentMenuId[0]	== 'DepartmentsPhilosophy' || 
#parameters.parentMenuId[0]	== 'DepartmentsChildren' || 
#parameters.parentMenuId[0]	== 'DepartmentsScience' || 
#parameters.parentMenuId[0]	== 'DepartmentsVocational' ||
#parameters.parentMenuId[0]	== 'DepartmentsHumanities' || 
#parameters.parentMenuId[0]	== 'DepartmentsPhilological' || 
#parameters.parentMenuId[0]	== 'DepartmentsPsychology' || 
#parameters.parentMenuId[0]	== 'DepartmentsIT' || 
#parameters.parentMenuId[0]	== 'DepartmentsSocioScientific' || 
#parameters.parentMenuId[0]	== 'DepartmentsCabinet' }">
	<jsp:include page="/content/institute/tree/DepartmentTree.jsp"></jsp:include>

</s:elseif>

<s:elseif test="%{#parameters.menuId[0]	== 'Divisions' || 
#parameters.menuId[0]	== 'DivisionsEscort' || 
#parameters.menuId[0]	== 'DivisionsEditorial' || 
#parameters.menuId[0]	== 'DivisionsCustomerEvaluation' || 
#parameters.menuId[0]	== 'DivisionsPostUniversity' ||
#parameters.menuId[0]	== 'DivisionsTechSupport' || 
#parameters.menuId[0]	== 'DivisionsLaw' || 
#parameters.menuId[0]	== 'DivisionsOrganization' || 
#parameters.menuId[0]	== 'BranchOffice' || 
#parameters.parentMenuId[0]	== 'Divisions' || 
#parameters.parentMenuId[0]	== 'DivisionsEscort' || 
#parameters.parentMenuId[0]	== 'DivisionsEditorial' || 
#parameters.parentMenuId[0]	== 'DivisionsCustomerEvaluation' || 
#parameters.parentMenuId[0]	== 'DivisionsPostUniversity' ||
#parameters.parentMenuId[0]	== 'DivisionsTechSupport' || 
#parameters.parentMenuId[0]	== 'DivisionsLaw' || 
#parameters.parentMenuId[0]	== 'DivisionsOrganization' || 
#parameters.parentMenuId[0]	== 'BranchOffice'}">
	<jsp:include page="/content/institute/tree/DivisionsTree.jsp"></jsp:include>

</s:elseif>

<s:elseif test="%{#parameters.menuId[0]	== 'Projects' || 
#parameters.menuId[0]	== 'Sverdlovsk' ||
#parameters.menuId[0]	== 'SverdlovskOptional' ||
#parameters.menuId[0]	== 'SverdlovskInstitutions' ||
#parameters.menuId[0]	== 'SverdlovskChildren' ||
#parameters.menuId[0]	== 'SverdlovskRuralSchool' ||
#parameters.menuId[0]	== 'SverdlovskModernEducation' ||
#parameters.menuId[0]	== 'Basic' ||
#parameters.menuId[0]	== 'ContinuingEducation' ||
#parameters.parentMenuId[0]	== 'Projects' || 
#parameters.parentMenuId[0]	== 'Sverdlovsk' ||
#parameters.parentMenuId[0]	== 'SverdlovskOptional' ||
#parameters.parentMenuId[0]	== 'SverdlovskInstitutions' ||
#parameters.parentMenuId[0]	== 'SverdlovskChildren' ||
#parameters.parentMenuId[0]	== 'SverdlovskRuralSchool' ||
#parameters.parentMenuId[0]	== 'SverdlovskModernEducation' ||
#parameters.parentMenuId[0]	== 'Basic' ||
#parameters.parentMenuId[0]	== 'ContinuingEducation' }">
	<jsp:include page="/content/projects/tree/ProjectsTree.jsp"></jsp:include>
</s:elseif>

<s:elseif test="%{#parameters.menuId[0]	== 'News' || 
#parameters.parentMenuId[0]	== 'News' }">
	<jsp:include page="/content/news/tree/NewsTree.jsp"></jsp:include>
</s:elseif>

<s:else>
	<jsp:include page="/content/institute/tree/RectorTree.jsp"></jsp:include>	
</s:else>
</div>
</body>

