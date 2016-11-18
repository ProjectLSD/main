<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.button4 {
    background-color: white;
    color: black;
    border: 2px solid #555555;
}

.button4:hover {
    background-color: #555555;
    color: white;
}
#bu.btn-default {
		
		border: 2px solid #000;
      background: #000;
      color: #fff;
   }
#bu.btn-default:hover {
      background: #fff;
      color: #000;
   }

</style>
</head>

<body>
  <div align="center">
         <img src="/logo.png" height="180"; width="80%" onclick="location.href='/index'"/>
         </div>
         <form action="/file/search">
         <div class="input-group">
        <input type="text" class="form-control" placeholder="Search Blog.." name="q">
        <span class="input-group-btn">
          <input class="btn btn-default" type="submit">
            <span class="glyphicon glyphicon-search"></span>
            </input>
        </span>
      </div>
         </form>
    <div align="left">
      <h3 align="center">LSD</h3><hr/>
      <ul class="nav nav-pills nav-stacked">
        <li>메뉴</li>
        <li ><a style="color: white"; href="/top/chart"><span class="glyphicon glyphicon-thumbs-up"></span> 인기순위</a></li>
        <li><a style="color: white"; href="/board/list"><span class="glyphicon glyphicon-tags"></span>  자유게시판</a></li>
        <li><a style="color: white"; href="/file/list"><span class="glyphicon glyphicon-book"></span> 유용한자료</a></li>
      </ul><hr/>
<div align="center">
<c:choose>
<c:when test="${sessionScope.userId == null}">
  <button type="button" class="btn btn-default button button4" onclick="location.href='/login'">로그인</button>&nbsp;
  <button type="button" class="btn btn-default button button4" onclick="location.href='/join'">회원가입</button>
</c:when>
<c:otherwise>
	

  <div class="dropdown">
  <i class="glyphicon glyphicon-user" style="font-size:48px;color:lightblue; margin-top: 15px; margin-bottom: 0px;"></i> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <button style="margin-top: 0px; margin-bottom: 25px;" class="btn btn-default dropdown-toggle" type="button" id="bu" data-toggle="dropdown"><h5>${sessionScope.userId }&nbsp;&nbsp;&nbsp;
     <span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;&nbsp;</h5></button>
    <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="bu">
      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">내정보</a></li>
      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">캐시 : 0</a></li>
      <li role="presentation" class="divider"></li>
      <li role="presentation"><a role="menuitem" tabindex="-1" href="/logout">로그아웃</a></li>
    </ul>
  </div>
</c:otherwise>
</c:choose>
</div>
<hr/>

</div>
 <div align="left">
      <ul class="nav nav-pills nav-stacked">
        <li><a style="color: white; href="#section1">영화</a></li>
        <li ><a style="color: white; href="#section2">공포</a></li>
        <li><a style="color: white; href="#section3">액션</a></li>
        <li><a style="color: white; href="#section3">로맨스</a></li>
        <li><a style="color: white; href="#section3">코미디</a></li>
      </ul>
</div>
<hr/>
 <div align="left">
      <ul class="nav nav-pills nav-stacked">
        <li><a style="color: white; href="#section1">포토</a></li>
        <li ><a style="color: white; href="#section2">여행</a></li>
        <li><a style="color: white; href="#section3">추억</a></li>
        <li><a style="color: white; href="#section3">사물</a></li>
        <li><a style="color: white; href="#section3">맥심</a></li>
      </ul>
</div>
<hr/>

</body>
</html>

   




