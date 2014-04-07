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
<li id="Institute"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Institute</s:param>
				</s:url>'>Институт</a>
    <ul>
      <li id="Divisions"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Divisions</s:param>
					<s:param name="parentMenuName">Institute</s:param>
				</s:url>'>Отделы</a>
		   <ul>
				<li id="Escort"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsEscort</s:param>
					<s:param name="parentMenuName">Divisions</s:param>
							</s:url>'>Отдел сопровождения конкурсов и инновационных проектов</a>
					<ul>
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsEscortConstitution</s:param>
					<s:param name="parentMenuName">DivisionsEscort</s:param>
							</s:url>'>Состав подразделения</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsEscortNews</s:param>
					<s:param name="parentMenuName">DivisionsEscort</s:param>
							</s:url>'>Новости</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsEscortMaterials</s:param>
					<s:param name="parentMenuName">DivisionsEscort</s:param>
							</s:url>'>Материалы</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsEscortContacts</s:param>
					<s:param name="parentMenuName">DivisionsEscort</s:param>
							</s:url>'>Контакты</a></li>
						
					</ul>
				</li>
				<li id="Editorial"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsEditorial</s:param>
					<s:param name="parentMenuName">Divisions</s:param>
							</s:url>'>Редакционно-издательский отдел</a>
					<ul>
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsEditorialConstitution</s:param>
					<s:param name="parentMenuName">DivisionsEditorial</s:param>
							</s:url>'>Состав подразделения</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsEditorialNews</s:param>
					<s:param name="parentMenuName">DivisionsEditorial</s:param>
							</s:url>'>Новости</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsEditorialMaterials</s:param>
					<s:param name="parentMenuName">DivisionsEditorial</s:param>
							</s:url>'>Материалы</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsEditorialContacts</s:param>
					<s:param name="parentMenuName">DivisionsEditorial</s:param>
							</s:url>'>Контакты</a></li>
						
					</ul>
				</li>

				<li id="CustomerEvaluation"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsCustomerEvaluation</s:param>
					<s:param name="parentMenuName">Divisions</s:param>
							</s:url>'>Отдел сопровождения аттестационных процессов</a>
					<ul>
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsCustomerEvaluationConstitution</s:param>
					<s:param name="parentMenuName">DivisionsCustomerEvaluation</s:param>
							</s:url>'>Состав подразделения</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsCustomerEvaluationNews</s:param>
					<s:param name="parentMenuName">DivisionsCustomerEvaluation</s:param>
							</s:url>'>Новости</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsCustomerEvaluationMaterials</s:param>
					<s:param name="parentMenuName">DivisionsCustomerEvaluation</s:param>
							</s:url>'>Материалы</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsCustomerEvaluationContacts</s:param>
					<s:param name="parentMenuName">DivisionsCustomerEvaluation</s:param>
							</s:url>'>Контакты</a></li>
						
					</ul>
				</li>
				<li id="PostUniversity"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsPostUniversity</s:param>
					<s:param name="parentMenuName">Divisions</s:param>
							</s:url>'>Отдел послевузовского образования</a>
					<ul>
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsPostUniversityConstitution</s:param>
					<s:param name="parentMenuName">DivisionsPostUniversity</s:param>
							</s:url>'>Состав подразделения</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsPostUniversityNews</s:param>
					<s:param name="parentMenuName">DivisionsPostUniversity</s:param>
							</s:url>'>Новости</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsPostUniversityMaterials</s:param>
					<s:param name="parentMenuName">DivisionsPostUniversity</s:param>
							</s:url>'>Материалы</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsPostUniversityContacts</s:param>
					<s:param name="parentMenuName">DivisionsPostUniversity</s:param>
							</s:url>'>Контакты</a></li>
						
					</ul>
				</li>
				<li id="TechSupport"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsTechSupport</s:param>
					<s:param name="parentMenuName">Divisions</s:param>
							</s:url>' >Отдел программно-технического обеспечения</a>
					<ul>
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsTechSupportConstitution</s:param>
					<s:param name="parentMenuName">DivisionsTechSupport</s:param>
							</s:url>'>Состав подразделения</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsTechSupportNews</s:param>
					<s:param name="parentMenuName">DivisionsTechSupport</s:param>
							</s:url>'>Новости</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsTechSupportMaterials</s:param>
					<s:param name="parentMenuName">DivisionsTechSupport</s:param>
							</s:url>'>Материалы</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsTechSupportContacts</s:param>
					<s:param name="parentMenuName">DivisionsTechSupport</s:param>
							</s:url>'>Контакты</a></li>
					</ul>
				</li>
				<li id="Law"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsLaw</s:param>
					<s:param name="parentMenuName">Divisions</s:param>
							</s:url>' >Кадрово-юридический отдел</a>
					<ul>
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsLawConstitution</s:param>
					<s:param name="parentMenuName">DivisionsLaw</s:param>
							</s:url>'>Состав подразделения</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsLawNews</s:param>
					<s:param name="parentMenuName">DivisionsLaw</s:param>
							</s:url>'>Новости</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsLawMaterials</s:param>
					<s:param name="parentMenuName">DivisionsLaw</s:param>
							</s:url>'>Материалы</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsLawContacts</s:param>
					<s:param name="parentMenuName">DivisionsLaw</s:param>
							</s:url>'>Контакты</a></li>
						
					</ul>
				</li>
				<li id="Organization"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsOrganization</s:param>
					<s:param name="parentMenuName">Divisions</s:param>
							</s:url>'>Контрольно-организационный отдел</a>
					<ul>
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsOrganizationConstitution</s:param>
					<s:param name="parentMenuName">DivisionsOrganization</s:param>
							</s:url>'>Состав подразделения</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsOrganizationNews</s:param>
					<s:param name="parentMenuName">DivisionsOrganization</s:param>
							</s:url>'>Новости</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsOrganizationMaterials</s:param>
					<s:param name="parentMenuName">DivisionsOrganization</s:param>
							</s:url>'>Материалы</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DivisionsOrganizationContacts</s:param>
					<s:param name="parentMenuName">DivisionsOrganization</s:param>
							</s:url>'>Контакты</a></li>
						
					</ul>
				</li>
		   </ul>
      </li>
	  <li id="BranchOffice"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">BranchOffice</s:param>
					<s:param name="parentMenuName">Institute</s:param>
				</s:url>'>Филиал и представительства</a>
		  <ul>
		  
			<li id="Nizhny"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">BranchOfficeNizhny</s:param>
					<s:param name="parentMenuName">BranchOffice</s:param>
							</s:url>'>Нижнетагильский филиал ИРО</a></li>
			
			<li id="Kamyshlov"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">BranchOfficeKamyshlov</s:param>
					<s:param name="parentMenuName">BranchOffice</s:param>
							</s:url>'>Представительство ИРО в г. Камышлов</a></li>
			
			<li id="Krasnoufimsk"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">BranchOfficeKrasnoufimsk</s:param>
					<s:param name="parentMenuName">BranchOffice</s:param>
							</s:url>'>Представительство ИРО в г. Красноуфимск</a></li>
			
			<li id="Serov"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">BranchOfficeSerov</s:param>
					<s:param name="parentMenuName">BranchOffice</s:param>
							</s:url>'>Представительство ИРО в г. Серов</a></li>
			
		 </ul>
	  </li>
    </ul>
</li>
</ul>
</body>