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
<li id="Certification"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Certification</s:param>
				</s:url>'>Аттестация</a>
     <ul>
      <li id="Employees"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Employees</s:param>
					<s:param name="parentMenuName">Certification</s:param>
				</s:url>'>Аттестация педагогических <br>работников</a>
		<ul>
			<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EmployeesRegulatoryDocument</s:param>
					<s:param name="parentMenuName">Employees</s:param>
				</s:url>'>Нормативные документы</a></li>
			<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EmployeesInformation</s:param>
					<s:param name="parentMenuName">Employees</s:param>
				</s:url>'>Информационно-аналитические материалы (файлы)</a></li>
			<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EmployeesMaterial</s:param>
					<s:param name="parentMenuName">Employees</s:param>
				</s:url>'>Методические материалы (файлы)</a></li>			
		</ul>
      </li>
	  <li id="Graduates"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Graduates</s:param>
					<s:param name="parentMenuName">Certification</s:param>
				</s:url>'>Государственная итоговая <br>аттестация выпускников</a>
       <ul>
        <li id="JEG"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">GraduatesJEG</s:param>
					<s:param name="parentMenuName">Graduates</s:param>
				</s:url>'>ОГЭ</a>
			<ul>
				 <li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">GraduatesJEGRegulatoryDocument</s:param>
					<s:param name="parentMenuName">GraduatesJEG</s:param>
				</s:url>'>Нормативные документы (файлы, ссылки, например: http://www.rustest.ru/ege/docs/)</a></li>
				 <li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">GraduatesJEGStatistics</s:param>
					<s:param name="parentMenuName">GraduatesJEG</s:param>
				</s:url>'>Статистика (текст на странице, файлы, ссылки, например: http://ege.midural.ru/)</a></li>
				 <li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">GraduatesJEGAnalytics</s:param>
					<s:param name="parentMenuName">GraduatesJEG</s:param>
				</s:url>'>Аналитика (файлы, ссылки, например: http://ege.midural.ru/)</a></li>
		   </ul>
		</li>
        <li id="EGE"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">GraduatesEGE</s:param>
					<s:param name="parentMenuName">Graduates</s:param>
				</s:url>'>ЕГЭ</a>
			<ul>
				 <li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">GraduatesEGERegulatoryDocument</s:param>
					<s:param name="parentMenuName">GraduatesEGE</s:param>
				</s:url>'>Нормативные документы (файлы, ссылки, например: http://www.rustest.ru/ege/docs/)</a></li>
				 <li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">GraduatesEGEStatistics</s:param>
					<s:param name="parentMenuName">GraduatesEGE</s:param>
				</s:url>'>Статистика (текст на странице, файлы, ссылки, например: http://ege.midural.ru/)</a></li>
				 <li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">GraduatesEGEAnalytics</s:param>
					<s:param name="parentMenuName">GraduatesEGE</s:param>
				</s:url>'>Аналитика (файлы, ссылки, например: http://ege.midural.ru/)</a></li>
		   </ul>
		</li>
       </ul>
      </li>
    </ul>
</li>
</ul>
</body>