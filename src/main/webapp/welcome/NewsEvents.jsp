<%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<style>
a {
  color:rgb(6,85,117);
  font-family : Calibri;
}

div div div ul li h6{
	margin: 0px;
	padding-top: 15px;
	font-weight : bold;
	font-size : 14px;
	font-family : Calibri;
}

div div div ul li p {
	padding: 30px 0px 0px 0px;
	font-family : Calibri;
}

.newsEventAnchor {
	margin-top : 50px;
	font-family : Calibri;
}

div div div h6 {
	padding: 5px;
}
</style>

  <link rel="stylesheet" href="../welcome/eventnnews.css">
  <script src="../welcome/js/irroeventslider.js"></script>

	<!-- Core CSS File. The CSS code needed to make eventCalendar works -->
  <link rel="stylesheet" href="../welcome/css/eventCalendar.css">

	<!-- Theme CSS file: it makes eventCalendar nicer -->
  <link rel="stylesheet" href="../welcome/css/eventCalendar_theme_responsive.css">

  <script src="../welcome/js/jquery.eventCalendar.js" type="text/javascript"></script>
</head>
<body>

<div class="irro-wl-newseventswrapper">
	<div class="irro-wl-context-div">
		<p class="irro-wl-context-header">Новости</p><div class="underline"></div>
			<div id="news-slider">
				<ul class="bjqs">	          			          			 
	          			 <s:iterator value="#application['News']" id="eachNews">
	          			 	<li>
	          			 		<div style="font-size:14px;">
					          	 	 <h6>	
					          	 	 	<s:property value="#eachNews.title" />
								      </h6>
					              
								 <p>
									<s:property value="#eachNews.description" /> 
								  </p>
								  <div class="newsEventAnchor">
					             <a href='<s:url action="content/LoadSelectedNews">
					             <s:param name="selectedItemId" value="#eachNews.id"></s:param></s:url>'>ПОДРОБНЕЕ >>>
								 </a>
								 <div>
					            </div>
		         			</li>
				         </s:iterator>
				         </ul>
			</div>
	</div>

	<div class="irro-wl-context-div">
		<p class="irro-wl-context-header">Анонсы</p><div class="underline"></div>

			<div id="event-slider">
					<ul class="bjqs">
						<s:iterator value="#application['Events']" id="eachEvent">
		          		  <li>
		          			 <div style="font-size:14px;">
					              	   <h6>	
					          	 	 	<s:property value="#eachEvent.title" />
								      </h6>
									  
								  <p>
					              <s:property value="#eachEvent.description" />
								  </p>
								  <div class="newsEventAnchor">
					              <a href='<s:url action="LoadSelectedEvent"><s:param name="selectedItemId" value="#eachEvent.id"></s:param></s:url>'>
					              ПОДРОБНЕЕ >>>
					              </a>
								  </div>
		         			   </div>	
		         			</li>
		         		</s:iterator>
		         		 </ul>

			</div>
	</div>
	<div class="irro-wl-context-div irro-wl-context-lastdiv">
		<p class="irro-wl-context-header"> Kалендарь</p><div class="underline"></div>
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
            responsive    : false,
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
