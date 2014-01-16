<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<sj:head locale="ru" jquerytheme="lightness" jqueryui="true"/>
<script src="content/jquery-1.10.2.js"></script>
<script type="text/javascript">
$(document).ready(function(){	 
    $("#advancedSearchForm").hide();
    $("#showAdvancedSearchForm").show();
	$('#showAdvancedSearchForm').click(function(){
	$("#advancedSearchForm").slideToggle();
	return false;
	});

});
</script>
<style>
.myClass{
 background-colour : white
}
</style>

</head> 

<body>
    <div style="width : 250px;colour : white !important">
		 <s:form action="SearchItem" theme="xhtml" accept-charset="UTF-8" cssClass="myClass">
			<sj:textfield name="itemBean.searchText" label="Title " maxlength="100" required="true" placeholder="Enter title" />
			<sj:submit button="Search" value="Search" />		
		</s:form>
		<a href="#" id="showAdvancedSearchForm">Advanced Search</a>	
	</div>
	
	<div id="advancedSearchForm">
	<s:form action="AdvancedSearchItem" theme="xhtml" accept-charset="UTF-8">
	    
	    <sj:textfield name="itemBean.searchText" label="Title " maxlength="100" placeholder="Enter title" />
		
		<s:radio name="itemBean.searchType" label=" Select Item  "
			list="#{'1':'News', '2':'Events', '3':'Others'}"
			value="1" />

		<sj:datepicker name="itemBean.beforeSearchDate" label="Before "
			changeYear="true" changeMonth="true" showOn="focus" />

		<sj:datepicker name="itemBean.afterSearchDate" label="After "
			changeYear="true" changeMonth="true" showOn="focus" />
				
		<sj:submit button="Search" value="Search"/>	
	</s:form>	
	</div>
	
</body>
</html>