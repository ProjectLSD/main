<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<style>
.btn-default {
      box-shadow: 1px 2px 5px #000000;   
  }
</style>
<form action="/file/upload" method="post" enctype="multipart/form-data">
   <div align="center">
      <table  style="width: 500, height:500;">
         <tr>
         
            <th> <div class="panel panel-default">
      <div class="panel-heading">
  <div class="dropdown">
    <button  class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown" style="color: white;">�帣����
    <span class="caret"></span></button>
    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1"   name="genre">
      <li role="presentation"><a role="menuitem" tabindex="-1" value="pop">Pop</a></li>
      <li role="presentation"><a role="menuitem" tabindex="-1" value="rock">Rock</a></li>
      <li role="presentation"><a role="menuitem" tabindex="-1" value="jazz">Jazz</a></li>
      <li role="presentation"><a role="menuitem" tabindex="-1" value="hiphop">HipHop</a></li>
      <li role="presentation"><a role="menuitem" tabindex="-1" value="country">Country</a></li>
      <li role="presentation"><a role="menuitem" tabindex="-1" value="electronic">Electronic</a></li>
    </ul>
  </div>
              <br></input> 
             <b>�ٹ���</b> <br> <input type="text" class="btn" id="album" name="album" border="1"></input>     
            <br/><span id="albumtxt" style="color: red;"></span>
               <br> <b>���� ����</b> <br> <input type="file" name="file" accept="audio/*"/><br>
               <div id="imgPick">
               <br> <b>�̹��� ����</b> <br> <input type="file" id="image" name="image" accept="image/*"/><br>
               </div>
               <input  style="color: black;"  type="submit" value="�ø���"></th>
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