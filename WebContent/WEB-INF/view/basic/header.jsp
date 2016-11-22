<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div align="center">
<h2>Play list</h2>
<c:if test="${sessionScope.logID ne null }">	
	<b style="color: pink;">앨범 : ${sessionScope.logID.album } <br/> 파일이름 : ${sessionScope.logID.filename } <br/> 파일고유번호: ${sessionScope.logID.fileuuid }</b>
</c:if>
</div>


