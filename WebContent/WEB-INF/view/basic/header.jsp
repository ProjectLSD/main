<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="/script/jquery.cookie.js"></script>
<div style="width: 320px; height: 650px;">
<c:if test="${sessionScope.PlayList ne null }">
	<c:forEach items="${sessionScope.PlayList }" var="li" begin="0"
		end="${sessionScope.PlayList.size() }" varStatus="status">
		<div align="left" style="background-color: #333340;width: 200px; 
		overflow:hidden;white-space:nowrap; text-overflow:ellipsis;margin-bottom: 6px; padding-top: 8px;padding-left: 5px;">
			<span > <img src="/${li.IMGUUID }"
				id="${status.count}" class="img-circle play" alt="Cinque Terre"
				style="width: 40px; height: 40px; float: left;">
			</span> <span>
				<div style="width: 200px; height: 50px; color: #b8c2c0;">
					<b>&nbsp; ${li.ALBUM }</b><br />
					&nbsp;&nbsp;<a href="#" id="filename${status.count}" style="font-size: 12px;" title="${li.FILENAME }">${li.FILENAME }</a>
					<script>
						var subfile = $("#filename"+${status.count}).text().substring( 0, 13 );
						console.log(subfile);
						$("#filename"+${status.count}).text(subfile+"...");
					</script>	
				</div> <b id="music${status.count}" hidden="music">${li.FILEUUID }</b>
			</span>
		</div>
	</c:forEach>
</c:if>
</div>
		<hr style="margin-bottom: 4px;"/>
<div align="center">
<button id="btt" type="button" style="padding: 0;margin: 0;border: 0; width: 230px;height: 50px;
 background-color: #23232c; color: #b8c2c0; font-size: 15px; ">
<span class="glyphicon glyphicon-trash" style="margin-right: 5px;"></span>Clear Play Queue
</button>
</div>
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