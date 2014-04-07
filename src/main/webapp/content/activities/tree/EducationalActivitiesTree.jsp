<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
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
<li id="Activities"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Activities</s:param>
				</s:url>'>Деятельность</a>
     <ul>
      <li id="EducationalActivities"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivities</s:param>
					<s:param name="parentMenuName">Activities</s:param>
				</s:url>'>Образовательная деятельность</a>
       <ul>
        <li id="Development"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivitiesDevelopment</s:param>
					<s:param name="parentMenuName">EducationalActivities</s:param>
				</s:url>'>Повышение квалификации</a>
			<ul>
				<li><a  href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivitiesDevelopmentYearlySchedule</s:param>
					<s:param name="parentMenuName">EducationalActivitiesDevelopment</s:param>
				</s:url>'>График  на год</a></li>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivitiesDevelopmentMonthlyPlan</s:param>
					<s:param name="parentMenuName">EducationalActivitiesDevelopment</s:param>
				</s:url>'>План на месяц</a></li>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivitiesDevelopmentCatalog</s:param>
					<s:param name="parentMenuName">EducationalActivitiesDevelopment</s:param>
				</s:url>'>Аннотированный каталог</a></li>
		   </ul>
		</li>
        <li id="Retraining"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivitiesRetraining</s:param>
					<s:param name="parentMenuName">EducationalActivities</s:param>
				</s:url>'>Профессиональная переподготовка</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivitiesRetrainingYearlySchedule</s:param>
					<s:param name="parentMenuName">EducationalActivitiesRetraining</s:param>
				</s:url>'>График  на год</a></li>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivitiesRetrainingMonthlyPlan</s:param>
					<s:param name="parentMenuName">EducationalActivitiesRetraining</s:param>
				</s:url>'>План на месяц</a></li>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivitiesRetrainingCatalog</s:param>
					<s:param name="parentMenuName">EducationalActivitiesRetraining</s:param>
				</s:url>'>Аннотированный каталог</a></li>
		   </ul>
		</li>
		<li id="Internship"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivitiesInternship</s:param>
					<s:param name="parentMenuName">EducationalActivities</s:param>
				</s:url>'>Стажировка</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivitiesInternshipYearlySchedule</s:param>
					<s:param name="parentMenuName">EducationalActivitiesInternship</s:param>
				</s:url>'>График  на год</a></li>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivitiesInternshipMonthlyPlan</s:param>
					<s:param name="parentMenuName">EducationalActivitiesInternship</s:param>
				</s:url>'>План на месяц</a></li>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivitiesInternshipCatalog</s:param>
					<s:param name="parentMenuName">EducationalActivitiesInternship</s:param>
				</s:url>'>Аннотированный каталог</a></li>
		   </ul>
		</li>
		<li id="DistanceLearning"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivitiesDistanceLearning</s:param>
					<s:param name="parentMenuName">EducationalActivities</s:param>
				</s:url>'>Дистанционное обучение</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivitiesDistanceLearningContract</s:param>
					<s:param name="parentMenuName">EducationalActivitiesDistanceLearning</s:param>
				</s:url>' href="EducationalActivitiesDistanceLearningContract">Договор оферты</a></li>
				
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivitiesDistanceLearningCatalog</s:param>
					<s:param name="parentMenuName">EducationalActivitiesDistanceLearning</s:param>
				</s:url>'>Аннотированный каталог (Описание и ссылка для перехода на http://elearn.irro.ru/)</a></li>			
		   </ul>
		</li>	
		<li id="Extrabudgetary"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivitiesExtrabudgetary</s:param>
					<s:param name="parentMenuName">EducationalActivities</s:param>
				</s:url>'>Внебюджетная деятельность</a>
		   <ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivitiesExtrabudgetaryContract</s:param>
					<s:param name="parentMenuName">EducationalActivitiesExtrabudgetary</s:param>
				</s:url>'>Договор</a></li>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivitiesExtrabudgetaryCatalog</s:param>
					<s:param name="parentMenuName">EducationalActivitiesExtrabudgetary</s:param>
				</s:url>'>Аннотированный каталог</a></li>			
		   </ul>
		</li>
		<li id="Seminar"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivitiesSeminar</s:param>
					<s:param name="parentMenuName">EducationalActivities</s:param>
				</s:url>'>Семинары</a></li>
       </ul>
       </li>
     </ul>
</li>
</ul>
</body>