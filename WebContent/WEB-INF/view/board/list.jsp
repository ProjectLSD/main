<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <h2 style="color: white;">자유게시판</h2>
  <p>우리모두 매너있게 글을 써봐요 ^^</p>
  <hr/>
  <table class="table">
    <thead>
      <tr>
        <th><p class="glyphicon glyphicon-search"></p></th>
        <th><p class="glyphicon glyphicon-time"></p></th>
        <th><p class="glyphicon glyphicon-pencil"></p></th>
        <th><p class="glyphicon glyphicon-user"></p></th>  
        <th><p class="glyphicon glyphicon-thumbs-up"></p></th>
        <th><p class="glyphicon glyphicon-eye-open"></p></th>
      </tr>
    </thead>
    <tbody>
      <tr class="success">
        <td>1</td>
        <td>16-11-15</td>
        <td>뭘 처다보노??</td>
        <td>jjs01</td>
        <td>1</td>
        <td>183</td>
      </tr>
      <c:forEach items="${board}" var="b">
      	<tr>
      		<td>${b.num}</td>
      		<td><fmt:formatDate value="${b.writedate}" pattern="yy-MM-dd"/></td>
      		<td style="color: white;"><a href="/board/view?num=${b.num}">${b.subject}</td>
      		<td >${b.writer}</td>
      		<td>${b.likes}</td>
      		<td>${b.viewcount}</td>
      	</tr>
      </c:forEach>
      
    </tbody>
  </table>
</div>
<div class="container" align="center">
  <ul class="pagination">
    <li><a href="#">≪</a></li>
    <li><a href="#">＜</a></li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li class="disabled"><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li class="active"><a href="#">6</a></li>
    <li><a href="#">＞</a></li>
    <li><a href="#">≫</a></li>
  </ul>
</div>
<input type="button" class="btn btn-info btn-sm" value="글작성" onclick="location.href='/board/register'"/>
</body>
</html>
