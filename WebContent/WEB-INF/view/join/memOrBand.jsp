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

</style>
<body id="aaa"></body>
   <div class="container">
      <h2 style="color: white;">JSD 회원가입</h2>
      <hr/>
      <p>원하는 회원 유형을 클릭하세요.</p>
      <input type="button" class="btn btn-default btn-success btn-lg" value="일반 회원가입" onclick="location.href='/member/join'"/>
         
      <input type="button" class="btn btn-default btn-info btn-lg"value="BAND 회원가입" onclick="location.href='/band/join'"/>
   </div>
   <div class="container">
      <h4 style="color: white;">회원가입시</h4>
      <ul style="color: white;">
         <li>일반회원 - 일반적으로 자유게시판 등등..</li>
         <li>밴드회원 - 음원등록을 할수 있음..</li>
      </ul>
   </div>