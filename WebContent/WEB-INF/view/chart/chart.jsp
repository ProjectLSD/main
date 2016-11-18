<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<b style="color: red">다운로드 순 TOP 10</b>
<br />
<br />
<br />
<hr />
<c:forEach var="obj" items="${top }">
	${obj.GENRE }| <a href="#f${obj.FILENUM }"
		style="text-decoration: none">${obj.FILENAME }</a>&nbsp;&nbsp;
<hr />
</c:forEach>