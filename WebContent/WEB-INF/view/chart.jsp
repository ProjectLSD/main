<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<b style="color: red">TOP 10</b>
<br />
<c:forEach var="obj" items="${top }">
	${obj.GENRE }| <a href="#f${obj.FILENUM }" style="text-decoration: none">${obj.FILENAME }</a>&nbsp;&nbsp;
</c:forEach>
<hr />