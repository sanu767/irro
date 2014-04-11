<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<link href="../menucss/styles.css" rel="stylesheet" type="text/css"></link>
<link href="../menucss/mainmenu.css" rel="stylesheet" type="text/css"></link>
<link href="../mainLayout.css" rel="stylesheet" type="text/css"></link>
<link href="../reset.css" rel="stylesheet" type="text/css"></link>
<link href="../themes/slider/js-image-slider.css" rel="stylesheet" type="text/css" />
<script src="../themes/slider/mcVideoPlugin.js" type="text/javascript"></script>
<script src="../themes/slider/js-image-slider.js" type="text/javascript"></script>
<link href="../generic.css" rel="stylesheet" type="text/css" />
<script src="../themes/content/Tree.js" type="text/javascript"></script> 
<link href="welcomepagecontent.css" rel="stylesheet" type="text/css" />
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="jquery-1.10.2.js"></script>
<script type="text/javascript"> 
window.onload = function () {     
	window.location.hash = 'tree';
};
</script>

<script type="text/javascript">
$(function(){

$('li').hover(
       function(){ $(this).addClass('showlinks') },
       function(){ $(this).removeClass('showlinks') }
)

}); 

</script>

<style>
.thumbnail 
{

float:left;
width:16px;
height:16px;
margin:0.5px;
padding:3px;
}
.logo 
{

float:left;
width:100px;
height:100px;
padding-top:5px;
}

ul li a {
 font-family : "Calibri";
 color : rgb(127,127,127);
 text-decoration: none;
}
</style>
</head>
<body>
<div id="wrapper">
		<div id="headerwrap">
			<div id="header">
				<tiles:insertAttribute name="header" />			
			</div>
			<div id="search">
				<tiles:insertAttribute name="search" />
			</div>
        </div>		
      
	   <div id="navigationwrap">
		   <a href="../welcomeIrro"  title="IRRO">
					<img class="logo" src="../images/logo/irrologo.png" border="0" alt="Home" />
			</a>	
			<div id="navigation">
				 <tiles:insertAttribute name="upperMenu" />			 
			</div>			 
        </div>
      
	   <div id="contentliquid">
			<div id="contentwrap">
				<div class="top">				
				   <tiles:insertAttribute name="mainMenu" />
				</div>
				<div id="content">				     
				   <tiles:insertAttribute name="slider" />
				</div>
			</div>
		</div>
		
		<div id="mainContentwrapper">
           <div id="tree">		
				<tiles:insertAttribute name="tree"></tiles:insertAttribute>
			</div>
			<div id="editableContent">
				<tiles:insertAttribute name="content" />
			</div>
		</div>
       
	  <div id="footerwrap">
		<div id="footer">
			<tiles:insertAttribute name="footer" />      
		</div>
      </div>
</div>
</body>
</html>
