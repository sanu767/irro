<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<sj:head locale="ru" jquerytheme="lightness" jqueryui="true"/>
	<style type="text/css">
	.errors {
		background-color:#FFCCCC;
		border:1px solid #CC0000;
		width:400px;
		margin-bottom:8px;
	}
	.errors li{
		list-style: none;
	}
    </style>
</head> 

<body>



<s:file name="upload" label="Name of downloadable file"  cssErrorClass="errors" />
<s:a href="<%=request.getContextPath() %>/admin/UploadFile"> </s:a>
	
</body>
</html>