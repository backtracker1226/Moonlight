<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<div id="wordcloud3" class="wordcloud">
	<span data-weight="9" style="display: none;">quisqu</span>
	<span data-weight="27" style="display: none;">egesta</span>
	<span data-weight="38" style="display: none;">puru</span>
	<span data-weight="43" style="display: none;">risu</span>
	<span data-weight="20" style="display: none;">ultrici</span>
	<span data-weight="19" style="display: none;">sodal</span>
	<span data-weight="26" style="display: none;">matti</span>
	<span data-weight="31" style="display: none;">ornar</span>
	<span data-weight="16" style="display: none;">dignissim</span>
	<span data-weight="27" style="display: none;">lacu</span>
	<span data-weight="18" style="display: none;">ultric</span>
	<span data-weight="16" style="display: none;">elementum</span>
	<span data-weight="31" style="display: none;">lacinia</span>
	<span data-weight="65" style="display: none;">amet</span>
	<span data-weight="37" style="display: none;">nisl</span>
	<span data-weight="35" style="display: none;">tincidunt</span>
	<span data-weight="30" style="display: none;">magna</span>
	<span data-weight="40" style="display: none;">lorem</span>
	<span data-weight="29" style="display: none;">auctor</span>
	<span data-weight="20" style="display: none;">viverra</span>
	<span data-weight="19" style="display: none;">fermentum</span>
	<span data-weight="55" style="display: none;">nulla</span>
	<span data-weight="36" style="display: none;">enim</span>
	<span data-weight="12" style="display: none;">conval</span>
	<span data-weight="25" style="display: none;">tempu</span>
	<span data-weight="29" style="display: none;">justo</span>
	<span data-weight="35" style="display: none;">feli</span>
	<span data-weight="25" style="display: none;">faucibu</span>
	<span data-weight="33" style="display: none;">cursu</span>
	<span data-weight="90" style="display: none;"><a href="http://google.com">google</a></span>
	<span data-weight="23" style="display: none;">luctu</span>
	<span data-weight="26" style="display: none;">posuer</span>
	<span data-weight="30" style="display: none;">malesuada</span>
	<span data-weight="35" style="display: none;">diam</span>
	<span data-weight="37" style="display: none;">vestibulum</span>
	<span data-weight="36" style="display: none;">ipsum</span>
	<span data-weight="4" style="display: none;">primi</span>
	<span data-weight="25" style="display: none;">orci</span>
	<span data-weight="4" style="display: none;">cubilia</span>
	<span data-weight="4" style="display: none;">cura</span>
	<span data-weight="22" style="display: none;">proin</span>
	<span data-weight="25" style="display: none;">scelerisqu</span>
	<span data-weight="34" style="display: none;">velit</span>
	<span data-weight="25" style="display: none;">pretium</span>
	<span data-weight="33" style="display: none;">quam</span>
	<span data-weight="23" style="display: none;">consectetur</span>
	<span data-weight="25" style="display: none;">semper</span>
	<span data-weight="39" style="display: none;">turpi</span>
	<span data-weight="30" style="display: none;">nisi</span>
	<span data-weight="63" style="display: none;">vita</span>
	<span data-weight="18" style="display: none;">suscipit</span>
	<span data-weight="32" style="display: none;">nequ</span>
	<span data-weight="19" style="display: none;">morbi</span>
	<span data-weight="22" style="display: none;">lectu</span>
	<span data-weight="19" style="display: none;">molesti</span>
	<span data-weight="19" style="display: none;">nullam</span>
	<span data-weight="18" style="display: none;">consequat</span>
	<span data-weight="14" style="display: none;">bibendum</span>
	<span data-weight="19" style="display: none;">rutrum</span>
	<span data-weight="12" style="display: none;">venenati</span>
	<span data-weight="38" style="display: none;">dolor</span>
	<span data-weight="27" style="display: none;">pulvinar</span>
	<span data-weight="55" style="display: none;">aliquam</span>
	<span data-weight="38" style="display: none;">erat</span>
	<span data-weight="28" style="display: none;">volutpat</span>
	<span data-weight="35" style="display: none;">nibh</span>
	<span data-weight="23" style="display: none;">eleifend</span>
	<span data-weight="23" style="display: none;">fringilla</span>
	<span data-weight="22" style="display: none;">aenean</span>
	<span data-weight="23" style="display: none;">tortor</span>
	<span data-weight="22" style="display: none;">hendrerit</span>
	<span data-weight="47" style="display: none;">pellentesqu</span>
	<span data-weight="35" style="display: none;">ligula</span>
	<span data-weight="51" style="display: none;">nunc</span>
	<span data-weight="26" style="display: none;">ullamcorp</span>
	<span data-weight="19" style="display: none;">sollicitudin</span>
	<span data-weight="23" style="display: none;">placerat</span>
	<span data-weight="16" style="display: none;">blandit</span>
	<span data-weight="35" style="display: none;">odio</span>
	<span data-weight="21" style="display: none;">euismod</span>
	<span data-weight="30" style="display: none;">adipisc</span>
	<span data-weight="46" style="display: none;">elit</span>
	<span data-weight="21" style="display: none;">suspendiss</span>
	<span data-weight="19" style="display: none;">sagitti</span>
	<span data-weight="26" style="display: none;">vehicula</span>
	<span data-weight="38" style="display: none;">augu</span>
	<span data-weight="59" style="display: none;">eget</span>
	<span data-weight="21" style="display: none;">molli</span>
	<span data-weight="18" style="display: none;">iaculi</span>
	<span data-weight="24" style="display: none;">tempor</span>
	<span data-weight="21" style="display: none;">integer</span>
	<span data-weight="32" style="display: none;">facilisi</span>
	<span data-weight="15" style="display: none;">vivamu</span>
	<span data-weight="6" style="display: none;">habit</span>
	<span data-weight="24" style="display: none;">tristiqu</span>
	<span data-weight="6" style="display: none;">senectu</span>
	<span data-weight="6" style="display: none;">netu</span>
	<span data-weight="6" style="display: none;">fame</span>
	<span data-weight="38" style="display: none;">urna</span>
	<span data-weight="21" style="display: none;">imperdiet</span>
	<span data-weight="22" style="display: none;">tellu</span>
	<span data-weight="19" style="display: none;">gravida</span>
	<span data-weight="21" style="display: none;">condimentum</span>
	<span data-weight="54" style="display: none;">donec</span>
	<span data-weight="19" style="display: none;">loborti</span>
	<span data-weight="28" style="display: none;">sapien</span>
	<span data-weight="19" style="display: none;">porta</span>
	<span data-weight="21" style="display: none;">dapibu</span>
	<span data-weight="16" style="display: none;">dictum</span>
	<span data-weight="18" style="display: none;">pharetra</span>
	<span data-weight="43" style="display: none;">arcu</span>
	<span data-weight="16" style="display: none;">phasellu</span>
	<span data-weight="17" style="display: none;">vulput</span>
	<span data-weight="7" style="display: none;">habitass</span>
	<span data-weight="7" style="display: none;">platea</span>
	<span data-weight="7" style="display: none;">dictumst</span>
	<span data-weight="22" style="display: none;">libero</span>
	<span data-weight="22" style="display: none;">curabitur</span>
	<span data-weight="24" style="display: none;">aliquet</span>
	<span data-weight="26" style="display: none;">congu</span>
	<span data-weight="16" style="display: none;">maecena</span>
	<span data-weight="3" style="display: none;">class</span>
	<span data-weight="3" style="display: none;">aptent</span>
	<span data-weight="3" style="display: none;">taciti</span>
	<span data-weight="3" style="display: none;">sociosqu</span>
	<span data-weight="3" style="display: none;">litora</span>
	<span data-weight="3" style="display: none;">torquent</span>
	<span data-weight="3" style="display: none;">conubia</span>
	<span data-weight="3" style="display: none;">nostra</span>
	<span data-weight="3" style="display: none;">incepto</span>
	<span data-weight="3" style="display: none;">himenaeo</span>
	<span data-weight="21" style="display: none;">porttitor</span>
	<span data-weight="21" style="display: none;">laoreet</span>
	<span data-weight="26" style="display: none;">feugiat</span>
	<span data-weight="23" style="display: none;">massa</span>
	<span data-weight="27" style="display: none;">metu</span>
	<span data-weight="13" style="display: none;">etiam</span>
	<span data-weight="3" style="display: none;">potenti</span>
	<span data-weight="16" style="display: none;">fusc</span>
	<span data-weight="25" style="display: none;">interdum</span>
	<span data-weight="19" style="display: none;">praesent</span>
	<span data-weight="26" style="display: none;">accumsan</span>
	<span data-weight="15" style="display: none;">rhoncu</span>
	<span data-weight="16" style="display: none;">commodo</span>
	<span data-weight="16" style="display: none;">variu</span>
	<span data-weight="5" style="display: none;">socii</span>
	<span data-weight="5" style="display: none;">natoqu</span>
	<span data-weight="5" style="display: none;">penatibu</span>
	<span data-weight="5" style="display: none;">magni</span>
	<span data-weight="5" style="display: none;">parturi</span>
	<span data-weight="5" style="display: none;">mont</span>
	<span data-weight="5" style="display: none;">nascetur</span>
	<span data-weight="25" style="display: none;">ridiculu</span>
	 <canvas id="awesomeCloudwordcloud3" width="2016" height="2016" style="position: relative; z-index: 10000; width: 672px; height: 672px; display: block; visibility: visible;">.</canvas>
	 </div>

<script>
			$(document).ready(function(){
							
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