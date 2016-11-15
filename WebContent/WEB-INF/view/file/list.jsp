<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h3 id="ftop">자료목록</h3>
총
<b>${size}</b>
개의 자료가 등록되어 있으며, 다운로드 이용에 제약은 없습니다.
<hr />
<b style="color: red">최근 인기자료 TOP 3</b>
<br />
<c:forEach var="obj" items="${top }">
	${obj.cate }| <a href="#f${obj.num }" style="text-decoration: none">${obj.filename }</a>&nbsp;&nbsp;
</c:forEach>
<hr />
<c:forEach var="obj" items="${data }">
	<div id="f${obj.num }">	
		→  제공자 : ${obj.uploader }   /  <a href="javascript:openReview(${obj.num })">리뷰보기</a> <br />
		→	파일설명 :${obj.comments } <span style="color: green">(다운로드수
			:${obj.count })</span>
		<br />
		→	<a href="/file/down.nhn?num=${obj.num }">${obj.filename }</a>
		<c:choose>
			<c:when test="${obj.filesize gt 1024*1024*1024 }">
				<fmt:formatNumber value="${obj.filesize / (1024*1024*1024) }" />  GB
				</c:when>
			<c:when test="${obj.filesize gt 1024*1024 }">
				<fmt:formatNumber value="${obj.filesize / (1024*1024) }" /> MB
				</c:when>
			<c:otherwise>
				<fmt:formatNumber value="${obj.filesize / (1024) }" /> KB
				</c:otherwise>
		</c:choose>
	</div>
	<hr style="width: 80%" align="left" />
</c:forEach>
<c:forEach var="num" begin="1" end="${last }" step="1">
	<a href = "/file/list.nhn?p=${num}"> ${num } </a>	
</c:forEach>
<br>
<!-- 
<a href="#ftop">맨위로</a>
 -->
<script>
	function openReview(num) {
		var url = "/file/review.nhn?target="+num;
		window.open(url, "", "width=400,height=300");	// window.open 자바스크립트 함수
	}
	
	var aws;
	window.onload = function() {
		var target = "ws://192.168.10.2/ws/notice.nhn";
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








