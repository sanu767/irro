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
    <div style="margin : 10px 0px 0px 10px">
       <h1 style="font-size: 18px;font-family: 'Open Sans';">Search</h1>
		 <s:form action="SearchItem" theme="xhtml" accept-charset="UTF-8" cssClass="myClass">
			<sj:textfield name="itemSearchBean.searchText" label="Title " maxlength="100" required="true" placeholder="Enter title" />
			<sj:submit style="float:right;height : 25px;margin: 5px 0px 0px 0px;" button="Search" value="Search" />		
		</s:form>
		
		<a href="#" id="showAdvancedSearchForm" style="text-decoration:none;color : black;font-size: 16px;font-weight:bold;font-family: 'Open Sans';">Advanced Search</a>
		
		
		
	<div id="advancedSearchForm" style="margin : 5px 0px 0px 0px;">
	<s:form action="AdvancedSearchItem" theme="xhtml" accept-charset="UTF-8">
	    
	    <sj:textfield name="itemSearchBean.searchText" label="Title " maxlength="100" placeholder="Enter title" />
		
		<s:radio name="itemSearchBean.searchType" label=" Select Item  "  value="1"	list="#{'1':'News', '2':'Events', '3':'Others'}"
			/>

		<sj:datepicker displayFormat="dd.mm.yy" name="itemSearchBean.beforeSearchDate" label="Before "
			changeYear="true" changeMonth="true" showOn="focus" />

		<sj:datepicker displayFormat="dd.mm.yy" name="itemSearchBean.afterSearchDate" label="After " 
			changeYear="true" changeMonth="true" showOn="focus" />
				
		<sj:submit style="float:right;height : 25px;margin: 5px 0px 0px 0px;" button="Search" value="Search"/>	

	</s:form>	
	</div>
	
	<div style="padding : 20px 0px 0px 0px">
	  <a href="LoadCreateItem" style="text-decoration:none;color : rgb(6,85,117);font-size: 16px;font-family: 'Open Sans';">Create Item</a>
	</div>
	
	<div style="padding : 25px 0px 0px 0px">
	  <a href="LoadCreateEvent" style="text-decoration:none;color : rgb(6,85,117);font-size: 16px;font-family: 'Open Sans';">Create Event</a>
	</div>
	
	<div style="padding : 30px 0px 0px 0px">
	  <a href="LoadCreateNews" style="text-decoration:none;color : rgb(6,85,117);font-size: 16px;font-family: 'Open Sans';">Create News</a>
	</div>
	
	
	</div>
	
</body>
</html>