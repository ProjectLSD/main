<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="/script/jquery.cookie.js"></script>
<div align="center">
<h2>Play list</h2>
<hr/>
</div>
<c:if test="${sessionScope.PlayList ne null }">
<c:forEach items="${sessionScope.PlayList }" var="li" begin="0" end="${sessionScope.PlayList.size() }" varStatus="status">            
<div align="left">
<span style="width: 50px;">
<img src="/jjs.PNG" id="${status.count}" class="img-circle play" alt="Cinque Terre" width="50" height="50">
</span>
<span>
   <b style="color: pink;">${li.ALBUM }</b></br>
   <b style="color: pink;">${li.FILENAME }</b>
   <b id="music${status.count}" hidden="music">${li.FILEUUID }</b>
   <hr/>
</span>
</div> 
</c:forEach>   
</c:if>

<hr/> 
<button id="btt" class="btn-default" type="button">remove<span class="glyphicon glyphicon-trash"></span></button>

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