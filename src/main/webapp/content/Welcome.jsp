<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
a div.sliderTitle {
	position:relative; 
	left:61px;
	top:80px; 
	width: 319px;
	font-size:36px;
	color : white;
	z-index:1;
}

a div.sliderDate {
	position:relative; 
	left:61px;
	top:100px; 
	width: 319px;
	font-size:24px;
	color : white;
	z-index:1;
}

a div.sliderShortDescription {
	position:relative; 
	left:61px;
	top:100px; 
	width: 319px;
	font-size:30px;
	color : white;
	z-index:1;
}

.remove-under {
	text-decoration: none;
}
</style>
</head>

<div id="sliderFrame">
    <div id="slider">
		<s:iterator value="#application['SliderItems']" id="eachSliderItem">
			<a href="#" class="remove-under">
				<div class="sliderTitle"><s:property value="#eachSliderItem.title" /></div>
				<div class="sliderDate">
					<s:property value="#eachSliderItem.startDate" />  - 
					<s:property value="#eachSliderItem.endDate" />
				</div>
				<div class="sliderShortDescription"><s:property value="#eachSliderItem.shortDescription" /></div>
				<img src="../slider/<s:property value="#eachSliderItem.image" />" />
			</a>
		</s:iterator>
	</div>
</div>
