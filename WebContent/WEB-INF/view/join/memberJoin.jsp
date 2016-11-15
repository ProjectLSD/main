<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<div class="container"> 

<h2> 일반 회원가입</h2>
<p>회원 정보를 입력해 주세요.</p>
<form action="/member/input" method="post" style="font-size: 12pt;" class="form-inline">
    <input type="hidden" name="menu" value="input" /> 
    <div class="form-group" style="padding-bottom: 5px;">
      <label>I D :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
      <input type="text" required="required" class="form-control" name="id" id="cid" placeholder="사용할 아이디">
    </div>
 	<span id="rst"></span>
    <br/>
    <div class="form-group" style="padding-bottom: 5px;">
      <label>Password :</label>
      <input type="password" required="required" class="form-control" name="pass" placeholder=" 패스워드">			
    </div>
    <br/>
   <!--  <div class="form-group" style="padding-bottom: 5px;">
      <label>Confirm :&nbsp;&nbsp;&nbsp;</label>
      <input type="password" class="form-control" name="passcon" placeholder=" 패스워드확인">
    </div> 
    <br/>-->
    <div class="form-group" style="padding-bottom: 5px;">
      <label>Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
      <input type="text" class="form-control" name="name" placeholder="이름">
    </div>
    <br/>
    <div class="form-group" style="padding-bottom: 5px;">
      <label>Email :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
      <input type="email" required="required" class="form-control" name="email" placeholder="email">
    </div>
    <br/>
   <div class="form-group"  style="padding-bottom: 5px;">
      <label>PonNum :&nbsp;&nbsp;</label>
   <select name="phonenum1" class="form-control">
      <option>010</option>
      <option>011</option>
      <option>016</option>
      <option>017</option>
      <option>018</option>
      <option>019</option>
   </select>
   <input type="text" class="form-control" name="phonenum2" maxlength="4" size="1px;">
   <input type="text" class="form-control" name="phonenum3" maxlength="4" size="1px;">
   <br/>
   </div>
   <br/>
    <input type="submit" class="btn btn-default btn-success" value="가입하기">
    <input type="button" class="btn btn-default btn-info" value="취소"onclick="location.href='/join'">
  </form>
</div>
<script>
	document.getElementById("cid").addEventListener("blur", function(){
		var v =document.getElementById("cid").value;
		
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/member/joinId?id="+v,true);
		xhr.onreadystatechange=function(){
			if(xhr.status==200&xhr.readyState==4){
				var t =xhr.responseText;
				var html;
				if(t=="TRUE") {
					html = "<i style='color:green;'>멋진 아이디입니다</i>";
					
				} else {
					html = "<i style='color:red;'>사용중인 아이디입니다</i>";
				}
				document.getElementById("rst").innerHTML = html;
			}
				
		};
		xhr.send();
	});

</script>
  