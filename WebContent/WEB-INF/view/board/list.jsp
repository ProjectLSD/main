<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">
	<h2 style="color: white;">자유게시판</h2>
	<p>우리모두 매너있게 글을 써봐요 ^^</p>
	<hr />
	<table class="table">
		<thead>
			<tr>
				<th><p class="glyphicon glyphicon-search"></p></th>
				<th><p class="glyphicon glyphicon-time"></p></th>
				<th><p class="glyphicon glyphicon-pencil"></p></th>
				<th><p class="glyphicon glyphicon-user"></p></th>
				<th><p class="glyphicon glyphicon-thumbs-up"></p></th>
				<th><p class="glyphicon glyphicon-eye-open"></p></th>
			</tr>
		</thead>
		<tbody>
			<tr style="color: black;" class="success">
				<td>1</td>
				<td>16-11-15</td>
				<td>뭘 처다보노?? 염탐하지마라</td>
				<td>jjs01</td>
				<td>1</td>
				<td>183</td>
			</tr>
			<c:forEach items="${data}" var="b">
				<tr>
					<td>${b.NUM}</td>
					<td><fmt:formatDate value="${b.WRITEDATE}" pattern="yy-MM-dd" /></td>
					<td style="color: white;"><a href="/board/view?num=${b.NUM}">${b.SUBJECT}</a></td>
					<td>${b.WRITER}</td>
					<td>${b.LIKES}</td>
					<td>${b.VIEWCOUNT}</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
</div>
<div class="container" align="center">
	<ul class="pagination">
		<li><a href="/board/list?p=1">≪</a></li>
		<c:choose>
			<c:when test="${p > 1 }">
				<li><a href="/board/list?p=${p-1}">＜</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/board/list?p=1">＜</a></li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="num" begin="1" end="${last }" step="1">
			<c:choose>
				<c:when test="${p==num }">
					<li class="active"><a href="/board/list?p=${num}"> ${num }
					</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/board/list?p=${num}"> ${num } </a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${p < last }">
				<li><a href="/board/list?p=${p+1}">＞</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/board/list?p=${last}">></a></li>
			</c:otherwise>
		</c:choose>
		<li><a href="/board/list?p=${last}">≫</a></li>
	</ul>
</div>
<input type="button" class="btn btn-info btn-sm" value="글작성"
	onclick="location.href='/board/register'" />

