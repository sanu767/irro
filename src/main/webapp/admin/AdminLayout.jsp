<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title><tiles:insertAttribute name="title" ignore="true" /></title>

<script src="/content/jquery-1.10.2.js"></script>
<script type="text/javascript">
$(function() {

$('li').hover(
       function(){ $(this).addClass('showlinks') },
       function(){ $(this).removeClass('showlinks') }
)

}); 

</script>
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

