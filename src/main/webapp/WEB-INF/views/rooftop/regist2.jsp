<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>
<%-- <%@ include file="../include/script.jsp" %> --%>
<%-- <%@ include file="../include/banner.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <!-- Latest compiled and minified CSS -->  
   <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css" rel="stylesheet"></link>  
 <!--</head>-->  
  <!--<body>-->    
 <div class="container">  
   <h1>  
 Google map with Bootstrap mdal</h1>  
 Click here to load <a class="openmodal" data-id="Cineplex Odeon Yonge &amp; Dundas Cinemas" data-toggle="modal" href="https://www.blogger.com/blogger.g?blogID=3063422757857628467#mapmodals" role="button">map modal</a>  
    <!--bootstrap modal-->  
    <div class="modal hide fade" id="mapmodals">  
     <div class="modal-body">  
       <button class="close" data-dismiss="modal" type="button">Close</button>  
       <div id="map_canvas" style="height: 300px; width: 530px;">  
 </div>  
 </div>  
 </div>  
 <!--end bootstrap modal-->  
 </div>  
 <!--container-->  
   <!-- Placed at the end of the document so the pages load faster -->  
   <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>  
   <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>  
   <script src="http://maps.google.com/maps/api/js?sensor=false"></script>  
   <!-- Google Maps API script-->  
 <script type="text/javascript">  
 var map;  
 var myLatlng;  
  function mapsDisplay(longs,latts,markerTitle,bubbleInfo){  
   myLatlng = new google.maps.LatLng(longs,latts);  
   var map_options = {  
    zoom: 14,  
    mapTypeControl: false,  
    center:myLatlng,  
    panControl:false,  
    rotateControl:false,  
    streetViewControl: false,  
    mapTypeId: google.maps.MapTypeId.ROADMAP  
   };  
  var map = new google.maps.Map(document.getElementById("map_canvas"), map_options);  
   //var contentString = bubbleInfo;  
  var infowindow = new google.maps.InfoWindow({  
   //  content: contentString  
    content: bubbleInfo  
   });  
   var marker = new google.maps.Marker({  
    position: myLatlng,  
    map: map,  
    title:markerTitle,  
       maxWidth: 200,  
       maxHeight: 200  
   });   
   google.maps.event.addListener(marker, 'click', function() {  
    infowindow.open(map,marker);  
   });  
   $('#mapmodals').on('shown', function () {  
    google.maps.event.trigger(map, 'resize');  
 //map marker center  
    map.setCenter(new google.maps.LatLng(longs, latts));  
   })  
  }  
 // Start Map Modals  
 $(document).on("click", ".openmodal", function () {  
 //from mapsDisplay function you can use dynamic map for your application  
    mapsDisplay(43.65644,-79.380686,"",'<div id="mapInfo"><p>10 Dundas Street East<br>Toronto, ON<br>P: (416) 977-9262</p><p><a href="" target="_blank">Now Playing</a></p></div>');  
 });  
 </script>  
  </pre>  
 </head>  