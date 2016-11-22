<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div align="center">
<h2>Play list</h2>
<c:if test="${sessionScope.PlayList ne null }">
<c:forEach items="${sessionScope.PlayList }" var="li">
	<b style="color: pink;">앨범 : ${li.ALBUM } <br/> 파일이름 : ${li.FILENAME } <br/> 파일고유번호: ${li.FILEUUID }</b>
</c:forEach>	
</c:if>
</div>


