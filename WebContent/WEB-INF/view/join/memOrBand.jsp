<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
    #aaa{
    
background-image:url("/main.jpg");
background-size: cover;
}
.button4 {
    background-color: white;
    color: black;
    border: 2px solid #555555;
}

.button4:hover {
    background-color: #555555;
    color: white;
}
</style>
<body id="aaa"></body>
 <h2 class="container" style="color: white;">JSD 회원가입</h2><hr/>
      <br/><br/><br/><br/><br/>
   <div class="container" align="center">
      <input type="button" style="padding: 128px 100px" class="btn btn-default button button4 btn-lg" value="일반 회원가입" onclick="location.href='/member/join'"/> 
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" style="padding: 128px 100px" class="btn btn-default button button4 btn-lg"value="BAND 회원가입" onclick="location.href='/band/join'"/>
   </div>
   <br/>
   <div class="container">
      <div align="center">
       <a href="/index" style="padding: 10px 310px" class="btn btn-primary btn-lg">
          <span class="glyphicon glyphicon-share"></span> 뒤로가기
        </a>
      </div>
      <ul style="color: white;">
    
      </ul>
   </div>