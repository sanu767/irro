<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<sj:head locale="ru" jquerytheme="lightness" jqueryui="true"/>
</head> 

<body>
<div style="margin : 5px 0px 0px 10px">
	<h1 style="font-size: 18px;font-family: 'Open Sans';">Create Item</h1>

	<s:form action="CreateItem" theme="xhtml" accept-charset="UTF-8">

		<s:radio name="itemBean.type" label="Select Items to save "
			required="true" list="#{'1':'News', '2':'Events', '3':'Others'}"
			value="1" />

		<sj:textfield name="itemBean.title" label="Title " maxlength="100"
			required="true" placeholder="Enter title" />

		<sj:datepicker name="itemBean.startDate" displayFormat="dd/mm/yy" label="Start date " changeYear="true" changeMonth="true" showOn="focus" />

		<sj:datepicker name="itemBean.endDate" displayFormat="dd/mm/yy" label="Last date " changeYear="true" changeMonth="true" showOn="focus" />

		<sj:textarea name="itemBean.shortDescription" label="Short Description "
			rows="2" cols="25" placeholder="Write here..." />

		<sj:textarea name="itemBean.longDescription" label="Long Description "
			rows="4" cols="50" placeholder="Write here..." />

		<s:checkbox name="itemBean.sliderSelected" label="Show in slider " />

		<sj:textfield name="itemBean.image" label="Image "
			placeholder="Copy from slider..." />

		<sj:textfield name="itemBean.filePath" label="Name of downloadable file " />

		<sj:submit style="float:right;height : 25px;margin: 20px 30px 0px 0px;" button="Create" value="Create" />
		
	</s:form>
</div>
	
</body>
</html>