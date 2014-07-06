﻿<head>
<script type="text/javascript">
window.onload = function () {     
	//Getting First Level children	
	var selectedElem = document.getElementById('Institute');
	selectedElem.className = "makeBold";
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
		<li id="Rector"><a href="Rector">Ректор</a>
			<ul>
				<li><a href="Rector1">Доклады, выступления в СМИ</a></li>
				<li><a href="Rector2">Издания и публикации</a></li>
				<li><a href="Rector3">Фотогалерея</a></li>				
			 </ul>
		</li>
		<li id="Documents"><a href="Documents">Документы</a>
			<ul>
				<li><a href="Documents1">Лицензия</a></li>
				<li><a href="Documents2">Учредительные документы</a></li>
				<li><a href="Documents3">Документы наблюдательного совета</a></li>
				<li><a href="Documents4">Документы об оказании платных образовательных услуг</a></li>
				<li><a href="Documents5">Документы, регулирующие трудовое право</a></li>
				<li><a href="Documents6">Документы, составленные по итогам контрольных мероприятий</a></li>				
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