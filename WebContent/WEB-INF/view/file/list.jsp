<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h3 id="ftop" style="color: silver;">자료목록</h3>
<b style="color: silver;">총</b>
<b style="color: red;">${size}</b>
<b style="color: silver;"> 개의 자료가 등록되어 있으며, 다운로드 이용에 제약은 없습니다. </b>
<br />
<hr />
<c:forEach var="obj" items="${data }">
	<div id="f${obj.FILENUM }">
		<b style="color: silver;">→ 제공자 : ${obj.OWNER } </b> / <a
			href="javascript:openReview(${obj.FILENUM })">리뷰보기</a> <br /> <b
			style="color: silver;">→ 파일명 :${obj.FILENAME } </b><span
			style="color: green">(다운로드수 :${obj.COUNT })</span> <br /> <b
			style="color: silver;">→</b> <a
			href="/file/down?filenum=${obj.FILENUM }">${obj.FILENAME }</a>
		<c:choose>
			<c:when test="${obj.FILESIZE gt 1024*1024*1024 }">
				<b style="color: silver;"><fmt:formatNumber
						value="${obj.FILESIZE / (1024*1024*1024) }" /> GB</b>
			</c:when>
			<c:when test="${obj.FILESIZE gt 1024*1024 }">
				<b style="color: silver;"><fmt:formatNumber
						value="${obj.FILESIZE / (1024*1024) }" /> MB</b>
			</c:when>
			<c:otherwise>
				<b style="color: silver;"><fmt:formatNumber
						value="${obj.FILESIZE / (1024) }" /> KB</b>
			</c:otherwise>
		</c:choose>
		<br />
		<c:choose>
			<c:when test="${obj.CHECKS == null }">
				<button type="button" class="btn btn-success"
					onclick="location.href='/file/Approval1?filenum=${obj.FILENUM }'">승인</button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-success"
					onclick="location.href='/file/Approval1?filenum=${obj.FILENUM }'"
					disabled='disabled'>등록완료</button>
			</c:otherwise>
		</c:choose>
	</div>
	<hr style="width: 80%" align="left" />
</c:forEach>
<div class="container" align="center">
	<ul class="pagination">
		<li><a href="/file/list?p=1">≪</a></li>
		<c:choose>
			<c:when test="${p > 1 }">
				<li><a href="/file/list?p=${p-1}">＜</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/file/list?p=1">＜</a></li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="num" begin="1" end="${last }" step="1">
			<c:choose>
				<c:when test="${p==num }">
					<li class="active"><a href="/file/list?p=${num}"> ${num }
					</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/file/list?p=${num}"> ${num } </a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${p < last }">
				<li><a href="/file/list?p=${p+1}">＞</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/file/list?p=${last}">></a></li>
			</c:otherwise>
		</c:choose>
		<li><a href="/file/list?p=${last}">≫</a></li>
	</ul>
</div>
<br>
<!-- 
<a href="#ftop">맨위로</a>
 -->
<script>
	function openReview(num) {
		var url = "/file/review.nhn?target=" + num;
		window.open(url, "", "width=400,height=300"); // window.open 자바스크립트 함수
	}

	var aws;
	window.onload = function() {
		var target = "ws://192.168.10.12/ws/notice.nhn";
		aws = new WebSocket(target);
		aws.onopen = function(args) {
			console.log("open!")
		}
		aws.onmessage = function(args) {
			new Audio("/audio/alert.wav").play();
			window.alert("자료 등록중");
		}
	};
</script>








