<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<b style="color: silver;">�� ����</b>
<br />
<br />
<br />
<hr />
<c:forEach var="obj" items="${data }">
<b style="color: silver;">
	���̵� : ${obj.ID }<br>
	�̸� : ${obj.NAME }<br>
	�̸��� : ${obj.EMAIL }<br>
	��ȭ��ȣ : ${obj.PHONENUM1 } - ${obj.PHONENUM2 } - ${obj.PHONENUM3 }<br>
	����Ʈ : ${obj.POINT }<br>
	�ȷο� �� :${obj.LIKES }<br>
</b>

<hr />
</c:forEach>