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
<body>
<ul>
<li id="Activities"><a href="Activities">Деятельность</a>
     <ul>
      <li id="Contests"><a href="Contests">Конкурсы
       <ul>
        <li id="Staff"><a href="ContestsStaff">для педагогических <br>работников</a></li>
        <li id="Organization"><a href="ContestsOrganization">для образовательных <br>организаций</a></li>
		<li id="Learner"><a href="ContestsLearner">для обучающихся</a></li>
       </ul>
      </li>
	  <li id="Olympics"><a href="Olympics">Олимпиады</a>
       <ul>
        <li id="AllRussia"><a href="OlympicsAllRussia">Всероссийская олимпиада школьников</a></li>
        <li id="School"><a href="OlympicsSchool">Предметные олимпиады школьников</a></li>		
       </ul>
      </li>
     </ul>
</li>
</ul>
</body>