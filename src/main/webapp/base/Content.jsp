<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<title>Content</title>
<script type="text/javascript">
window.onload = function () {
  document.getElementById('Plants').style.display='block';
  var list = document.getElementById('Animals')
  var rows = list.getElementsByTagName('ul');
	var active;
	for(var i = 0; i < rows.length; i++) {
		var row = rows[i];
		row.className = "hidden";	
	}
};

function appendTreeId(e){
    e.href = e.href + "?treeId=" + e.innerHTML;
};
</script>

<style>
.hidden {
	display:none;
}
</style>
</head>

<body>
<ul>
    <li id="Animals">Animals
     <ul>
      <li>Birds</li>
      <li>Mammals
       <ul>
        <li>Elephant</li>
        <li>Mouse</li>
       </ul>
      </li>
     </ul>
	</li>
	<li id="Plants">Plants
     <ul>
      <li>Trees</li>
      <li>Flowers
       <ul>
        <li>Rose</li>
        <li>Tulip</li>
       </ul>
      </li>
     </ul>
	</li>
</ul>
</body>
</html>