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

.button4 {
	background-color: white;
	color: black;
	border: 2px solid #555555;
}

.button4:hover {
	background-color: #555555;
	color: white;
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
					<span class="glyphicon glyphicon-user"></span>회원가입
				</h4>
			</div>
			<div class="modal-body">
				<form name="joinform" action="/band/input" method="post"
					style="font-size: 12pt;" class="form-inline">
					<input type="hidden" name="menu" value="input" />
					<div  align="center">
						<input type="button" style="padding: 80px 40px" 
							class="btn btn-default button button4 btn-lg" value="일반 회원가입"
							onclick="location.href='/member/join'" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" style="padding: 80px 40px" 
							class="btn btn-default button button4 btn-lg" value="BAND 회원가입"
							onclick="location.href='/band/join'" />
					</div>
					<br />
					<div>
						<div align="center">
							<a href="/index" style="padding: 10px 185px"
								class="btn btn-danger btn-lg"> <span
								class="glyphicon glyphicon-share"></span> 뒤로가기
							</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
