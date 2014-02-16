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
				<img src="slider/<s:property value="#eachSliderItem.image" />" alt="Welcome to New Generation" />
			</a>
		</s:iterator>
	</div>
</div>

<!-- <div id="sliderFrame">
        <div id="slider">
            <a href="#" class="remove-under">
			    <div class="sliderTitle">This is Title </div>
                <img src="slider/DSC_5569.png" alt="Welcome to New Generation" />
            </a>
            <a href="#">
                <img src="slider/DSC_6335.png" alt="Welcome to the new world of education" />
            </a>
			<a href="#">
                <img src="slider/DSC_6345.png" alt="Welcome to the new world of education" />
            </a>
			<a href="#">
                <img src="slider/DSC_6500.png" alt="Welcome to New ERA" />
            </a>
			<a href="#">
                <img src="slider/DSC_6660.png" alt="Welcome to New ERA" />
            </a>
			<a href="#">NO
                <img src="../slider/DSC_6668.png" alt="Welcome to New ERA" />
            </a>
			<a href="#">
                <img src="slider/IMG_0226.png" alt="Welcome to New ERA" />
            </a>
			<a href="#">
                <img src="slider/IMG_0249.png" alt="Welcome to New ERA" />
            </a>
			<a href="#">
                <img src="slider/IMG_0351.png" alt="Welcome to New ERA" />
            </a>
			<a href="#">
                <img src="slider/IMG_0365.png" alt="Welcome to New ERA" />
            </a>
			<a href="#">
                <img src="slider/IMG_0392.png" alt="Welcome to New ERA" />
            </a>	
			<a href="#">NO
                <img src="../slider/IMG_0411.png" alt="Welcome to New ERA" />
            </a>
			<a href="#">
                <img src="slider/IMG_0973.png" alt="Welcome to New ERA" />
            </a>
			<a href="#">NO
                <img src="../slider/IMG_1468.png" alt="Welcome to New ERA" />
            </a>
			<a href="#">NO
                <img src="../slider/IMG_2235.png" alt="Welcome to New ERA" />
            </a>
			<a href="#">NO
                <img src="../slider/IMG_8106.png" alt="Welcome to New ERA" />
            </a>
			<a href="#">NO
                <img src="../slider/IMG_8112.png" alt="Welcome to New ERA" />
            </a>
			<a href="#">
                <img src="slider/IMG_8845.png" alt="Welcome to New ERA" />
            </a>
			<a href="#">
                <img src="slider/IMG_8949.png" alt="Welcome to New ERA" />
            </a>
			<a href="#">NO
                <img src="../slider/IMG_8977.png" alt="Welcome to New ERA" />
            </a>
			<a href="#">NO
                <img src="../slider/IMG_9449.png" alt="Welcome to New ERA" />
            </a>
			<a href="#">
                <img src="slider/IMG_9673.png" alt="Welcome to New ERA" />
            </a>
			<a href="#">
                <img src="slider/P4190076.png" alt="Welcome to New ERA" />
            </a>
		</div>
 </div> -->
