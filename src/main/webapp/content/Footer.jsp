<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<head>

<style>
table
{
border-collapse:collapse;
background-color:rgb(198,217,241);
width:100%;
height:80px;
float:left;
padding-top:10px;
}
 
th  {
  width:20%;
  text-align:left;
  color:rgb(0,0,0);
  border-bottom-width:10px;
  
}

td
{
width:20%;
text-align:left;
color:rgb(0,0,0);
}
</style>
</head>
<body>
<div id="followus">
<div>
<a href="http://www.facebook.com" target="_blank" title="Facebook">
<img class="thumbnail" src="../followus/fbIcon.png" border="0" alt="fb" width="16" height="16" />
</a>
</div>

<div>
<a href="https://www.plus.google.com" target="_blank" title="Google+">
<img class="thumbnail" src="../followus/gpIcon.png" border="0" alt="g+" width="32" height="32" />
</a>
</div>

<div>
<a href="http://www.linkedin.com" target="_blank" title="Linkedin">
<img class="thumbnail" src="../followus/lnIcon.png" border="0" alt="ln" width="32" height="32" />
</a>
</div>


<div>
<a href="http://www.twitter.com" target="_blank" title="Twitter">
<img class="thumbnail" src="../followus/twIcon.png" border="0" alt="tw" width="32" height="32" />
</a>
</div>

<div>
<a href="http://www.youtube.com" target="_blank" title="YouTube">
<img class="thumbnail" src="../followus/ytIcon.png" border="0" alt="yt" width="32" height="32" />
</a>
</div>
</div>

<div style="padding-top:10px;padding-left:100px">
<table style="width:1000px">
  <tr style="padding-bottom:10px">
  
    <th style="font-weight:bold;font-size:14px" ><a style="font-weight:bold;font-size:14px;color:black;" href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Institute</s:param>
				</s:url>' >Об Институте</a></th>
				
    <th style="font-weight:bold;font-size:14px"><a style="font-weight:bold;font-size:14px;color:black;" href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Activities</s:param>
				</s:url>'> Деятельность</a></th>
				
    <th style="font-weight:bold;font-size:14px"><a style="font-weight:bold;font-size:14px;color:black;" href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivitiesInternship</s:param>
					<s:param name="parentMenuName">EducationalActivities</s:param>
				</s:url>'>Стажировочная площадка</a></th>
				
	<th style="font-weight:bold;font-size:14px"><a style="font-weight:bold;font-size:14px;color:black;" href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Centers</s:param>
					<s:param name="parentMenuName">Institute</s:param>
				</s:url>'>Центры</a></th>
				
    <th style="font-weight:bold;font-size:14px"><a style="font-weight:bold;font-size:14px;color:black;" href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">BranchOffice</s:param>
					<s:param name="parentMenuName">Institute</s:param>
				</s:url>'>Мероприятия</a></th>   
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
 
 <tr >
    <td style="font-size:10px">
      <a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Rector</s:param>
					<s:param name="parentMenuName">Institute</s:param>
				</s:url>'>Ректорат</a>
    </td>
    <td style="font-size:10px">
      <a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">EducationalActivities</s:param>
					<s:param name="parentMenuName">Activities</s:param>
				</s:url>'>Образовательная деятельность</a>
    </td>
    <td style="font-size:10px">
      <a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Basic</s:param>
					<s:param name="parentMenuName">Projects</s:param>
				</s:url>'>Базовые площадки</a>
    </td>
    
    <td style="font-size:10px">
      <a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersLibrary</s:param>
					<s:param name="parentMenuName">Centers</s:param>
							</s:url>'>Библиотечно-информационный центр</a>
    </td>
    
    <td style="font-size:10px">
      <a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">BranchOffice</s:param>
					<s:param name="parentMenuName">Institute</s:param>
				</s:url>'>Филиал и Представительства</a>
      </td>
    
    <td>&nbsp;</td>
  </tr>
  
 <tr>
   <td style="font-size:10px">
      <a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">History</s:param>
					<s:param name="parentMenuName">Institute</s:param>
				</s:url>'>Вехи истории</a>
    </td>
    <td style="font-size:10px">
      <a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Certification</s:param>
				</s:url>'>Аттестация</a>
    </td>
    <td style="font-size:10px">
      <a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersAdministrationMaterials</s:param>
					<s:param name="parentMenuName">CentersAdministration</s:param>
							</s:url>'>Методические материалы</a>
    </td>
    <td style="font-size:10px">
      <a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersLibraryPublications</s:param>
					<s:param name="parentMenuName">CentersLibrary</s:param>
							</s:url>'>Издания и публикации ИРО</a>
    </td>
    <td style="font-size:10px">&nbsp;</td>
  </tr>
  
 <tr>
    <td style="font-size:10px">
      <a href='http://irro-new.irro.ru/welcomeIrro'>Администрация</a>
    </td>
    
    <td style="font-size:10px">
    	<a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">GraduatesEGE</s:param>
					<s:param name="parentMenuName">Graduates</s:param>
							</s:url>'>ЕГЭ</a>
    </td>
    
    <td style="font-size:10px">
      <a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Documents</s:param>
					<s:param name="parentMenuName">Institute</s:param>
				</s:url>'>Документы</a>
      </td>
      
	<td style="font-size:10px">
    <a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">DepartmentsVocationalService</s:param>
					<s:param name="parentMenuName">DepartmentsVocational</s:param>
							</s:url>'>Методическая копилка</a>
  </td>
  
	<td>&nbsp;</td>
    
  </tr>
  
   <tr>
    <td style="font-size:10px">
      <a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Contacts</s:param>
					<s:param name="parentMenuName">Institute</s:param>
				</s:url>'>Структура</a>
    </td>
    <td style="font-size:10px">
      <a href="">ГИА-9</a>
    </td>
    <td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
    
  </tr>
    <tr>
    <td style="font-size:10px">
      <a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">BranchOffice</s:param>
					<s:param name="parentMenuName">Institute</s:param>
				</s:url>'>Филиал и Представительства</a>
      </td>
    <td style="font-size:10px">
      <a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Contests</s:param>
					<s:param name="parentMenuName">Activities</s:param>
				</s:url>'>Конкурсы, олимпиады</a>
    </td>
    <td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
  </tr>
  
  <tr>
    <td style="font-size:10px">
      <a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Contacts</s:param>
					<s:param name="parentMenuName">Institute</s:param>
				</s:url>'>Контакты</a>
    </td>
    <td style="font-size:10px">
      <a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">Conference</s:param>
					<s:param name="parentMenuName">Activities</s:param>
				</s:url>'>Конференции</a>
    </td>
    <td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>  
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td style="font-size:10px">
      <a href='<s:url action="../content/LoadArticles">
					<s:param name="menuName">CentersLibraryEducationalPublishing</s:param>
					<s:param name="parentMenuName">CentersLibrary</s:param>
							</s:url>'>Издательская деятельность</a>
      </td>
    <td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td style="font-size:10px">
      <a href="">Научные исследования</a>
    </td>
    <td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
  </tr>
  <tr style="background-color:rgb(6,85,117);">
    <td>&nbsp;</td> 
	<td>&nbsp;</td> 
	<td>&nbsp;</td> 
	<td>&nbsp;</td> 
	<td></td> 	
  </tr>
  
</table>
</div>
</body>