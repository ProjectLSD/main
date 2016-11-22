<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<form action="/myInfo/changeInfoView">
	<b style="color: silver;">비밀번호를 입력해 주세요</b>
	<br>
	<input type="password" name="pass" id="pass"/>
	<input type="button" value="확인" onclick="button_click()"/>
	<br>
	<span id="rst"></span>
	<br>
	<input type="submit" value="입력" name="conf" disabled="disabled"/>
</form>  
  
<script>

document.getElementById("pass").addEventListener("blur", function(){
      var v =document.getElementById("pass").value;
      
      var xhr = new XMLHttpRequest();
      xhr.open("post", "/myInfo/checkPass?pass="+v,true);
      xhr.onreadystatechange=function(){
         if(xhr.status==200&xhr.readyState==4){
            var t =xhr.responseText;
            var html;
            if(t=="TRUE") {
               html = "<i style='color:green;'>비밀번호 일치</i>";  
               $("input[name=conf]").attr("disabled",false);
               
            } else {
               html = "<i style='color:red;'>비밀번호 불일치</i>";
            }
            document.getElementById("rst").innerHTML = html;
         }
            
      };
      xhr.send();
   });
   
   </script>