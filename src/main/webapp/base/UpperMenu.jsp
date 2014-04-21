<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<ul id="cssmenu" style="font-style:oblique;font-size:18px;font-weight:bold;font-family:'Open Sans'">
   
   <li><a href='<s:url action="content/LoadArticlesByName">
					<s:param name="menuName">OnlineResources</s:param>
				</s:url>'><span>Интернет-ресурсы  ИРО</span></a></li>
				
   <li><a href='<s:url action="content/LoadArticlesByName">
					<s:param name="menuName">Hotel</s:param>
				</s:url>'><span>Гостиница</span></a></li>
				
   <li><a href='<s:url action="content/LoadArticlesByName">
					<s:param name="menuName">MainContacts</s:param>
				</s:url>'><span>Контакты</span></a></li> 
</ul>