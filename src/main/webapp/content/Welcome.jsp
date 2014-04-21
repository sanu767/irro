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
		
		    <s:if test='%{#eachSliderItem.eventType.typeId == "N"}'>
			    <s:url id="editUrl" action="../content/LoadSelectedNews">
			      	<s:param name="selectedItemId" value="#eachSliderItem.id" />
			    </s:url>
		    </s:if>
		    <s:elseif test='%{#eachSliderItem.eventType.typeId == "E"}'>
		    	<s:url id="editUrl" action="../LoadSelectedEvent">
			      	<s:param name="selectedItemId" value="#eachSliderItem.id" />
			    </s:url>
		    </s:elseif>
		    <s:elseif test='%{#eachSliderItem.eventType.typeId == "O"}'>
		    	<s:url id="editUrl" action="../LoadSelectedItem">
			      	<s:param name="selectedItemId" value="#eachSliderItem.id" />
			    </s:url>
		    </s:elseif>
		    
		    
			<s:a href="%{editUrl}" class="remove-under">
				<div class="sliderTitle"><s:property value="#eachSliderItem.title" /></div>
				<div class="sliderDate">
					<s:date name="#eachSliderItem.startDate" format="dd/MM/yyyy"/>  - 
					<s:date name="#eachSliderItem.endDate" format="dd/MM/yyyy" />
				</div>
				<div class="sliderShortDescription"><s:property value="#eachSliderItem.description" /></div>
				<img src="<%=request.getContextPath() %>/slider/<s:property value="#eachSliderItem.sliderImage" />" />
			</s:a>
			
		</s:iterator>
	</div>
</div>
