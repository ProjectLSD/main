<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div align="center">
   <marquee>
      <h1 style="color: white;">A crazy person in music can hear a
         sound</h1>
   </marquee>
</div>
<h1 style="color: white;">WLECOME</h1>
<p>음악을 좋아하는사람은 그 소리마저 보인다</p>
<hr>
<h3 style="color: white;">Test</h3>
<p>뿌잉뿌잉</p>
<hr />


<div class="row text-center">
   <c:forEach var="ob" items="${map }">
      <div class="col-sm-4">
         <div class="thumbnail">
            <img src="paris.jpg" alt="Paris" width="400" height="300">
            <p>
               <strong style="color: black;">${ob.OWNER }</strong>
            </p>
            <p style="color: black;">${ob.OWNER }</p>
            <button class="btn" data-toggle="modal" data-target="#myModal">음악듣기</button>
         </div>
      </div>
   </c:forEach>
</div>
<script>
