<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
  <div align="center">
         <img src="/logo.png" height="180"; width="80%" onclick="location.href='/index'"/>
         </div>
         <div class="input-group">
        <input type="text" class="form-control" placeholder="Search Blog..">
        <span class="input-group-btn">
          <button class="btn btn-default" type="button">
            <span class="glyphicon glyphicon-search"></span>
          </button>
        </span>
      </div>
    <div align="left">
      <h3 align="center">LSD</h3><hr/>
      <ul class="nav nav-pills nav-stacked">
        <li><a style="color: white"; href="#section1">메뉴</a></li>
        <li ><a style="color: white"; href="#section2"><span class="glyphicon glyphicon-thumbs-up"></span> 인기순위</a></li>
        <li><a style="color: white"; href="/board/list"><span class="glyphicon glyphicon-tags"></span>  자유게시판</a></li>
        <li><a style="color: white"; href="#section3"><span class="glyphicon glyphicon-book"></span> 유용한자료</a></li>
      </ul><hr/>
<div align="center">
  <button type="button" class="btn btn-success" onclick="location.href='/login'">로그인</button>&nbsp;
  <button type="button" class="btn btn-info" onclick="location.href='/join'">회원가입</button>
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

