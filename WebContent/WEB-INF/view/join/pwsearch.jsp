<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
					<span class="glyphicon glyphicon-lock"></span> 비밀번호 찾기
				</h4>
			</div>
			<div class="modal-body">
				<form name="joinform" action="/band/input" method="post"
					style="font-size: 12pt;" class="form-inline">
					<input type="hidden" name="menu" value="input" />
					<div class="form-group" style="padding-bottom: 5px;">
						<label>I D
							:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
						<input type="text" required="required" class="form-control"
							maxlength="20" name="id" id="cid" placeholder="찾으실 아이디">
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
							placeholder="8자리입력" id="conf" />&nbsp;
						<button type="button" class="btn btn-default"
							onclick="conf_click()">확인</button>
					</div>
					<br />
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger btn-default pull-left"
							data-dismiss="modal" onclick="location.href='/login'">
							<span class="glyphicon glyphicon-remove"></span>취소
						</button>
						<input type="submit" class="btn btn-default btn-success"
							name="join" value="찾기" onclick="join_click()">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
