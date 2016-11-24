<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<form action="/file/upload" method="post" enctype="multipart/form-data">
	<div align="center">
		<table border="1" style="width: 500, height:500;">
			<tr>
				<th><b style="font: large;">장르</b> <br> <select style="color: black;"
					name="genre">
						<option value="">장르 선택</option>
						<option value="pop">Pop</option>
						<option value="rock">Rock</option>
						<option value="jazz">Jazz</option>
						<option value="hiphop">HipHop</option>
						<option value="country">Country</option>
						<option value="electronic">Electronic</option>
				</select> <br> <b>앨범명</b> <br> <input id="album" style="color: black;" type="text" name="album" />
					<br> <b>파일 선택</b> <br> <input type="file" name="file" accept="audio/*"/><br>
					<div id="imgPick">
					<br> <b>이미지 선택</b> <br> <input type="file" id="image" name="image" accept="image/*"/><br>
					</div>
					<input  style="color: black;"  type="submit" value="올리기"></th>
			</tr>

		</table>
</form>
</div>
<script>
$("#album").keyup(function(){
	 var id = $(this).attr("id");
	 var album =  $("input[name='album']").val();
		 $.ajax({
	         "url" : "/file/checkAlbum?album=" + album,
	         "method" : "get",
	         "aSync" : true
	      }).done(function(txt) {  
		         if(txt=="TRUE"){
		        	  $("#imgPick").hide(2000);
		         }else{
		        	 $("#imgPick").show(2000);
		         }
		    	  
		      })
}); 	 
</script>