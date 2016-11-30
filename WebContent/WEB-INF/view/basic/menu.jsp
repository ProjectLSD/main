<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
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
	<h3 style="color: white;" align="center">LSD</h3>
	<hr />
	<c:choose>
			<c:when test="${sessionScope.userId == 'admin'}">
		<b style="color: red;">　　　　　　manager account</b>
				<ul class="nav nav-pills nav-stacked">
		<li><a href="/top/chart"><span
				class="glyphicon glyphicon-thumbs-up"></span> Music Chart</a></li>
		<li><a href="/band/topList"><span
				class="glyphicon glyphicon-cd"></span> Band Chart</a></li>
		<li><a href="/board/list"><span
				class="glyphicon glyphicon-tags"></span> FreeTalk</a></li>	
		<li><a href="/file/list"><span
				class="glyphicon glyphicon-book"></span> AlbumCheck</a></li>		
		<li><a href="/bandNotice/notice"><span
				class="glyphicon glyphicon-bullhorn"></span> Band AD</a></li>
				<li><a href="/"><span
				class="glyphicon glyphicon-music"></span> Music</a></li>
	</ul>
			</c:when>
			<c:otherwise>
	
	<ul class="nav nav-pills nav-stacked">
		<li><a href="/top/chart"><span
				class="glyphicon glyphicon-thumbs-up"></span> Music Chart</a></li>
		<li><a href="/band/topList"><span
				class="glyphicon glyphicon-cd"></span> Band Chart</a></li>
		<li><a href="/board/list"><span
				class="glyphicon glyphicon-tags"></span> FreeTalk</a></li>
		<c:if test="${sessionScope.check == 'band' }">		
		<li><a href="/file"><span
				class="glyphicon glyphicon-book"></span> Album Register</a></li>
		</c:if>
		<li><a href="/bandNotice/notice"><span
				class="glyphicon glyphicon-bullhorn"></span> Band AD</a></li>
				<li><a href="/"><span
				class="glyphicon glyphicon-music"></span> Music</a></li>
	</ul>
			</c:otherwise>
			</c:choose>
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
							href="/myInfo/info">My Info</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1"
							href="/cash/controller">Point : ${point}</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1"
							data-toggle="modal" data-target="#myModal">Point Charge</a></li>
						<li role="presentation" class="divider"></li>
						<li role="presentation"><a role="menuitem" tabindex="-1"
							href="/logout">Logout</a></li>
					</ul>
				</div>
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					align="left" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span><span class="sr-only">Close</span>
								</button>
								<h2 style="color: silver;">Point-up</h2>
							</div>
							<form class="modal-body" action="/cash/chargePoint" method="post">
								<h2 style="color: red;">My Point</h2>
								<br /> <b style="color: silver;">Holding point : ${point}</b> <select
									required name="point">
									<option value="">Point</option>
									<option value="100">100</option>
									<option value="200">200</option>
									<option value="300">300</option>
									<option value="400">400</option>
								</select>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
									<input type="submit" class="btn btn-primary" value="층전" />
								</div>
							</form>
						</div>
					</div>
				</div>

			</c:otherwise>
		</c:choose>
	</div>
	<ul class="nav nav-pills nav-stacked">
		<li><a href="/top/chart"><span
				class="glyphicon glyphicon-send"></span> Introduce</a></li>
		<li><a href="/chart/all"><span
				class="glyphicon glyphicon-thumbs-up"></span> Hot Chart</a></li>
				<br>
	</ul>
	<hr />
</div>






