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
						<li><a href="DivisionsEscort1">Состав подразделения</a></li>
						<li><a href="DivisionsEscort2">Новости</a></li>
						<li><a href="DivisionsEscort3">Материалы</a></li>
						<li><a href="DivisionsEscort4">Контакты</a></li>
					</ul>
				</li>
				<li id="Editorial"><a href="DivisionsEditorial">Редакционно-издательский отдел</a>
					<ul>
						<li><a href="DivisionsEditorial1">Состав подразделения</a></li>
						<li><a href="DivisionsEditorial2">Новости</a></li>
						<li><a href="DivisionsEditorial3">Материалы</a></li>
						<li><a href="DivisionsEditorial4">Контакты</a></li>
					</ul>
				</li>
				<li id="CustomerEvaluation"><a href="DivisionsCustomerEvaluation">Отдел сопровождения аттестационных процессов</a>
					<ul>
						<li><a href="DivisionsCustomerEvaluation1">Состав подразделения</a></li>
						<li><a href="DivisionsCustomerEvaluation2">Новости</a></li>
						<li><a href="DivisionsCustomerEvaluation3">Материалы</a></li>
						<li><a href="DivisionsCustomerEvaluation4">Контакты</a></li>
					</ul>
				</li>
				<li id="PostUniversity"><a href="DivisionsPostUniversity">Отдел послевузовского образования</a>
					<ul>
						<li><a href="DivisionsPostUniversity1">Состав подразделения</a></li>
						<li><a href="DivisionsPostUniversity2">Новости</a></li>
						<li><a href="DivisionsPostUniversity3">Материалы</a></li>
						<li><a href="DivisionsPostUniversity4">Контакты</a></li>
					</ul>
				</li>
				<li id="TechSupport"><a href="DivisionsTechSupport">Отдел программно-технического обеспечения</a>
					<ul>
						<li><a href="DivisionsTechSupport1">Состав подразделения</a></li>
						<li><a href="DivisionsTechSupport2">Новости</a></li>
						<li><a href="DivisionsTechSupport3">Материалы</a></li>
						<li><a href="DivisionsTechSupport4">Контакты</a></li>
					</ul>
				</li>
				<li id="Law"><a href="DivisionsLaw">Кадрово-юридический отдел</a>
					<ul>
						<li><a href="DivisionsLaw1">Состав подразделения</a></li>
						<li><a href="DivisionsLaw2">Новости</a></li>
						<li><a href="DivisionsLaw3">Материалы</a></li>
						<li><a href="DivisionsLaw4">Контакты</a></li>
					</ul>
				</li>
				<li id="Organization"><a href="DivisionsOrganization">Контрольно-организационный отдел</a>
					<ul>
						<li><a href="DivisionsOrganization1">Состав подразделения</a></li>
						<li><a href="DivisionsOrganization2">Новости</a></li>
						<li><a href="DivisionsOrganization3">Материалы</a></li>
						<li><a href="DivisionsOrganization4">Контакты</a></li>
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