<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container">
   <h2 style="color: white;">FREE-TALK</h2>
   <br />
   <div class="panel panel-default" style="width: 700px;">
      <div class="panel-heading">${board.subject}</div>
      <table class="table table-bordered">
         <tr style="color: black;">
            <td align="center" width="30px"><span
               class="glyphicon glyphicon-blackboard"></span></td>
            <td><b>${board.writer}</b></td>
            <td align="right" width="200px"><span
               class="glyphicon glyphicon-time" style="text-align: right;"><fmt:formatDate
                     value="${board.writedate}" pattern="yyyy-MM-dd hh:mm:ss" /></span></td>
            <td width="50px"><span class="glyphicon glyphicon-eye-open">&nbsp;${board.viewcount}</span></td>
            <td width="50px"><span class="glyphicon glyphicon-thumbs-up">&nbsp;${board.likes}</span></td>
         </tr>
      </table>
      <div class="panel-body">${board.comments}</div>
   </div>
   <div align="right" style="padding-right: 450px;">
   <c:set var="user" value="${sessionScope.userId}"/>
      <c:if test="${board.writer eq user}">
      <button type="button" class="btn btn-default" id="bt1" style="padding:10px;" 
      onclick=location.href="/board/register?subject=${board.subject}&comments=${board.comments}&num=${board.num}">
      <b>수정</b>
      </button>
      <button type="button" class="btn btn-default" id="bt2" style="padding:10px;">
      <b>삭제</b>
      </button>
      </c:if>
   </div>
   <!-- 리뷰 입력 -->

   <br />
   <div class="panel panel-default" style="width: 700px;">
      <div class="panel-heading">
         <input size="4" type="text" required="required" class="form-control"
            id="comments" name="review" placeholder=" 내용"><br /> <input
            type="button" class="btn btn-success" id="bt" value="댓글등록">
      </div>
   </div>
   <button type="button" class="btn btn-default" id="rbt"
      style="padding: 5px;">
      <h3 style="margin: 2px;">
         <b>${review.size() }</b>
      </h3>
      comment
   </button>
   <!-- 리뷰 출력  -->
   <br /> <br />
   <div id="rv" style="display: none;">
      <c:forEach items="${review }" var="r">
         <div class="panel panel-default" style="width: 700px;">
            <div style="color: black;" class="panel-heading">
               <table style="table-layout: fixed; word-break: break-all;">
                  <tr style="color: black;">
                     <td width="70%">${r.writer}</td>
                     <td align="right" ; width="200px"><span
                        class="glyphicon glyphicon-time" style="text-align: right;"><fmt:formatDate
                              value="${r.writedate}" pattern="yyyy-MM-dd hh:mm:ss" /></span></td>
                  </tr>
                  <tr style="color: black;">
                     <td>${r.comments}</td>
                  </tr>
               </table>
            </div>
         </div>
      </c:forEach>
   </div>
</div>
<script>
   $("#bt").click(function() {
      var comments = $("#comments").val();
      var boardnum = ${board.num};
      //var pass = $("#pass").val();
      //var save = $("#save").prop("checked");
      $.ajax({
         "url" : "/review?comments=" + comments + "&boardnum=" + boardnum,
         "method" : "post",
         "aSync" : true
      }).done(function(txt) {  
         console.log(txt);
         location.reload();
      })
   });

   $("#rbt").click(function() {
      $("#rv").slideToggle();
   });
   
   $("#bt2").click(function() {
	      //var comments = $("#comments").val();
	      var num = ${board.num};
	      //var pass = $("#pass").val();
	      //var save = $("#save").prop("checked");
	      $.ajax({
	         "url" : "/board/delete?num=" + num,
	         "method" : "post",
	         "aSync" : true
	      }).done(function(txt) {  
	         console.log(txt);
	         location.href='http://127.0.0.1/board/list';
	      })
	   });
</script>