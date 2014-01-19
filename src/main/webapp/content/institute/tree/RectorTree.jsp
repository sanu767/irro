﻿<head>
<script type="text/javascript">
window.onload = function () {     
	//Getting First Level children	
	var selectedElem = document.getElementById('Institute');
	selectedElem.className = "makeBold";
		if(selectedElem != null ) {
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


	//highlight selected menu	
	var selectedMenuElem = document.getElementById(document.title);
		if(selectedMenuElem != null ) {
		var achildren = selectedMenuElem.children;	
		if(achildren != null && achildren.length > 0) {
			var anewchildren = achildren[0];
			anewchildren.style.color="black";	
		}
	}	
};
</script>
<style>
ul li {
    margin-left: 20px !important;
}

</style>
</head>
<body>
<ul>
<li id="Institute"><a href="Institute">Институт</a>
    <ul>
		<li id="Rector"><a href="Rector">Ректор</a>
			<ul>
				<li><a href="RectorMediaReports">Доклады, выступления в СМИ</a></li>
				<li><a href="RectorPublications">Издания и публикации</a></li>
				<li><a href="RectorPhotoGallery">Фотогалерея</a></li>				
			 </ul>
		</li>
		<li id="Documents"><a href="Documents">Документы</a>
			<ul>
				<li><a href="DocumentsLicense">Лицензия</a></li>
				<li><a href="DocumentsConstituent">Учредительные документы</a></li>
				<li><a href="DocumentsSupervisoryBoard">Документы наблюдательного совета</a></li>
				<li><a href="DocumentsPaidEducationalServices">Документы об оказании платных образовательных услуг</a></li>
				<li><a href="DocumentsLaborLawRegulations">Документы, регулирующие трудовое право</a></li>
				<li><a href="DocumentsControlMeasures">Документы, составленные по итогам контрольных мероприятий</a></li>				
			</ul>
		</li>
		<li id="History"><a href="History">История</a></li>
		<li id="Logistics"><a href="Logistics">Материально-техническое обеспечение</a></li>
		<li id="Contacts"><a href="Contacts">Контакты</a></li>
		<li id="Jobs"><a href="Jobs">Вакансии</a></li>
     </ul>
</li>
</ul>
</body>