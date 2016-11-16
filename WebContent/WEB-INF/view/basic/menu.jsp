<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
 
 <div align="justify"> 
<a id="bt" value="Genre">☆차트</a>;
</div>
<div style="height: 200; background: gray;" id="port">
   <a href="???">발라드</a><br/>
   <a href="??">댄스</a><br/>
   <a href="??">랩/힙합</a><br/>
   <a href="??">R&B/Soul</a><br/>
   <a href="???">인디음악</a><br/>
   <a href="???">록/메탈</a><br/>
   <a href="??">트로트</a><br/>
   <a href="???">포크/블루스</a><br/>
</div>

<script>
   $("#bt").dblclick(function(){
      $("#port").slideToggle();
      //document.getElementById("port").slideToggle();
      ////$(document.getElementById("port")).slideToggle();
   });
</script>
     <div align="center">
       <ul class="nav navbar-nav">  
        <li class="active"/>
        <li><a href="/home.it">Latest</a><li></br>
        <li ><a href="/file/req">POT10</a></li></br>
        <li><a href="/file/getAll">Music contest</a></li></br>
        <li><a href="#">Information</a></li></br>
         <li><a href="/login">Login</a></li><br/>
         
        </ul>
        </div>
      