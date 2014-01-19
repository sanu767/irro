<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
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
<li id="Activities"><a href="Activities">Деятельность</a>
     <ul>
      <li id="Conference"><a href="Conference">Конференции</a>
       <ul>
			<li id="International"><a href="ConferenceInternational">Международные</a></li>
			<li id="Russia"><a href="ConferenceRussia">Всероссийские</a></li>
			<li id="Regional"><a href="ConferenceRegional">Региональные</a></li>
			<li id="Oblastnyye"><a href="ConferenceOblastnyye">Областные</a></li>			
       </ul>
      </li>
     </ul>
</li>
</ul>
</body>