<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>로그인</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    #aaa{
    
background-image:url("main.jpg");
background-size: cover;
}
 .modal-header, h4, .close {
      background-color: #333;
      color: #fff !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-header, .modal-body {
      padding: 40px 50px;
  }
</style>
<body id="aaa"></body>
<div class="modal fade in" id="myModal" role="dialog" style="display: block; padding-right: 19px;">
    <div class="modal-dialog">
    
      <!-- Modal content-->
    <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"></button>
          <h4><span class="glyphicon glyphicon-lock"></span> LOGIN</h4>
        </div>
        <div class="modal-body">
          <form role="form" action="/home">
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-user"></span>I D</label>
              <input type="text" class="form-control" id="psw" name="id" placeholder="아이디">
            </div>
            <div class="form-group">
            
              <label for="usrname"><span class="glyphicon glyphicon-lock"></span>password</label>
              <input type="text" class="form-control" id="usrname" name="pass" placeholder="비밀번호">
            </div >
            <button type="submit" class="btn btn-block">Login
                <span class="glyphicon glyphicon-ok"></span>
              </button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal" onclick="location.href='/index'">
            <span class="glyphicon glyphicon-remove"></span> Cancel
          </button>
           <a href="/join">회원가입</a>
        </div>
      </div>
    </div>
  </div>
