<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<form action="/myInfo/changeInfoView">
	<b style="color: silver;">��й�ȣ�� �Է��� �ּ���</b>
	<br>
	<input type="password" name="pass" id="pass"/>
	<input type="button" value="Ȯ��" onclick="button_click()"/>
	<br>
	<span id="rst"></span>
	<br>
	<input type="submit" value="�Է�" name="conf" disabled="disabled"/>
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
               html = "<i style='color:green;'>��й�ȣ ��ġ</i>";  
               $("input[name=conf]").attr("disabled",false);
               
            } else {
               html = "<i style='color:red;'>��й�ȣ ����ġ</i>";
            }
            document.getElementById("rst").innerHTML = html;
         }
            
      };
      xhr.send();
   });
   
   </script>