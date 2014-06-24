<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style type="text/css">

.gallery {
    width : 25%;
   	left: 0px;
	position: relative;
	z-index: 10;
	float: left;
	list-style: none outside none;
}


.gallery ul {
    position: relative;
 }

.gallery li {
    width: 100%;
    height: 100%;
    padding-top: 20px !important;
	padding-left: 5px !important;
    font-family: "Open Sans";
    -webkit-box-sizing:content-box;
    -moz-box-sizing:content-box;
     box-sizing:content-box;
}

.gallery li video {
width : 80%;
color: rgb(6, 85, 117);
text-decoration: none;
font-family: "Open Sans";
}

.gallery video:hover {
   border: 2px solid #00ccff;
   cursor:pointer;
}

.preview {
	border: 2px solid #444;
	height : 60%;
	width : 65%;
	padding-top : 10px;
	margin-left : 30%;
	margin-top : 30px;
}

.preview video {
	width : 100%;
	height : 60%;
}

</style>
<script type="text/javascript">
function setSourceVideo(source) {
   document.getElementById("preview").src=source;	
}
</script>
<body>

<s:if test="%{menuVideos.size() > 0}">
<div class="gallery" align="left">
	<br/>	
	<u1>
	
		<s:iterator value="menuVideos" var="eachMenuVideo">
		   <li>
		    <s:if test="external">
			    <iframe src="<s:property value='name' />" onclick='setSourceVideo("<s:property value="name" />")' width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen>
			      </iframe>
			   </s:if>
			<s:else>
			   <video src="<%=request.getContextPath() %><s:property value='location' /><s:property value='name' />"  
				onclick='setSourceVideo("<%=request.getContextPath() %><s:property value="location" /><s:property value="name" />")' >
			   </video>
			</s:else>
			</li>
	    </s:iterator>
	</u1>
	<br/>
</div>

   <div class="preview" align="center">
	  <video id="preview" src="<%=request.getContextPath() %><s:property value='%{menuVideos[0].location}' /><s:property value='%{menuVideos[0].name}' />" controls></video>
	</div>

</s:if>

</body>
</html>