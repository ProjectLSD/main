<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<style>

</style>
<h2 style="color: white;">�ٹ�����ϱ�</h2>
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
									<option value="">�帣 ����</option>
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
								<b>�ٹ���</b>
							</h4>
							<br /> <input type="text" class="form-control" id="album" placeholder="�Ϲ��� �Է� 13�� ����"
								name="album" maxlength="13" size="1px;"> <br /> <span
								id="albumtxt" style="color: red;"></span>
							<h4 align="center">
								<b>����� �ٹ�</b>
							</h4>
							 <input type="file" name="file" class="form-control"
								accept="audio/*" /> <br/>
							<div id="imgPick">
								
								<h4 align="center">
								
									<b>�ٹ� �̹���</b>
								</h4>
								<input  type="file" class="form-control" name="image" id="image"
								accept="image/*"  /></input> <br/>
							</div>
							<input class="form-control" type="submit" value="�ø���" style="color: black;"/>
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
                   $("#albumtxt").text("��ϵȾٹ��̶� ������ �߰� ��ϵ˴ϴ�.");
               }else{
                  $("#imgPick").show(2000);
               }
               
            })
});     
</script>