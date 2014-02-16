<%@ taglib="/webwork" prefix="ww" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="#session.login != 'true'">
<jsp:forward page="/example/Missing.jsp" />
</s:if>