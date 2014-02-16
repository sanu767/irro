<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<sj:head locale="ru" jquerytheme="lightness" jqueryui="true"/>

<title><tiles:insertAttribute name="title" ignore="true" /></title>

	<script src="../content/jquery-1.10.2.js"></script>
	<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" type="text/css" />
	<link rel="stylesheet" href="../bootstrap/css/bootstrap-multiselect.css" type="text/css"/>
	
	<!-- Include Twitter Bootstrap and jQuery: -->
	<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
	 
	<!-- Include the plugin's CSS and JS: -->
	<script type="text/javascript" src="../bootstrap/js/bootstrap-multiselect.js"></script>

<style>
#wrapper {
	margin: 0px auto; width: 1150px;
}
#navigationwrap {
	margin: 0px auto; 
	width: 1150px; 
	float: right;
	border-top: 10px solid rgb(6, 85, 117);
	border-bottom: 10px solid rgb(6, 85, 117);
}
.logo 
{

float:left;
width:100px;
height:100px;
padding-top:5px;
}

#first {
    float: left;
    width: 150px;
	height : 500px;
	border-right: 1px solid rgb(6, 85, 117);
	border-bottom: 1px solid rgb(6, 85, 117);
}

#second {
	width: 400px;
	height : 500px;
	float: left;
    margin: 0 0 0 0; /* considering the border you need to use a margin so the content does not float under the first div*/
	border-right: 1px solid rgb(6, 85, 117);
	border-bottom: 1px solid rgb(6, 85, 117);
}

#third {
	width: 595px;
    height : 500px;
	float: left;
	border-bottom: 1px solid rgb(6, 85, 117);
}

</style>
</head>
<body>
<div id="wrapper">
		
     <div id="navigationwrap">
	   <a href="ChangeMenus"  title="IRRO">
			<img class="logo" src="images/logo/irrologo.png" border="0" alt="Home" />
	   </a> 
	   <h1 style="text-align : center">Welcome to Irro Administrator</h1>
     </div>

<div id="first">
	<tiles:insertAttribute name="searchGroupMenus" />
</div>

<div id="second">
	<tiles:insertAttribute name="searchParameterSubMenus" />
</div>

<div id="third">
	<tiles:insertAttribute name="result" />
</div>

</div>

</body>
</html>

