<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Event Slider</title>
	
	<script type="text/javascript">
	    $.subscribe('sliderStop', function(event,data) {
	        alert('Slider stop with value : '+event.originalEvent.ui.value);
	    });
	    </script>
</head>

<body>

	<div id="result">Submit form bellow.</div>

	<s:form id="form1" action="echo" theme="xhtml"
		cssStyle="width: 400px; margin: 10px;">
		<sj:slider id="echo1" name="echo" label="Echo" value="70"
			onCompleteTopics="sliderStop" range="min" min="20" max="200" step="5"
			cssStyle="width: 300px; margin: 10px;" />
		<sj:submit id="slidersubmit1" targets="result" value="AJAX Submit"
			indicator="indicator_slider_range" />
		<img id="indicator_slider_range" src="images/DSC_5569.png"
			alt="Loading..." style="display: none" />
	</s:form>
	
	<s:form id="form2" action="echo" theme="xhtml"
		cssStyle="width: 400px; margin: 10px;">
		<sj:slider id="echo2" name="echo" label="Echo" value="120"
			orientation="vertical" onCompleteTopics="sliderStop" range="max"
			min="20" max="200" step="5" cssStyle="height: 200px; margin: 10px;" />
		<sj:submit id="slidersubmit2" targets="result" value="AJAX Submit"
			indicator="indicator_slider_range" />
		<img id="indicator_slider_range" src="images/DSC_5569.png"
			alt="Loading..." style="display: none" />
	</s:form>

</body>

</html> --%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<title><tiles:insertAttribute name="title" ignore="true" /></title>


<link href="themes/slider/js-image-slider.css" rel="stylesheet" type="text/css" />
<script src="themes/slider/mcVideoPlugin.js" type="text/javascript"></script>
<script src="themes/slider/js-image-slider.js" type="text/javascript"></script>

<div id="sliderFrame">
	<div id="slider">
		<a href="#"> <img src="slider/DSC_5569.png"
			alt="Welcome to New Generation images/DSC_5569.png" /> </a> 
			
			<a href="#"> <img
			src="slider/DSC_6335.png" alt="Welcome to the new world of education images/DSC_6335.png" />
		</a> 
		
		<a href="#"> <img src="slider/DSC_6345.png"
			alt="Welcome to the new world of education images/DSC_6345.png" /> </a>
	</div>
</div>
