<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<div class="jumbotron text-center">
	<h1>My personal information</h1>
	<p>Resize this responsive page to see the effect!</p>
</div>

<div class="container">
	<div class="row">
		<c:forEach var="obj" items="${data }">
			<div class="col-sm-4">
				<h3>My information 1</h3>
				My ID : ${obj.ID }<br> Name : ${obj.NAME }<br>
			</div>
			<div class="col-sm-4">
				<h3>My information 2</h3>
				E-mail : ${obj.EMAIL }<br> Phone number : ${obj.PHONENUM1 } -
				${obj.PHONENUM2 } - ${obj.PHONENUM3 }<br>
			</div>
			<div class="col-sm-4">
				<h3>My information 3</h3>
				Point : ${obj.POINT }<br> Follow :${obj.LIKES }<br>
			</div>
	</div>
</div>
<hr/>
</c:forEach>
