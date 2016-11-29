	<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">

   <h2 style="color: white;">밴드 홍보 게시판</h2>
   <p>밴드 홍보</p>
   <hr />  
   <table class="table">
      <thead>
         <tr>
            <th><p class="glyphicon glyphicon-time"></p></th>
            <th><p class="glyphicon glyphicon-user"></p></th>
            <th><p class="glyphicon glyphicon-pencil"></p></th>
            <th><p class="glyphicon glyphicon-search"></p></th>
         </tr>
      </thead>
      <tbody>
         <c:forEach items="${data}" var="b">
            <tr>
               <td style="width: 80px;"><fmt:formatDate value="${b.WRITEDATE}" pattern="yy-MM-dd" /></td>
               <td>${b.ID}</td>
               <td style="color: white;"><a href="/bandNotice/view?num=${b.NUM}">${b.TITLE}</a></td>
            </tr>
         </c:forEach>

      </tbody>
   </table>

</div>
<div class="container" align="center">
   <ul class="pagination">
      <li><a href="/bandNotice/view?p=1">≪</a></li>
      <c:choose>
         <c:when test="${p > 1 }">
            <li><a href="/bandNotice/view?p=${p-1}">＜</a></li>
         </c:when>
         <c:otherwise>
            <li><a href="/bandNotice/view?p=1">＜</a></li>
         </c:otherwise>  
      </c:choose>
      <c:forEach var="num" begin="1" end="${last }" step="1">
         <c:choose>  
            <c:when test="${p==num }">
               <li class="active"><a href="/bandNotice/view?p=${num}"> ${num }
               </a></li>
            </c:when>
            <c:otherwise>
               <li><a href="/bandNotice/view?p=${num}"> ${num } </a></li>
            </c:otherwise>
         </c:choose>
      </c:forEach>
      <c:choose>
         <c:when test="${p < last }">
            <li><a href="/bandNotice/view?p=${p+1}">＞</a></li>
         </c:when>
         <c:otherwise>
            <li><a href="/bandNotice/view?p=${last}">></a></li>
         </c:otherwise>
      </c:choose>
      <li><a href="/bandNotice/view?p=${last}">≫</a></li>
   </ul>
</div>
<input type="button" class="btn btn-info btn-sm" value="글작성"
   onclick="location.href='/baneNotice/write'" />
	
