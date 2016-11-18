<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<b style="color: silver;">내 정보</b>
<br />
<br />
<br />
<hr />
<c:forEach var="obj" items="${data }">
<b style="color: silver;">
	아이디 : ${obj.ID }<br>
	이름 : ${obj.NAME }<br>
	이메일 : ${obj.EMAIL }<br>
	전화번호 : ${obj.PHONENUM1 } - ${obj.PHONENUM2 } - ${obj.PHONENUM3 }<br>
	포인트 : ${obj.POINT }<br>
	팔로우 수 :${obj.LIKES }<br>
</b>

<hr />
</c:forEach>