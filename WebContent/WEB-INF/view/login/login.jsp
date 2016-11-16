<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${sessionScope.userId == null}">
		<fieldset style="width: 100">
		<legend><b> L o g i n </b></legend>
		<form action="/home" method="post">
			<b>&nbspID&nbsp</b>			
			<input type="text" required="required" name="id"/><br/>
			<br/>
			<b>PW</b>
			<input type="password" required="required" name="pass"/><br/>	
			<br/>
			<input type="submit" class="btn btn-default" value="Login">
			<input type="checkbox" name="save" /><span style="font-size: 8pt">아이디저장</span>		
		</form>
		</fieldset>
		
		<a href="/member/join.it">아직 회원이 아니십니까?</a><br/>
		<a href="javascript:openfindid()">아이디 찾기</a><br/>
		<a href="javascript:openfindpass()">비밀번호 찾기</a><br/>
		<script>
			function openfindid(){
				var url = "/findid";
				window.open(url, "findid", "height=130,width=200");
				
			}
			</script>
		<script>
			function openfindpass(){
				var url = "/findpass";
				window.open(url, "findpass", "height=180,width=200");
			}
		</script>
		<a href="javascript:openchat()">채팅방</a>
		<script>
			function openchat(){
				var url = "/chat";
				window.open(url, "chat", "height=400,width=300");
			}
		</script>
		</c:when>
	<c:otherwise>
		<fieldset style="width: 100">
		<legend>${sessionScope.userId }님</legend>
			<p><a href="">내 정보</a></p>
			<p><a href="">포인트 충전</a></p>
			<p><a href="">포인트 충전내역</a></p>
			<p><a href="/mail/confirm.it">메일 인증</a></p>
			<p><a href="/logout">로그아웃</a></p>
		</fieldset>
	</c:otherwise>
</c:choose>