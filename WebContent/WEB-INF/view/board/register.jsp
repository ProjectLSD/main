<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2 style="color: white;">글작성</h2>
<c:choose>
<c:when test="${subject==null}">
<form action="/board/insertin">
</c:when>
<c:otherwise>
<form action="/board/update" method="post">
<input type="hidden" name="num" value="${board.num }" /> 
</c:otherwise>
</c:choose>
   <div class="panel panel-default" style="width: 700px;">
      <div class="panel-heading">
         <input size="4" type="text" required="required" id="subject" class="form-control"
             name="subject" placeholder=" 제목"> 
      </div>
   </div>
   <div class="panel panel-default" style="width: 700px;">
      <div class="panel-heading">
         <textarea name="comments" id="comments" rows="15" cols="92" placeholder=" 내용"></textarea>
         <br /> <input type="submit" class="btn btn-success" id="bt"
            value="등록">
      </div>
   </div>
</form>
<script>
subject.value="${board.subject}"
comments.value="${board.comments}"
</script>