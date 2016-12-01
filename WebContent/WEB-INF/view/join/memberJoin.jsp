<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#aaa {
	background-image: url("/main.jpg");
	background-size: cover;
}

.modal-header, h4, .close {
	background-color: #333;
	color: #fff !important;
	text-align: center;
	font-size: 30px;
}

.modal-header, .modal-body {
	padding: 40px 50px;
}
</style>
<body id="aaa"></body>
<div class="modal fade in" id="myModal" role="dialog"
	style="display: block; padding-right: 19px;">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"></button>
				<h4>
					<span class="glyphicon glyphicon-lock"></span> 일반 회원가입
				</h4>
			</div>
			<div class="modal-body">
				<form name="joinform" action="/member/input" method="post"
					style="font-size: 12pt;" class="form-inline">
					<input type="hidden" name="menu" value="input" />
					<div class="form-group" style="padding-bottom: 5px;">
						<label>I D
							:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
						<input type="text" required="required" class="form-control" maxlength="20"
							name="id" id="cid" placeholder="사용할 아이디">
					</div>
					<span id="rst" style="color: red;"><i>아이디를 입력하세요</i></span> <br />
					<div class="form-group" style="padding-bottom: 5px;">
						<label>Password :</label> <input type="password"
							required="required" class="form-control" name="pass" id="pass1"
							placeholder="패스워드" ><span id="pw" style="color: red;"><i>비밀번호를
								입력하세요</i></span>
					</div>
					<br />
					<div class="form-group" style="padding-bottom: 5px;">
						<label>Confirm :&nbsp;&nbsp;&nbsp;</label> <input type="password"
							required="required"  class="form-control" name="pass2" id="pass2"
							 placeholder=" 패스워드확인"><span
							id="cpass"></span>
					</div>
					<br />
					<div class="form-group" style="padding-bottom: 5px;">
						<label>Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <input
							type="text" class="form-control" name="name" placeholder="이름">
					</div>
					<br />
					<div class="form-group" style="padding-bottom: 5px;">
						<label>Email :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <input
							type="email" required="required" class="form-control" id="email"
							name="email" placeholder="email">&nbsp;
						<button type="button" class="btn btn-default"
							onclick="button_click()">인증받기</button>

					</div>
					<br />
					<div class="form-group" style="padding-bottom: 5px;">
						<label>인증번호 :&nbsp;&nbsp;</label> <input type="text"
							required="required" class="form-control" name="emailequal"
							placeholder="8자리입력" id="conf"/>&nbsp;
						<button type="button" class="btn btn-default"
							onclick="conf_click()">확인</button>
					</div>
					<br />
					<div class="form-group" style="padding-bottom: 5px;">
						<label>PonNum :&nbsp;&nbsp;</label> <select name="phonenum1"
							class="form-control">
							<option>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
						</select> <input type="text" required="required" class="form-control" name="phonenum2"
							maxlength="4" size="1px;"> <input type="text" required="required"
							class="form-control" name="phonenum3" maxlength="4" size="1px;"><br />
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger btn-default pull-left"
							data-dismiss="modal" onclick="location.href='/join'">
							<span class="glyphicon glyphicon-remove"></span>취소
						</button>
						<input type="submit" id="subbt" disabled="disabled" class="btn btn-default btn-success" 
						name="join" value="가입하기" />
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<input type="hidden" id="num"/>
<input type="hidden" id="check"/>
<script>

//아이디가 없을때 리턴
//아이디가 없을때 리턴
	$("#pass1").keyup(function() {
		var pass1 = $("#pass1").val();
		var pass2 = $("#pass2").val();
		if ($("#pass1").val().length == 0) {
			$("#pw").html("<i style='color:red'>비밀번호를 입력하세요</i>");
		} else {
			$("#pw").html("");
		}
		if (pass1 != pass2) {
			$("#cpass").html("<i style='color:red'>비밀번호가 다릅니다</i>");
		} else {
			$("#cpass").html("<i style='color:green'>비밀번호가 일치합니다</i>");
		}

	});
	$("#pass2").keyup(function() {
		var pass1 = $("#pass1").val();
		var pass2 = $("#pass2").val();
		if ($("#pass1").val().length == 0) {
			$("#pw").html("<i style='color:red'>비밀번호를 입력하세요</i>");
		} else {
			$("#pw").html("");
		}
		if (pass1 != pass2) {
			$("#cpass").html("<i style='color:red'>비밀번호가 다릅니다</i>");
		} else {
			$("#cpass").html("<i style='color:green'>비밀번호가 일치합니다</i>");
		}

	});

$("#pass1").keyup(function(){
  var pass1 = $("#pass1").val();
  var chk_num = pass1.search(/[0-9]/g);
  var chk_eng = pass1.search(/[a-z]/ig);       
  
      if(pass1.length < 8){
         $("#cpass").html("<i style='color:red'> 8~20자리로 설정해주세요.</i>");
      }else {
         if(chk_num<0 || chk_eng<0){
            $("#cpass").html("<i style='color:red'>영문,숫자로 설정해주세요</i>");
         }else{          
         }
     }  	
});
$("#pass2").keyup(function(){
  var pass1 = $("#pass1").val();
  var chk_num = pass1.search(/[0-9]/g);
  var chk_eng = pass1.search(/[a-z]/ig);       
  
      if(pass1.length < 8){
         $("#cpass").html("<i style='color:red'> 8~20자리로 설정해주세요.</i>");
         s3 = false;
      }else {
         if(chk_num<0 || chk_eng<0){
            $("#cpass").html("<i style='color:red'>영문,숫자로 설정해주세요</i>");
         }else{          
         }
     }  	
});

 document.getElementById("cid").addEventListener("keyup", function(){
    var v =document.getElementById("cid").value;
	
    var xhr = new XMLHttpRequest();
    xhr.open("get", "/band/joinId?id="+v,true);
    xhr.onreadystatechange=function(){
           if(xhr.status==200&xhr.readyState==4){
          var t =xhr.responseText;
          var html;
          if($("#cid").val().length==0){
   		   html = "<i style='color:red;'>아이디를 입력하세요</i>";  
   	   }else if(t=="TRUE") {
             html = "<i style='color:green;'>사용가능한 아이디입니다</i>";  
             
          }else if(t=="FALSE"){
             html = "<i style='color:red;'>사용중인 아이디입니다</i>";
          }
          document.getElementById("rst").innerHTML = html;
       }
       
    };
    xhr.send();
 });

	function button_click() {
		var email = document.getElementById("email").value
		if (email.length > 2) {
			alert("메일이 발송 되었습니다");
		} else {
			alert("이메일을 입력해 주세요");
		}
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/member/emailCheck?email=" + email, true);
		xhr.onreadystatechange = function() {
			if (xhr.status == 200 & xhr.readyState == 4) {
				var t = xhr.responseText;
				if (t != null) {

				} else {
					alert("메일 발송중 오료가 발생하였습니다.");
				}
				document.getElementById("num").value = t;
			}

		};
		xhr.send();
	}

	function conf_click() {
		var conf = document.getElementById("conf").value
		var num = document.getElementById("num").value

		if (conf == num) {
			alert("인증이 완료되었습니다");
			document.getElementById("check").value = true;
			$("#subbt").attr("disabled",false);
		} else {
			alert("인증 번호가 틀립니다.");
			document.getElementById("check").value = false;
		}
	}

	function join_click() {
		var check = document.getElementById("check").value;
		if (check == "true") {
			//alert("가입이 완료되었습니다");
		} else {
			alert("입력한 정보가 올바르지 않습니다");
			history.go(-1);
		}
	}
</script>