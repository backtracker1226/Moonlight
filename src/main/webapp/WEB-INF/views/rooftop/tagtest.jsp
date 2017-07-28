<!DOCTYPE HTML>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- include 파일 -->
<%@include file="../include/header.jsp"%>

<html class="no-js" lang="en"><!--<![endif]--><head>
<meta charset="utf-8">
<title>jQuery awesomeCloud Plugin Demos</title>
<meta name="description" content="A Word Cloud plugin for jQuery.">
<meta name="viewport" content="width=device-width,initial-scale=1">
<style type="text/css">
.wordcloud {
border: 1px solid #036;
height: 7in;
margin: 0.5in auto;
padding: 0;
page-break-after: always;
page-break-inside: avoid;
width: 7in;
}
</style>
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<div role=main>
<div id="wordcloud3" class="wordcloud">
	<span data-weight="9" style="display: none;">왜안돼</span>
	<span data-weight="100" style="display: none;">#왜안돼</span>
	<span data-weight="170" style='display: none;'>안되는이유는</span>
	<span data-weight="25" style="display: none;">40분</span>
	 <canvas id="awesomeCloudwordcloud3" width="2016" height="2016" style="position: relative; z-index: 10000; width: 672px; height: 672px; display: block; visibility: visible;">.</canvas>
	 </div>
</div>
<script>
			$(document).ready(function(){
				
				$.getJSON("/rooftop/tagcount/", function(list){
				    
				    $(list).each(function(index){
				        
				        //console.log(list);
				        //<span data-weight="25" style="display: none;">ridiculu</span>
				        console.log(list[0].size);
				        block = "<span data-weight="+'"'+list[index].size+'"'+" style='display: none;'>"+list[index].text+"</span>";
				        
				        
				        $("#awesomeCloudwordcloud3").append(block);
				        
				    });
				    //$("#wordcloud3").append("<canvas id='awesomeCloudwordcloud3' width='2010' height='2010'>.</canvas>");
				});
			});			
				
		</script> 
		<script>
$("#wordcloud3").awesomeCloud({
	"size" : {
		"grid" : 1, // word spacing, smaller is more tightly packed
		"factor" : 2 // font resize factor, 0 means automatic

	},
	"color" : {
		"background" : "rgba(255,255,255,0)",
		/* "start" : "#fff", // color of the smallest font, if options.color = "gradient""
		"end" : "rgb(255,214,88)" // color of the largest font, if options.color = "gradient" */
	},
	"options" : {
		"color" : "random-light", // random-light, random-dark, gradient
		"rotationRatio" : 0.5, // 0 is all horizontal, 1 is all vertical
		"printMultiplier" : 3, // set to 3 for nice printer output; higher numbers take longer
		"sort" : "highest" // highest, lowest or random
	},
	"font" : "'Times New Roman', Times, serif", //  the CSS font-family string
	"shape" : "star" // circle, square, star or a theta function describing a shape
});


</script>
<!--[if lt IE 7 ]>
		<script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
		<script>window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
		<![endif]-->
        
<!-- <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script> -->


</body></html>