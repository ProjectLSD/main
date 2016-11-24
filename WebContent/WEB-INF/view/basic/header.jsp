<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="/script/jquery.cookie.js"></script>
<div align="center">
<h2>Play list</h2>
<hr/>
<c:if test="${sessionScope.PlayList ne null }">
<c:forEach items="${sessionScope.PlayList }" var="li" begin="0" end="${sessionScope.PlayList.size() }" varStatus="status">            
<div>
<button id="${status.count}" class="play" type="button">Play</button>
   <b style="color: pink;">앨범 : ${li.ALBUM }</b>
   <b style="color: pink;">곡 : ${li.FILENAME }</b>
   <b id="music${status.count}" hidden="music">${li.FILEUUID }</b>
   <hr/>
</div> 
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
$(".play").click(function(){
   var id = $(this).attr("id");
    console.log(id);
   var music = $("#music"+id).text();
   console.log(music);   
   $.ajax({
          "url" : "/file/play?music="+music,
          "method" : "post",
          "aSync" : true
       }).done(function(txt) {  
          console.log(txt);
          location.reload();
       })
      
});

</script>