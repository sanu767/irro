<%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<style>
a {
  color:rgb(6,85,117);
}

div div div ul li p {
	margin: 5px;
	padding: 3px;
}

div div div h6 {
	padding: 5px;
}
</style>

  <link rel="stylesheet" href="../welcome/eventnnews.css">
  <script src="../welcome/js/irroeventslider.js"></script>
  <link rel="stylesheet" href="../welcome/css/paragridma.css">

	<!-- Core CSS File. The CSS code needed to make eventCalendar works -->
  <link rel="stylesheet" href="../welcome/css/eventCalendar.css">

	<!-- Theme CSS file: it makes eventCalendar nicer -->
  <link rel="stylesheet" href="../welcome/css/eventCalendar_theme_responsive.css">

  <script src="../welcome/js/jquery.eventCalendar.js" type="text/javascript"></script>
</head>
<body>

<div class="irro-wl-newseventswrapper">
	<div class="irro-wl-context-div">
		<p class="irro-wl-context-header" >Новости<div class="underline"></div></p>
			<div id="news-slider">
				<ul class="bjqs">
	          			          			 
	          			 <s:iterator value="#application['News']" id="eachNews">
	          			 	<li>
	          			 		<div style="font-size:14px;">
					              <h6 style="font-size:14px;font-weight:bold;font-family:'Calibri'">
					              		Семинар «Вопросы реализации нового <br>Федерального закона «Об образовании в Российской Федерации»
					              </h6>
	
					          	 	 <p>	
					          	 	 	<s:property value="#eachNews.title" />
								      </p>
					              
					             <s:property value="#eachNews.shortDescription" /> <a href="content/News">ПОДРОБНЕЕ >>></a>
					            </div>
		         			</li>
				         </s:iterator>
			</div>
	</div>

	<div class="irro-wl-context-div">
		<p class="irro-wl-context-header">Анонсы<div class="underline"></div></p>

			<div id="event-slider">
					<ul class="bjqs">
						<s:iterator value="#application['Events']" id="eachEvent">
		          		  <li>
		          			 <div style="font-size:14px;">
					              <h6 style="font-size:14px;font-weight:bold;font-family:'Calibri'">
					              Семинар «Вопросы реализации нового <br>Федерального закона «Об образовании в Российской Федерации»</h6>
					              	<p>	
					          	 	 	<s:property value="#eachEvent.title" />
								      </p>
					              <s:property value="#eachEvent.shortDescription" />
					              <a href="content/News">ПОДРОБНЕЕ >>></a>
		         			   </div>	
		         			</li>
		         		</s:iterator>

			</div>
	</div>
	<div class="irro-wl-context-div irro-wl-context-lastdiv">
		<p class="irro-wl-context-header"> календарь</p><div class="underline"></div>
				<div id="eventCalendarNoCache" class="width:300px"></div>
				<script>
					$(document).ready(function() {
						$("#eventCalendarNoCache").eventCalendar({
							eventsjson: 'json/events.json.php',
							jsonDateFormat: 'human',
							cacheJson: false
						});
					});
				</script>

	</div>


	   <script class="secret-source">
        jQuery(document).ready(function($) {
          
          $('#event-slider').bjqs({
            animtype      : 'slide',
            height        : 250,
            width         : 300,
            responsive    : true,
            randomstart   : true
          });
          
        });
      </script>
       <script class="secret-source">
        jQuery(document).ready(function($) {
          
          $('#news-slider').bjqs({
            animtype      : 'slide',
            height        : 250,
            width         : 300,
            responsive    : false,
            randomstart   : true
          });
          
        });
      
      </script>
     
</div>
</body>
