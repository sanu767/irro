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
<h1 style="font-size: 18px;padding-top:50px;">Новости</h1>

<body>
<a id="add" href="AddArticle"><button class="btn btn-primary" type="button" value="Add New" >Add New</button></a>
<div>
<s:iterator value="beans" var="bean">
  <div class="result-document">
		<h4>
      <a href='<s:url action="LoadSelectedArticleNews">
			<s:param name="selectedItemIdToModify" value="#bean.id"></s:param></s:url>'>
			<p>
				<s:property value="#bean.title"/>
			</p>
      </a>
		</h4>
		<span>
      		<s:property value="#bean.description"/>
      	</span>
   </div>
</s:iterator>
<div class="pagination">

<table class="pagination-table">
        <tr>
          <s:if test="%{currentPage != 1}">
        <td><a href='<s:url action="LoadNextArticleNews">
      <s:param name="currentPage" value="%{currentPage - 1}"></s:param>
      </s:url>'>Previous</a></td>
        </s:if> 
            <s:iterator begin="1" end="noOfPages" var="i">
                <s:if test="%{currentPage eq #i}">
                        <td>${i}</td>
                </s:if>
                <s:else>
                        <td><a href="LoadNextArticleNews?currentPage=${i}">${i}</a></td>
                </s:else>
            </s:iterator>
            <s:if test="%{currentPage lt noOfPages}">
        <td><a href='<s:url action="loadNextArticleNews">
      <s:param name="currentPage" value="%{currentPage + 1}"></s:param>
      </s:url>'>Next</a></td>
    </s:if>
        </tr>
    </table>

    </div>
</div>
</body>
</html>