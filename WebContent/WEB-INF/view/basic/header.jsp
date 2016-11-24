<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div align="center">
<h2>Play list</h2>
<hr/>
<c:if test="${sessionScope.PlayList ne null }">
<c:forEach items="${sessionScope.PlayList }" var="li">
   <b style="color: pink;">앨범 : ${li.ALBUM }</b><hr/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="/script/jquery.cookie.js"></script>
<audio preload="metadata" controls="controls" src="/${li.FILEUUID }" 
   style="width: 100%; height: 10px; azimuth-color: #090808 " ><br>
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
</c:forEach>   
</c:if>
</div>
<hr/> 
<button id="btt" type="button">remove</button>

<script>
$("#btt").click(function() {
   
    $.ajax({
       "url" : "/file/remove",
       "method" : "post",
       "aSync" : true
    }).done(function(txt) {  
       console.log(txt);
       location.reload();
    })
	
});
</script>
