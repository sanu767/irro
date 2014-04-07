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

.result-document {
  border-bottom: 1px solid #999;
  border-color: rgb(0,0,128);
  padding: 5px;
  margin: 5px;
  margin-left: 5px;
  margin-bottom: 15px;
}

.pagination {
	margin-top: 10px;
}

.result-document div{
  padding: 5px;

}

.result-title{
  width:60%;
}

.result-body{
  background: #00BFFF;
}

.pagination-table {
background: none;

}

.pagination-table td {
  font-weight: bold;
  font-size: 10px;
  width: 1%;

}
</style>
</head> 

<body>


<div class="pagination">
<s:form action="DeleteItems" theme="xhtml" accept-charset="UTF-8" method="post" enctype="multipart/form-data" style="backgound:white" cssClass="pagination-table">
<display:table name="searchedItems" defaultsort="2" pagesize="3" sort="list" requestURI="" uid="bean" id="bean">
	
	<display:column title="Delete">
		<input type="checkbox" name="checkedId" value="${bean.rowId}">
	</display:column>
	<display:column property="title" title="Title" sortable="true" style="width : 15px" />
    <display:column property="startDate" title="Start Date" sortable="true" style="width : 15px" />
	<display:column property="endDate" title="End Date" sortable="true" style="width : 15px"  />
	<display:column property="description" title="Comments" sortable="true" style="width : 15px"  />
 	<display:column title="Update">
	   <s:if test='%{#attr.bean.eventType.typeId == "N"}'>
		    <a href="<s:url action="LoadSelectedNews">
		     		<s:param name="selectedItemId" value="%{#attr.bean.id}"></s:param>
		     		</s:url>"> Edit </a>
	    </s:if>
	    <s:elseif test='%{#attr.bean.eventType.typeId == "E"}'>
		     <a href="<s:url action="LoadSelectedEvent">
		     		<s:param name="selectedItemId" value="%{#attr.bean.id}"></s:param>
		     		</s:url>"> Edit </a>
	    </s:elseif>
	    <s:else>
		     <a href="<s:url action="LoadSelectedItem">
		     		<s:param name="selectedItemId" value="%{#attr.bean.id}"></s:param>
		     		</s:url>"> Edit </a>
	    </s:else>
    </display:column>
    
</display:table>

<sj:submit style="float:right;height : 25px;margin: 20px 30px 0px 0px;" button="Delete" value="Delete" onClick="return confirm('Do you want to delete these Items?');" />
		
</s:form>

</div>
</body>
</html>