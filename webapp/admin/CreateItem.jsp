<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<sj:head locale="ru" jquerytheme="lightness" jqueryui="true"/>
	<!-- <title>Admin</title> -->
</head> 

<body>

	<s:form action="createItem" theme="xhtml"  >

		<s:radio name="item.type" label="Select Items to save "
			required="true" list="#{'1':'News', '2':'Events', '3':'Others'}"
			value="1" />

		<sj:textfield name="item.title" label="Title " maxlength="100"
			required="true" placeholder="Enter title" />

		<sj:datepicker name="item.startDate" label="Start date "
			changeYear="true" changeMonth="true" value="%{'today'}"
			showOn="focus" />

		<sj:datepicker name="item.endDate" label="Last date "
			changeYear="true" changeMonth="true" value="%{'today'}"
			showOn="focus" />

		<sj:textarea name="item.shortDescrption" label="Short Description "
			rows="2" cols="25" placeholder="Write here..." />

		<sj:textarea name="item.longDescrption" label="Long Description "
			rows="4" cols="50" placeholder="Write here..." />

		<sj:checkboxlist name="item.sliderSelected" label="Show in slider "
			list="#{'True'}" />

		<sj:textfield name="item.image" label="Image "
			placeholder="Copy from slider..." />

		<sj:textfield name="item.filePath" label="Name of downloadable file " />

		<sj:submit button="Save" />
	</s:form>

</body>

</html>