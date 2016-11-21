<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div align="center">
   <div class="thumbnail">
      <img src="paris.jpg" alt="Paris" width="400" height="300" />
   </div>
   <div align="center">
      <div class="row text-center">
         <c:forEach var="ob" items="${album }">
         <br/>
            
            <strong style="color: black;">${ob.ALBUM }</strong>
            <audio style="width: 290px; height: 30px;" controls="controls">
               <source src="/${ob.FILEUUID}">
            </audio>
            <br/>
         </c:forEach>
      </div>
   </div>