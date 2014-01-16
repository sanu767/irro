<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<sj:head locale="ru" jquerytheme="lightness" jqueryui="true"/>
<style type="text/css">
.deleteCheckBox{
  width : 10px;
  padding-left : 0px;
  margin-left: 0px;
  
}
</style>
</head> 

<body>
     <s:form action="DeleteItem" theme="xhtml" accept-charset="UTF-8">
	 <display:table name="searchedItems"  defaultsort="2" pagesize="10" sort="list" requestURI="" uid="eachSearchedItem" id="eachSearchedItem">
		  <display:column title="Delete">
		     <!-- <s:checkbox name="deletedItemIds" fieldValue="%{#attr.eachSearchedItem.itemId}" value="false"/>-->
		  </display:column>
		  <display:column property="title" title="Title" sortable="true" style="width : 15px" />
		  <display:column property="startDate" title="Start Date" sortable="true" style="width : 15px" />
		  <display:column property="endDate" title="End Date" sortable="true" style="width : 15px"  />
		  <display:column property="shortDescription" title="Comments" sortable="true" style="width : 15px"  />
    	   <display:column title="Update">
			   <s:url id="editUrl" action="LoadItem">
			      <s:param name="selectedItemIdToModify" value="%{#attr.eachSearchedItem.itemId}" />
			    </s:url>
			    <s:a href="%{editUrl}">
			         Edit
			    </s:a>
          </display:column>
	 </display:table>
	 <sj:submit button="Delete" value="Delete" onClick="return confirm('Do you want to delete these items?');">
	 </sj:submit>
	 </s:form>
</body>
</html>