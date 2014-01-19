<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
a {
  color:rgb(6,85,117);
}
#newsEventswrapper {
    width: 1150px;
	height:100%
    overflow: auto; 
}
#first {
    float: left;
    width: 400px;
    margin: 0 0 0 100px;	
}
#second {
	width: 400px;
    margin: 0 0 0 620px; /* considering the border you need to use a margin so the content does not float under the first div*/
}
</style>
</head>
<body>
<div id="newsEventswrapper">
<div id="first">
<table style="background-color:white">
	<tr style="padding-bottom:10px">
	  <th style="font-weight:700;">Новости<div class="underline"></div></th>	  
	</tr>
	
	
	<s:iterator value="news" id="eachNews">
		<tr>
		  <td style="font-size:14px;font-weight:bold;font-family:'Calibri'"> 
			  <s:property value="#eachNews.startDate" />  - 
			  <s:property value="#eachNews.endDate" /> 
			  <s:property value="#eachNews.title" />
		  </td>
	    </tr>
	    <tr>
			<td style="font-size:14px;">&nbsp;</td>	  
		</tr>
	    <tr>
		  <td style="font-size:14px;font-family:'Calibri'"> <s:property value="#eachNews.shortDescription" /></td>
	    </tr>
	    <tr>
			<td style="font-size:14px;">&nbsp;</td>	  
		</tr>
	    <tr>
		  <td style="font-size:14px;font-family:'Calibri'"> <s:property value="#eachNews.longDescription" /><a href="content/News">&nbsp;ПОДРОБНЕЕ >>></a></td>
	    </tr>		  
	</s:iterator>
	
</table>
</div>

<div id="second">
<table style="background-color:white">
	<tr style="padding-bottom:10px">	  
	  <th style="font-weight:700;">Анонсы<div class="underline"></div></th>
	</tr>
	
	<s:iterator value="events" id="eachEvent">
		<tr>
		  <td style="font-size:14px;font-weight:bold;font-family:'Calibri'"> 
			  <s:property value="#eachEvent.startDate" />  - 
			  <s:property value="#eachEvent.endDate" /> 
			  <s:property value="#eachEvent.title" />
		  </td>
	    </tr>
	    <tr>
			<td style="font-size:14px;">&nbsp;</td>	  
		</tr>
	    <tr>
		  <td style="font-size:14px;font-family:'Calibri'"> <s:property value="#eachEvent.shortDescription" /></td>
	    </tr>
	    <tr>
			<td style="font-size:14px;">&nbsp;</td>	  
		</tr>
	    <tr>
		  <td style="font-size:14px;font-family:'Calibri'"> 
		  	<s:property value="#eachEvent.longDescription" />
		  	<a href="content/News">&nbsp;ПОДРОБНЕЕ >>></a>
		  </td>
	    </tr>
	</s:iterator>
	
</table> 
</div>
</div>
</body>