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
					<span class="glyphicon glyphicon-lock"></span> ID/PW 찾기
				</h4>
			</div>
			<div class="modal-body">
				<form name="joinform" action="/band/input" method="post"
					style="font-size: 12pt;" class="form-inline">
					<input type="hidden" name="menu" value="input" />
					<div>
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#home">밴드
									ID찾기</a></li>
							<li><a data-toggle="tab" href="#menu1">밴드 PW찾기</a></li>
							<li><a data-toggle="tab" href="#menu2">일반 ID찾기</a></li>
							<li><a data-toggle="tab" href="#menu3">일반 PW찾기</a></li>
						</ul>

						<div class="tab-content">
							<div id="home" class="tab-pane fade in active">
								<br />
								<div class="form-group" style="padding-bottom: 5px;">
									<label>Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<input type="text" class="form-control" name="name"
										placeholder="이름">
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
									</select> <input type="text" class="form-control" name="phonenum2"
										maxlength="4" size="1px;"> <input type="text"
										class="form-control" name="phonenum3" maxlength="4"
										size="1px;">
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-danger btn-default pull-left"
										data-dismiss="modal" onclick="location.href='/login'">
										<span class="glyphicon glyphicon-remove"></span>취소
									</button>
									<input type="submit" class="btn btn-default btn-success"
										name="join" value="찾기" onclick="join_click()">
								</div>
							</div>
							<div id="menu1" class="tab-pane fade">
								<div class="form-group" style="padding-bottom: 5px;">
									<br /> <label>I D
										:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<input type="text" required="required" class="form-control"
										maxlength="20" name="id" id="cid" placeholder="사용할 아이디">
								</div>
								<br />
								<div class="form-group" style="padding-bottom: 5px;">
									<label>Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<input type="text" class="form-control" name="name"
										placeholder="이름">
								</div>
								<div class="form-group" style="padding-bottom: 5px;">
									<label>Email
										:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <input
										type="email" required="required" class="form-control"
										id="email" name="email" placeholder="email">&nbsp;
									<button type="button" class="btn btn-default"
										onclick="button_click()">인증받기</button>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-danger btn-default pull-left"
										data-dismiss="modal" onclick="location.href='/login'">
										<span class="glyphicon glyphicon-remove"></span>취소
									</button>
									<input type="submit" class="btn btn-default btn-success"
										name="join" value="찾기" onclick="join_click()">
								</div>
							</div>
							<div id="menu2" class="tab-pane fade">
								<br />
								<div class="form-group" style="padding-bottom: 5px;">
									<label>Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<input type="text" class="form-control" name="name"
										placeholder="이름">
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
									</select> <input type="text" class="form-control" name="phonenum2"
										maxlength="4" size="1px;"> <input type="text"
										class="form-control" name="phonenum3" maxlength="4"
										size="1px;"><br />
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-danger btn-default pull-left"
										data-dismiss="modal" onclick="location.href='/login'">
										<span class="glyphicon glyphicon-remove"></span>취소
									</button>
									<input type="submit" class="btn btn-default btn-success"
										name="join" value="찾기" onclick="join_click()">
								</div>
							</div>
							<div id="menu3" class="tab-pane fade">
								<div class="form-group" style="padding-bottom: 5px;">
									<br /> <label>I D
										:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<input type="text" required="required" class="form-control"
										maxlength="20" name="id" id="cid" placeholder="사용할 아이디">
								</div>
								<br />
								<div class="form-group" style="padding-bottom: 5px;">
									<label>Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<input type="text" class="form-control" name="name"
										placeholder="이름">
								</div>
								<br />
								<div class="form-group" style="padding-bottom: 5px;">
									<label>Email
										:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <input
										type="email" required="required" class="form-control"
										id="email" name="email" placeholder="email">&nbsp;
									<button type="button" class="btn btn-default"
										onclick="button_click()">인증받기</button>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-danger btn-default pull-left"
										data-dismiss="modal" onclick="location.href='/login'">
										<span class="glyphicon glyphicon-remove"></span>취소
									</button>
									<input type="submit" class="btn btn-default btn-success"
										name="join" value="찾기" onclick="join_click()">
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
