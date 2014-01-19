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
      <li id="Divisions"><a href="Divisions">Отделы</a>
		   <ul>
				<li id="Escort"><a href="DivisionsEscort">Отдел сопровождения конкурсов и инновационных проектов</a>
					<ul>
						<li><a href="DivisionsEscortConstitution">Состав подразделения</a></li>
						<li><a href="DivisionsEscortNews">Новости</a></li>
						<li><a href="DivisionsEscortMaterials">Материалы</a></li>
						<li><a href="DivisionsEscortContacts">Контакты</a></li>
					</ul>
				</li>
				<li id="Editorial"><a href="DivisionsEditorial">Редакционно-издательский отдел</a>
					<ul>
						<li><a href="DivisionsEditorialConstitution">Состав подразделения</a></li>
						<li><a href="DivisionsEditorialNews">Новости</a></li>
						<li><a href="DivisionsEditorialMaterials">Материалы</a></li>
						<li><a href="DivisionsEditorialContacts">Контакты</a></li>
					</ul>
				</li>
				<li id="CustomerEvaluation"><a href="DivisionsCustomerEvaluation">Отдел сопровождения аттестационных процессов</a>
					<ul>
						<li><a href="DivisionsCustomerEvaluationConstitution">Состав подразделения</a></li>
						<li><a href="DivisionsCustomerEvaluationNews">Новости</a></li>
						<li><a href="DivisionsCustomerEvaluationMaterials">Материалы</a></li>
						<li><a href="DivisionsCustomerEvaluationContacts">Контакты</a></li>
					</ul>
				</li>
				<li id="PostUniversity"><a href="DivisionsPostUniversity">Отдел послевузовского образования</a>
					<ul>
						<li><a href="DivisionsPostUniversityConstitution">Состав подразделения</a></li>
						<li><a href="DivisionsPostUniversityNews">Новости</a></li>
						<li><a href="DivisionsPostUniversityMaterials">Материалы</a></li>
						<li><a href="DivisionsPostUniversityContacts">Контакты</a></li>
					</ul>
				</li>
				<li id="TechSupport"><a href="DivisionsTechSupport">Отдел программно-технического обеспечения</a>
					<ul>
						<li><a href="DivisionsTechSupportConstitution">Состав подразделения</a></li>
						<li><a href="DivisionsTechSupportNews">Новости</a></li>
						<li><a href="DivisionsTechSupportMaterials">Материалы</a></li>
						<li><a href="DivisionsTechSupportContacts">Контакты</a></li>
					</ul>
				</li>
				<li id="Law"><a href="DivisionsLaw">Кадрово-юридический отдел</a>
					<ul>
						<li><a href="DivisionsLawConstitution">Состав подразделения</a></li>
						<li><a href="DivisionsLawNews">Новости</a></li>
						<li><a href="DivisionsLawMaterials">Материалы</a></li>
						<li><a href="DivisionsLawContacts">Контакты</a></li>
					</ul>
				</li>
				<li id="Organization"><a href="DivisionsOrganization">Контрольно-организационный отдел</a>
					<ul>
						<li><a href="DivisionsOrganizationConstitution">Состав подразделения</a></li>
						<li><a href="DivisionsOrganizationNews">Новости</a></li>
						<li><a href="DivisionsOrganizationMaterials">Материалы</a></li>
						<li><a href="DivisionsOrganizationContacts">Контакты</a></li>
					</ul>
				</li>
		   </ul>
      </li>
	  <li id="BranchOffice"><a href="BranchOffice">Филиал и представительства</a>
		  <ul>
			<li id="Nizhny"><a href="BranchOfficeNizhny">Нижнетагильский филиал ИРО</a></li>
			<li id="Kamyshlov"><a href="BranchOfficeKamyshlov">Представительство ИРО в г. Камышлов</a></li>
			<li id="Krasnoufimsk"><a href="BranchOfficeKrasnoufimsk">Представительство ИРО в г. Красноуфимск</a></li>
			<li id="Serov"><a href="BranchOfficeSerov">Представительство ИРО в г. Серов</a></li>
		 </ul>
	  </li>
    </ul>
</li>
</ul>
</body>