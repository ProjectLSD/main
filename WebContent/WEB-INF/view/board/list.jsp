<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">

   <h2 style="color: white;">자유게시판</h2>
   <p>우리모두 매너있게 글을 써봐요 ^^</p>
   <hr />
   <table class="table">
      <thead>
         <tr style="background-color: #434354">
            <th><p class="glyphicon glyphicon-time"></p></th>
            <th><p class="glyphicon glyphicon-thumbs-up"></p></th>
            <th><p class="glyphicon glyphicon-search"></p></th>
            <th><p class="glyphicon glyphicon-pencil"></p></th>
            <th><p class="glyphicon glyphicon-user"></p></th>
            <th><p class="glyphicon glyphicon-eye-open"></p></th>
         </tr>
      </thead>
      <tbody>
         <c:forEach items="${notify}" var="n" begin="0" end="0">
         <tr style="color:white;background-color: #282832">
           <td style="width: 80px;"><fmt:formatDate value="${n.writedate}" pattern="yy-MM-dd" /></td>
           <td style="width: 50px;">${n.likes}</td>
           <td style="width: 60px;"><button type="button" class="btn btn-default" style="padding:5px; font-size: 11px;"><b>${n.type}</b></button></td>
           <td><a style="color:white;" href="/board/view?num=${n.num}">${n.subject}</a></td>
           <td>${n.writer}</td>
           <td>${n.viewcount}</td>
         </tr>
         </c:forEach>
         <c:forEach items="${data2}" var="b">
            <tr style="background-color: #282832">
               <td style="width: 80px;"><fmt:formatDate value="${b.WRITEDATE}" pattern="yy-MM-dd" /></td>
               <td style="width: 50px;">${b.LIKES}</td>
               <td style="width: 60px;"><button type="button" class="btn btn-default" style="padding:5px; font-size: 11px;"><b>${b.TYPE}</b></button></td>
               <td style="color: white;"><a href="/board/view?num=${b.NUM}">${b.SUBJECT}</a></td>
               <td>${b.WRITER}</td>
               <td>${b.VIEWCOUNT}</td>
            </tr>
         </c:forEach>

      </tbody>
   </table>

</div>

<input type="button" class="btn btn-info btn-sm " value="글작성"
   onclick="location.href='/board/register'" />
<div class="container" align="center">
   <ul class="pagination">
      <li><a href="/board/list?p=1">≪</a></li>
      <c:choose>
         <c:when test="${p > 1 }">
            <li><a href="/board/list?p=${p-1}">＜</a></li>
         </c:when>
         <c:otherwise>
            <li><a href="/board/list?p=1">＜</a></li>
         </c:otherwise>
      </c:choose>
      <c:forEach var="num" begin="1" end="${last }" step="1">
         <c:choose>
            <c:when test="${p==num }">
               <li class="active"><a href="/board/list?p=${num}"> ${num }
               </a></li>
            </c:when>
            <c:otherwise>
               <li><a href="/board/list?p=${num}"> ${num } </a></li>
            </c:otherwise>
         </c:choose>
      </c:forEach>
      <c:choose>
         <c:when test="${p < last }">
            <li><a href="/board/list?p=${p+1}">＞</a></li>
         </c:when>
         <c:otherwise>
            <li><a href="/board/list?p=${last}">></a></li>
         </c:otherwise>
      </c:choose>
      <li><a href="/board/list?p=${last}">≫</a></li>
   </ul>
</div>
