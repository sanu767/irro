<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>

<head>
<script type="text/javascript">
window.onload = function () {     
	//Getting First Level children	
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
			anewchildren.style.fontWeight="bold";	
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
<li id="Institute"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Institute</s:param>
				</s:url>'>Институт</a>
    <ul>
		<li id="Rector"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Rector</s:param>
					<s:param name="parentMenuName">Institute</s:param>
				</s:url>'>Ректорат</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">RectorMediaReports</s:param>
					<s:param name="parentMenuName">Rector</s:param>
				</s:url>'>Доклады, выступления в СМИ</a></li>
				
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">RectorPublications</s:param>
					<s:param name="parentMenuName">Rector</s:param>
				</s:url>'>Издания и публикации</a></li>
				
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">RectorPhotoGallery</s:param>
					<s:param name="parentMenuName">Rector</s:param>
				</s:url>'>Фотогалерея</a></li>				
			 </ul>
		</li>
		
		<li id="Documents"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Documents</s:param>
					<s:param name="parentMenuName">Institute</s:param>
				</s:url>'>Документы</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DocumentsLicense</s:param>
					<s:param name="parentMenuName">Documents</s:param>
				</s:url>'>Лицензия</a></li>
				
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DocumentsConstituent</s:param>
					<s:param name="parentMenuName">Documents</s:param>
				</s:url>'>Учредительные документы</a></li>
				
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DocumentsSupervisoryBoard</s:param>
					<s:param name="parentMenuName">Documents</s:param>
				</s:url>'>Документы наблюдательного совета</a></li>
				
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DocumentsPaidEducationalServices</s:param>
					<s:param name="parentMenuName">Documents</s:param>
				</s:url>'>Документы об оказании платных образовательных услуг</a></li>
				
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DocumentsLaborLawRegulations</s:param>
					<s:param name="parentMenuName">Documents</s:param>
				</s:url>'>Документы, регулирующие трудовое право</a></li>
				
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DocumentsControlMeasures</s:param>
					<s:param name="parentMenuName">Documents</s:param>
				</s:url>'>Документы, составленные по итогам контрольных мероприятий</a></li>
			
			</ul>
		</li>
		<li id="Management"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Management</s:param>
					<s:param name="parentMenuName">Institute</s:param>
				</s:url>'>Управления</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">InformationResources</s:param>
					<s:param name="parentMenuName">Management</s:param>
				</s:url>'>Управление информационными ресурсами</a></li>
				
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">ExamAndMonitor</s:param>
					<s:param name="parentMenuName">Management</s:param>
				</s:url>'>Управление экспертизы и мониторинга системы образования</a></li>
			 </ul>
		</li>
		
		<li id="History"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">History</s:param>
					<s:param name="parentMenuName">Institute</s:param>
				</s:url>'>История</a></li>
		
		<li id="Logistics"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Logistics</s:param>
					<s:param name="parentMenuName">Institute</s:param>
				</s:url>' >Материально-техническое обеспечение</a></li>
		
		<li id="Contacts"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Contacts</s:param>
					<s:param name="parentMenuName">Institute</s:param>
				</s:url>'>Контакты</a></li>
		
		<li id="Jobs"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Jobs</s:param>
					<s:param name="parentMenuName">Institute</s:param>
				</s:url>'>Вакансии</a></li>
     </ul>
</li>
</ul>
</body>