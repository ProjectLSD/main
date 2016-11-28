<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


<style>
.btn-default {
	border: 2px;
	background: #23232c;
	color: #fff;
}

.btn-default:hover {
	background: #fff;
	color: #000;
}
</style>
<div align="center">
	<img src="/logo.png" height="180" ; width="80%"
		onclick="location.href='/index'" />
</div>
<form action="/file/search" style="width: 180px; padding-left: 20px;">
	<div class="input-group" align="center">
		<span class="input-group-btn"> <input type="text"
			class="form-control" placeholder="Search Blog.." name="q">
			<button class="btn btn-default" type="submit"
				style="padding-bottom: 7px; padding-top: 7px;">
				<span class="glyphicon glyphicon-search"></span>
			</button>
		</span>
	</div>
</form>
<div align="left">
	<h3 align="center">LSD</h3>
	<hr />
	<ul class="nav nav-pills nav-stacked">
		<li><a href="/top/chart"><span
				class="glyphicon glyphicon-thumbs-up"></span> 인기순위</a></li>
		<li><a href="/board/list"><span
				class="glyphicon glyphicon-tags"></span> 자유게시판</a></li>
		<li><a href="/file/list"><span
				class="glyphicon glyphicon-book"></span> 유용한자료</a></li>
	</ul>

	<hr />
	<div align="center">
		<c:choose>
			<c:when test="${sessionScope.userId == null}">
				<button type="button" class="btn btn-default"
					onclick="location.href='/login'">LOG IN</button>&nbsp;
  <button type="button" class="btn btn-default button button4"
					onclick="location.href='/join'">Sign Up</button>
			</c:when>
			<c:otherwise>


				<div class="dropdown">
					<i class="glyphicon glyphicon-user"
						style="font-size: 48px; color: lightblue; margin-top: 15px; margin-bottom: 0px;"></i>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button style="margin-top: 0px; margin-bottom: 25px;"
						class="btn btn-default dropdown-toggle" type="button" id="bu"
						data-toggle="dropdown">
						<h4>${sessionScope.userId }&nbsp;
							<span class="glyphicon glyphicon-list"></span>
						</h4>
					</button>
					<ul class="dropdown-menu dropdown-menu-right" role="menu"
						aria-labelledby="bu">
						<li role="presentation"><a role="menuitem" tabindex="-1"
							href="/myInfo/info">내정보</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1"
							href="/?/?">포인트</a></li>
						<li role="presentation" class="divider"></li>
						<li role="presentation"><a role="menuitem" tabindex="-1"
							href="/logout">로그아웃</a></li>
					</ul>
					<div class="container" align="left">
						<!-- 버튼 -->
						<button type="button" class="btn btn-primary btn-lg"
							data-toggle="modal" data-target="#myModal">Point charge</button>

						<!-- 모달 팝업 -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">x</span><span class="sr-only">Close</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">Point-up</h4>
									</div>
									<div class="modal-body" align="/cash/chargePoint" method="post">
										<h2 style="color: red;">My point</h2>
										<br/><b style="color: silver;">포인트 : ${point}</b>
										<select required name="point">
											<option value="">Select a point</option>
											<option value="100">100</option>
											<option value="200">200</option>
											<option value="300">300</option>
											<option value="400">400</option>
										</select>
										<br/>
										<br/>
										<br/>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary">충전</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<hr />
</div>










