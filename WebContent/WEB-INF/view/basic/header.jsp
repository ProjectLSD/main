<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div align="center">
<h2>Play list</h2>
<c:if test="${sessionScope.PlayList ne null }">
<c:forEach items="${sessionScope.PlayList }" var="li">
   <b style="color: pink;">앨범 : ${li.ALBUM } <br/> 파일이름 : ${li.FILENAME } <br/> 파일고유번호: ${li.FILEUUID }</b>
   <audio id="myAudio">
 <source src="/${li.FILEUUID}"
         type='audio/mp3'>
</audio>
<button type="button" onclick="aud_play_pause()">Play</button>
<hr/>
<script>
function aud_play_pause() {
  var myAudio = document.getElementById("myAudio");
  if (myAudio.paused) {
    myAudio.play();
  } else {
    myAudio.pause();
  }
}
</script>
</c:forEach>   
</c:if>
</div> 
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