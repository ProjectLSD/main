<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>로그인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#aaa {
	background-image: url("main.jpg");
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
					<span class="glyphicon glyphicon-lock"></span> LOGIN
				</h4>
			</div>
			<div class="modal-body">
				<form id="bt" role="form" action="/home">
					<div class="form-group">
						<label for="psw"><span class="glyphicon glyphicon-user"></span>I
							D</label> <input type="text" class="form-control"  name="id" id="id"
							placeholder="아이디">
					</div>
					<div class="form-group">

						<label for="usrname"><span
							class="glyphicon glyphicon-lock"></span>password</label> <input
							type="password" class="form-control" id="pass" name="pass" 
							placeholder="비밀번호">
					</div>
					<div class="checkbox">
						<label><input type="checkbox" id="idSaveCheck">아이디 저장</label>
					</div>
					<button type="submit" class="btn btn-block">
						Login <span class="glyphicon glyphicon-ok"></span>
					</button>
				</form>
				<div id="result"></div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-danger btn-default pull-left"
					data-dismiss="modal" onclick="location.href='/index'">
					<span class="glyphicon glyphicon-remove"></span> Cancel
				</button>
				<a  href="/join">ID/PW찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<a href="/join">회원가입</a>
			</div>
		</div>
	</div>
</div>
<script>
$("#bt").click(function() {
	var id = $("#id").val();
	var pass = $("#pass").val();
	var save = $("#save").prop("checked");
	
	$.ajax({
		"url" : "/member/loginCheck?id=" + id + "&pass=" + pass,
		"method" : "post",
		"aSync" : true
	}).done(function(txt) {
		console.log(txt);
		if (txt == "true") {
			location.replace("/member/loginConfirm?id="+ id+ "&pass="+ pass+ "&save="+ save);
		} else {
			$("#result").html("<i style='color:red'>회원 정보가 다릅니다!</i>");
		}
	})
});


$(document).ready(function(){

    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.

    var userInputId = getCookie("userInputId");

    $("input[name='id']").val(userInputId);  

     

    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,

        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.

    }

     

    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,

        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,

            var userInputId = $("input[name='id']").val();

            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관

        }else{ // ID 저장하기 체크 해제 시,

            deleteCookie("userInputId");

        }

    });

     

    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.

    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,

        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,

            var userInputId = $("input[name='id']").val();

            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관

        }

    });

});

 

function setCookie(cookieName, value, exdays){

    var exdate = new Date();

    exdate.setDate(exdate.getDate() + exdays);

    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());

    document.cookie = cookieName + "=" + cookieValue;

}

 

function deleteCookie(cookieName){

    var expireDate = new Date();

    expireDate.setDate(expireDate.getDate() - 1);

    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();

}

 

function getCookie(cookieName) {

    cookieName = cookieName + '=';

    var cookieData = document.cookie;

    var start = cookieData.indexOf(cookieName);

    var cookieValue = '';

    if(start != -1){

        start += cookieName.length;

        var end = cookieData.indexOf(';', start);

        if(end == -1)end = cookieData.length;

        cookieValue = cookieData.substring(start, end);

    }

    return unescape(cookieValue);

}
</script>
