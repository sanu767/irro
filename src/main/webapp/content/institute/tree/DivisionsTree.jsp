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
</head>
<body>
<ul>
<li id="Institute"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">Institute</s:param>
				</s:url>'>Институт</a>
    <ul>
      <li id="Divisions"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">Divisions</s:param>
					<s:param name="parentMenuId">Institute</s:param>
				</s:url>'>Отделы</a>
		   <ul>
				<li id="Escort"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsEscort</s:param>
					<s:param name="parentMenuId">Divisions</s:param>
							</s:url>'>Отдел сопровождения конкурсов и инновационных проектов</a>
					<ul>
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsEscortConstitution</s:param>
					<s:param name="parentMenuId">DivisionsEscort</s:param>
							</s:url>'>Состав подразделения</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsEscortNews</s:param>
					<s:param name="parentMenuId">DivisionsEscort</s:param>
							</s:url>'>Новости</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsEscortMaterials</s:param>
					<s:param name="parentMenuId">DivisionsEscort</s:param>
							</s:url>'>Материалы</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsEscortContacts</s:param>
					<s:param name="parentMenuId">DivisionsEscort</s:param>
							</s:url>'>Контакты</a></li>
						
					</ul>
				</li>
				<li id="Editorial"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsEditorial</s:param>
					<s:param name="parentMenuId">Divisions</s:param>
							</s:url>'>Редакционно-издательский отдел</a>
					<ul>
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsEditorialConstitution</s:param>
					<s:param name="parentMenuId">DivisionsEditorial</s:param>
							</s:url>'>Состав подразделения</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsEditorialNews</s:param>
					<s:param name="parentMenuId">DivisionsEditorial</s:param>
							</s:url>'>Новости</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsEditorialMaterials</s:param>
					<s:param name="parentMenuId">DivisionsEditorial</s:param>
							</s:url>'>Материалы</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsEditorialContacts</s:param>
					<s:param name="parentMenuId">DivisionsEditorial</s:param>
							</s:url>'>Контакты</a></li>
						
					</ul>
				</li>

				<li id="CustomerEvaluation"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsCustomerEvaluation</s:param>
					<s:param name="parentMenuId">Divisions</s:param>
							</s:url>'>Отдел сопровождения аттестационных процессов</a>
					<ul>
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsCustomerEvaluationConstitution</s:param>
					<s:param name="parentMenuId">DivisionsCustomerEvaluation</s:param>
							</s:url>'>Состав подразделения</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsCustomerEvaluationNews</s:param>
					<s:param name="parentMenuId">DivisionsCustomerEvaluation</s:param>
							</s:url>'>Новости</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsCustomerEvaluationMaterials</s:param>
					<s:param name="parentMenuId">DivisionsCustomerEvaluation</s:param>
							</s:url>'>Материалы</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsCustomerEvaluationContacts</s:param>
					<s:param name="parentMenuId">DivisionsCustomerEvaluation</s:param>
							</s:url>'>Контакты</a></li>
						
					</ul>
				</li>
				<li id="PostUniversity"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsPostUniversity</s:param>
					<s:param name="parentMenuId">Divisions</s:param>
							</s:url>'>Отдел послевузовского образования</a>
					<ul>
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsPostUniversityConstitution</s:param>
					<s:param name="parentMenuId">DivisionsPostUniversity</s:param>
							</s:url>'>Состав подразделения</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsPostUniversityNews</s:param>
					<s:param name="parentMenuId">DivisionsPostUniversity</s:param>
							</s:url>'>Новости</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsPostUniversityMaterials</s:param>
					<s:param name="parentMenuId">DivisionsPostUniversity</s:param>
							</s:url>'>Материалы</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsPostUniversityContacts</s:param>
					<s:param name="parentMenuId">DivisionsPostUniversity</s:param>
							</s:url>'>Контакты</a></li>
						
					</ul>
				</li>
				<li id="TechSupport"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsTechSupport</s:param>
					<s:param name="parentMenuId">Divisions</s:param>
							</s:url>' >Отдел программно-технического обеспечения</a>
					<ul>
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsTechSupportConstitution</s:param>
					<s:param name="parentMenuId">DivisionsTechSupport</s:param>
							</s:url>'>Состав подразделения</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsTechSupportNews</s:param>
					<s:param name="parentMenuId">DivisionsTechSupport</s:param>
							</s:url>'>Новости</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsTechSupportMaterials</s:param>
					<s:param name="parentMenuId">DivisionsTechSupport</s:param>
							</s:url>'>Материалы</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsTechSupportContacts</s:param>
					<s:param name="parentMenuId">DivisionsTechSupport</s:param>
							</s:url>'>Контакты</a></li>
					</ul>
				</li>
				<li id="Law"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsLaw</s:param>
					<s:param name="parentMenuId">Divisions</s:param>
							</s:url>' >Кадрово-юридический отдел</a>
					<ul>
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsLawConstitution</s:param>
					<s:param name="parentMenuId">DivisionsLaw</s:param>
							</s:url>'>Состав подразделения</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsLawNews</s:param>
					<s:param name="parentMenuId">DivisionsLaw</s:param>
							</s:url>'>Новости</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsLawMaterials</s:param>
					<s:param name="parentMenuId">DivisionsLaw</s:param>
							</s:url>'>Материалы</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsLawContacts</s:param>
					<s:param name="parentMenuId">DivisionsLaw</s:param>
							</s:url>'>Контакты</a></li>
						
					</ul>
				</li>
				<li id="Organization"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsOrganization</s:param>
					<s:param name="parentMenuId">Divisions</s:param>
							</s:url>'>Контрольно-организационный отдел</a>
					<ul>
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsOrganizationConstitution</s:param>
					<s:param name="parentMenuId">DivisionsOrganization</s:param>
							</s:url>'>Состав подразделения</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsOrganizationNews</s:param>
					<s:param name="parentMenuId">DivisionsOrganization</s:param>
							</s:url>'>Новости</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsOrganizationMaterials</s:param>
					<s:param name="parentMenuId">DivisionsOrganization</s:param>
							</s:url>'>Материалы</a></li>
						
						<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DivisionsOrganizationContacts</s:param>
					<s:param name="parentMenuId">DivisionsOrganization</s:param>
							</s:url>'>Контакты</a></li>
						
					</ul>
				</li>
		   </ul>
      </li>
	  <li id="BranchOffice"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">BranchOffice</s:param>
					<s:param name="parentMenuId">Institute</s:param>
				</s:url>'>Филиал и представительства</a>
		  <ul>
		  
			<li id="Nizhny"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">BranchOfficeNizhny</s:param>
					<s:param name="parentMenuId">BranchOffice</s:param>
							</s:url>'>Нижнетагильский филиал ИРО</a></li>
			
			<li id="Kamyshlov"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">BranchOfficeKamyshlov</s:param>
					<s:param name="parentMenuId">BranchOffice</s:param>
							</s:url>'>Представительство ИРО в г. Камышлов</a></li>
			
			<li id="Krasnoufimsk"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">BranchOfficeKrasnoufimsk</s:param>
					<s:param name="parentMenuId">BranchOffice</s:param>
							</s:url>'>Представительство ИРО в г. Красноуфимск</a></li>
			
			<li id="Serov"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">BranchOfficeSerov</s:param>
					<s:param name="parentMenuId">BranchOffice</s:param>
							</s:url>'>Представительство ИРО в г. Серов</a></li>
			
		 </ul>
	  </li>
    </ul>
</li>
</ul>
</body>