<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div style="background-color: #1e1e26">
	<div class="thumbnail" style="height: 320px; background-color: #1e1e26">
		<div style="float: left;">
			<img src="/${imgid }" alt="Paris" width="300" height="300"
				style="margin-left: 0px;" />
		</div>
		<div
			style="font-size: 40px; color: #c2c2ca; width: 500px; margin-left: 350px;">
			album : ${alb }</div>
		<div
			style="font-size: 30px; color: #c2c2ca; width: 500px; margin-left: 350px;">
			가수 : ${own }</div>
	</div>
	<div class="panel panel-default" style="width: 1028px;">
		<table class="table" style="font-size: 18px; border: 0px;">
			<tr style="color: #c2c2ca; background-color: #282832">
				<td align="center" width="40px"><span
					class="glyphicon glyphicon-sort-by-attributes"></span></td>
				<td align="center" width="100px"></td>
				<td><b>SONG</b></td>
				<td width="50px"><span class="glyphicon glyphicon-thumbs-up">&nbsp;</span></td>
				<td width="50px"><span class="glyphicon glyphicon-download-alt">&nbsp;</span></td>
			</tr>
			<c:forEach var="ob" begin="0" end="${album.size() }"
				varStatus="status" items="${album }">
				<tr id="${status.count}" class="trevent"
					style="color: #c2c2ca; background-color: #1e1e26">
					<td align="center"><span style="font-size: 20px;" id="data${status.count}">${status.count}</span></td>
					<td align="center" width="100px"><span id="${status.count}" class="glyphicon glyphicon-plus"></span></td>
					<td>${ob.FILENAME} &nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-heart-empty" id="like" title="${ob.FILENUM}">&nbsp;</span></td>
					<td>${ob.LIKES}</td>
					<td>${ob.COUNT}</td>
					<td id="hd${status.count}" hidden="${ob.FILENUM}">${ob.FILENUM}</td>
					
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<script>
   $(".trevent").mouseenter(function(){
      var id = $(this).attr("id");
      $(this).attr("style","background-color:#23232c; color: #c2c2ca");
      	// console.log($("#data"+id).text());
      	$("#data"+id).attr("class", "glyphicon glyphicon-play");
      	$("#data"+id).text("");
      	
   });
      	$(".trevent").mouseleave(function(){
            var id = $(this).attr("id");
            $(this).attr("style","background-color:#1e1e26; color: #c2c2ca");
            
            	// console.log($("#data"+id).text());
            	$("#data"+id).attr("class", "");
            	$("#data"+id).text(id);
         });
     $(".glyphicon-plus").click(function(){
    	 var id = $(this).attr("id");
    	 console.log(id);
    	 var filenum = $("#hd"+id).text();
  		 $.ajax({
  	         "url" : "/file/one?filenum=" + filenum,
  	         "method" : "get",
  	         "aSync" : true
  	      }).done(function(txt) {  
  	         console.log(txt);
  	         location.reload();
  	      })
     }); 	
     
 	$(".glyphicon-heart-empty").click(function(){
		alert("추천되었습니다.");
		console.log($(this).attr("title"));
		$.ajax({
			"url" : "/file/like?filenum="+$(this).attr("title"),
			"method" : "get",
			"aSync" : true
		}).done(function(txt){  
			location.reload();
		})  
	});
      	
  </script>