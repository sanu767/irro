<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>

<head>
</head>
<body>
<ul>
<li id="Institute"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">Institute</s:param>
				</s:url>'>Институт</a>
    <ul>
		<li id="Rector"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">Rector</s:param>
					<s:param name="parentMenuId">Institute</s:param>
				</s:url>'>Ректорат</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">RectorMediaReports</s:param>
					<s:param name="parentMenuId">Rector</s:param>
				</s:url>'>Доклады, выступления в СМИ</a></li>
				
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">RectorPublications</s:param>
					<s:param name="parentMenuId">Rector</s:param>
				</s:url>'>Издания и публикации</a></li>
				
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">RectorPhotoGallery</s:param>
					<s:param name="parentMenuId">Rector</s:param>
				</s:url>'>Фотогалерея</a></li>				
			 </ul>
		</li>
		
		<li id="Documents"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">Documents</s:param>
					<s:param name="parentMenuId">Institute</s:param>
				</s:url>'>Документы</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DocumentsLicense</s:param>
					<s:param name="parentMenuId">Documents</s:param>
				</s:url>'>Лицензия</a></li>
				
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DocumentsConstituent</s:param>
					<s:param name="parentMenuId">Documents</s:param>
				</s:url>'>Учредительные документы</a></li>
				
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DocumentsSupervisoryBoard</s:param>
					<s:param name="parentMenuId">Documents</s:param>
				</s:url>'>Документы наблюдательного совета</a></li>
				
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DocumentsPaidEducationalServices</s:param>
					<s:param name="parentMenuId">Documents</s:param>
				</s:url>'>Документы об оказании платных образовательных услуг</a></li>
				
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DocumentsLaborLawRegulations</s:param>
					<s:param name="parentMenuId">Documents</s:param>
				</s:url>'>Документы, регулирующие трудовое право</a></li>
				
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">DocumentsControlMeasures</s:param>
					<s:param name="parentMenuId">Documents</s:param>
				</s:url>'>Документы, составленные по итогам контрольных мероприятий</a></li>
			
			</ul>
		</li>
		<li id="Management"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">Management</s:param>
					<s:param name="parentMenuId">Institute</s:param>
				</s:url>'>Управления</a>
			<ul>
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">InformationResources</s:param>
					<s:param name="parentMenuId">Management</s:param>
				</s:url>'>Управление информационными ресурсами</a></li>
				
				<li><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">ExamAndMonitor</s:param>
					<s:param name="parentMenuId">Management</s:param>
				</s:url>'>Управление экспертизы и мониторинга системы образования</a></li>
			 </ul>
		</li>
		
		<li id="History"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">History</s:param>
					<s:param name="parentMenuId">Institute</s:param>
				</s:url>'>История</a></li>
		
		<li id="Logistics"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">Logistics</s:param>
					<s:param name="parentMenuId">Institute</s:param>
				</s:url>' >Материально-техническое обеспечение</a></li>
		
		<li id="Contacts"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">Contacts</s:param>
					<s:param name="parentMenuId">Institute</s:param>
				</s:url>'>Контакты</a></li>
		
		<li id="Jobs"><a href='<s:url action="../content/LoadArticles">
					<s:param name="menuId">Jobs</s:param>
					<s:param name="parentMenuId">Institute</s:param>
				</s:url>'>Вакансии</a></li>
     </ul>
</li>
</ul>
</body>