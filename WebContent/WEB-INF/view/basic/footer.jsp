<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   String addr = request.getLocalAddr();
%>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="/script/jquery.cookie.js"></script>
<audio preload="auto" controls="controls" src="/audio/p.mp3" loop=""
   style="width: 100%; height: 15px;" > 
</audio>
<script>

function setCookie(c_name,value,exdays)
{
    $.cookie(c_name, escape(value), {
        path: '/'
    }); 
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
    if(!played){
        if(tillPlayed){
        song.currentTime = tillPlayed;
        song.play();
        played = true;
        }
        else {
                song.play();
                played = true;
        }
    }
    else {
    setCookie('timePlayed', song.currentTime);
    }
}
setInterval(update,1000);
</script>