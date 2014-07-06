﻿<head>
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
<li id="Certification"><a href="Certification">Аттестация</a>
     <ul>
      <li id="Employees"><a href="Employees">Аттестация педагогических <br>работников</a>
		<ul>
			<li><a href="Employees1">Нормативные документы</a></li>
			<li><a href="Employees2">Информационно-аналитические материалы (файлы)</a></li>
			<li><a href="Employees3">Методические материалы (файлы)</a></li>			
		</ul>
      </li>
	  <li id="Graduates"><a href="Graduates">Государственная итоговая <br>аттестация выпускников</a>
       <ul>
        <li id="JEG"><a href="GraduatesJEG">ОГЭ</a>
			<ul>
				 <li><a href="GraduatesJEG1">Нормативные документы (файлы, ссылки, например: http://www.rustest.ru/ege/docs/)</a></li>
				 <li><a href="GraduatesJEG2">Статистика (текст на странице, файлы, ссылки, например: http://ege.midural.ru/)</a></li>
				 <li><a href="GraduatesJEG3">Аналитика (файлы, ссылки, например: http://ege.midural.ru/)</a></li>
		   </ul>
		</li>
        <li id="EGE"><a href="GraduatesEGE">ЕГЭ</a>
			<ul>
				 <li><a href="GraduatesEGE1">Нормативные документы (файлы, ссылки, например: http://www.rustest.ru/ege/docs/)</a></li>
				 <li><a href="GraduatesEGE2">Статистика (текст на странице, файлы, ссылки, например: http://ege.midural.ru/)</a></li>
				 <li><a href="GraduatesEGE3">Аналитика (файлы, ссылки, например: http://ege.midural.ru/)</a></li>
		   </ul>
		</li>
       </ul>
      </li>
    </ul>
</li>
</ul>
</body>