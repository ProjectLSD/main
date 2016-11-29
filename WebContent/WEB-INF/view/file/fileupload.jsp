<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<style>

</style>
<h2 style="color: white;">앨범등록하기</h2>
<hr />
<form action="/file/upload" method="post" enctype="multipart/form-data">
	<div align="center">
		<table>
			<tr>
				<th>
					<div class="panel panel-default" style="width: 700px; height: 600px;">
						<div class="panel-heading">
							<div class="form-group" style="padding-bottom: 5px;">
								<select name="genre" class="form-control">
									<option value="">장르 선택</option>
									<option value="pop">Pop</option>
									<option value="rock">Rock</option>
									<option value="jazz">Jazz</option>
									<option value="hiphop">HipHop</option>
									<option value="country">Country</option>
									<option value="electronic">Electronic</option>
								</select>
							</div>
							</input>
							<h4 align="center">
								<b>앨범명</b>
							</h4>
							<br /> <input type="text" class="form-control" id="album" placeholder="일범명 입력 13자 이하"
								name="album" maxlength="13" size="1px;"> <br /> <span
								id="albumtxt" style="color: red;"></span>
							<h4 align="center">
								<b>등록할 앨범</b>
							</h4>
							 <input type="file" name="file" class="form-control"
								accept="audio/*" /> <br/>
							<div id="imgPick">
								
								<h4 align="center">
								
									<b>앨범 이미지</b>
								</h4>
								<input  type="file" class="form-control" name="image" id="image"
								accept="image/*"  /></input> <br/>
							</div>
							<input class="form-control" type="submit" value="올리기" style="color: black;"/>
				</th>
			</tr>
			</div>
			</div>
		</table>
	</div>
</form>

<script>
$("#album").blur(function(){
    var id = $(this).attr("id");
    var album =  $("input[name='album']").val();
       $.ajax({
            "url" : "/file/checkAlbum?album=" + album,
            "method" : "get",
            "aSync" : true
         }).done(function(txt) {  
               if(txt=="TRUE"){
                   $("#imgPick").hide(2000);
                   $("#albumtxt").text("등록된앨범이라 음원만 추가 등록됩니다.");
               }else{
                  $("#imgPick").show(2000);
               }
               
            })
});     
</script>