<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.apache.commons.collections.CollectionUtils"%>
<%@page import="java.util.List"%>
<%@page import="com.saasforedu.irro.article.action.Menu"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib prefix="sfe" uri="/saas-edu-tags"%>


<html>
<head>
<style>
.leftmenu {

}

.leftmenu ul li {
    margin-left: 20px;
 }

a {
	font-family: "Calibri";
	color: rgb(127, 127, 127);
}

.selection {
	color: rgb(83, 103, 168);
}
</style>
</head>
<body>
	<div class="leftmenu">
		<ul>
			<sfe:tree cssSelection="selection" href="../content/"
				menu="menu" ></sfe:tree>
		</ul>
	</div>
</body>

</html>