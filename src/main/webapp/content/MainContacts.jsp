<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<head>
<style type="text/css">

.myClass{
 background-colour : white
}
.pagination-table {
background: none;
/*width: auto;*/

}

.pagination-table td {
font-size: 10px;
width: auto;
}

.pagination-table input{
	width: 95%;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	margin: 3px;

}
.pagination-table textarea{
	width: 95%;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	margin: 3px;

}
</style>
<script type="text/javascript">
function validate()
{
	
	var name = document.getElementById('name').value; 
    if(!name.match(/\S/)) {
        alert ('Enter user name');
		document.myForm.name.focus() ;
        return false;
    } 
	
	var mail=document.getElementById('mail').value; 
    var atpos=mail.indexOf("@");
    var dotpos=mail.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=mail.length)
    {
      alert('Not a valid e-mail address');
      return false;
    }
	return true;
}
</script>
</head>

<body>
<h1 style="font-size: 18px;padding-top:50px;">Контакты</h1>
Контакты

Почтовый адрес:
620066, г.Екатеринбург, ул.Академическая, 16
Телефон:
(343) 369-29-86, 369-22-32, 369-27-50
Факс:
(343) 369-29-86
Электронный адрес:
irro@irro.ru
Адрес сайта:
http://www.irro.ru/
Корпуса:
620066, г.Екатеринбург, ул.Академическая, 16, вход со стороны улиц Софьи Ковалевской и Академической.


620144, г.Екатеринбург, ул.Щорса, 92а, к. 4


620144, г.Екатеринбург, ул.Бебеля, 71
Адрес сайта:
http://hotel.irro.ru/

<p>
<p>
<p>
<p>
<p>

Let's talk<p><p><p>
​​Thanks for your interest in our services. Please fill out the email form, submit and we will get back to you soon.
<p><p><p>
<div>
<s:form action="SendFeedBack" theme="xhtml" accept-charset="UTF-8" method="post" enctype="multipart/form-data" cssClass="pagination-table">
		<sj:textfield  cssClass="form-control" name="feedBackBean.name"  required="true" placeholder="Enter Name" id="name" />
			
		<sj:textfield cssClass="form-control" name="feedBackBean.email"  required="true" placeholder="Enter Email" id="mail" />
			
		<sj:textfield cssClass="form-control" name="feedBackBean.subject" required="true" placeholder="Enter Subject" />
			
		<s:textarea cssClass="form-control" name="feedBackBean.message" cssStyle="min-height: 130px;" placeholder="Enter Message"></s:textarea>

		<s:submit cssClass="btn btn-primary"  button="Send" value="Send"  cssStyle="width:20%;" align="left" onclick="return validate();"/>
		
</s:form>
</div>
</body>