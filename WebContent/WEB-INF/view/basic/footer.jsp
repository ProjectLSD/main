<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="/johndyer-mediaelement-dd102f1/build/jquery.js"></script>
<script
	src="/johndyer-mediaelement-dd102f1/build/mediaelement-and-player.min.js"></script>
<link rel="stylesheet"
	href="/johndyer-mediaelement-dd102f1/build/mediaelementplayer.min.css" />
<audio id="player2" src="/${sessionScope.music }" type="audio/mp3"
	controls="controls" height="30px" width="100%">
</audio>
<script>
	$('audio,video').mediaelementplayer();

	console.log("!!!");
	function setCookie(c_name, value, exdays) {
		document.cookie = c_name+"="+escape(value)+";path=/";
	}
	function getCookie(c_name)
	{
	    var i,x,y,ARRcookies=document.cookie.split(";");
	    for (i=0;i<ARRcookies.length;i++)
	    {
	       console.log(ARRcookies[i]);
	         x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
	         y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
	         x=x.replace(/^\s+|\s+$/g,"");
	         if (x==c_name)
	        {
	        return unescape(y);
	        }
	      }
	}

	var song = document.getElementsByTagName('audio')[0];
	var played = false;
	var tillPlayed = getCookie('timePlayed');
	function update()
	{
	  	console.log("?");
	  	var title = $("#mebu").attr("title");
	  	var coo = getCookie('musicstart');
	  	console.log("coo"+coo);
	  	if(coo == "stop"){
	  		console.log("하지마");
	  	}else{
		if("${sessionScope.music ne null}"){
	       if(!played){
	           if(tillPlayed){
	           console.log(song);
	           song.currentTime = tillPlayed;
	           song.play();
	           played = true;
	           }else {
	        	    setCookie('musicstart','start');
	                console.log("1");
	        	    song.play();
	                played = true; 
	           }
	         }else{
	          setCookie('timePlayed', song.currentTime);
	      	//var mejstext = $(".mejs-currenttime").text();
	      	//console.log(mejstext);  
	       }
	   }else{
	      song.pause();
	   }
	  }
	}
	setInterval(update,1000);
	$("#mebu").click(function(){
		var mp = getCookie('musicstart');
		console.log(mp);
		if(mp == "start"){
			console.log("여긴 stop");
			setCookie('musicstart','stop');
		}else if(mp == "stop"){
			console.log("여긴 start");
			setCookie('musicstart','start');	
		}
		
	});
	
	
</script>
