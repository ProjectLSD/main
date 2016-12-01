<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
var i = 0;
</script>
<div class="container">
   <h2 style="color: white; border: 2px;">FREE-TALK</h2>
   <br />
   <div class="panel panel-default" style="width: 700px; border: 2px;" >
      <div class="panel-heading" style="color:white; border: 2px; background-color: #434354">${board.subject}</div>
      <table class="table table-bordered" style=" border: 2px; background-color: #282832" >
         <tr style="color: black; border: 2px;" >
            <td align="center" width="30px" style="color: white; border: 2px;"><span
               class="glyphicon glyphicon-blackboard"></span></td>
            <td style="color: white; border: 2px;"><b>${board.writer}</b></td>
            <td align="right" width="200px" style="color: white; border: 2px;"><span
               class="glyphicon glyphicon-time" style="text-align: right;"><fmt:formatDate
                     value="${board.writedate}" pattern="yyyy-MM-dd hh:mm:ss" /></span></td>
            <td width="50px" style="color: white; border: 2px;"><span class="glyphicon glyphicon-eye-open">&nbsp;${board.viewcount}</span></td>
            <td width="50px" style="color: white; border: 2px;"><span class="glyphicon glyphicon-thumbs-up">&nbsp;${board.likes}</span></td>
         </tr>
      </table>
      <div class="panel-body" style="color:white; border: 2px; background-color: #282832">${board.comments}</div>
   </div>
   <c:set var="user" value="${sessionScope.userId}"/>
   <div align="right" style="padding-right: 450px;">
      <c:if test="${board.writer eq user}">
      <form action="/board/register" method="post">
      <input type="hidden" name="subject" value="${board.subject}">
      <input type="hidden" name="comments" value="${board.comments}">
      <input type="hidden" name="num" value="${board.num}">
      <button type="submit" class="btn btn-default" id="bt1" style="padding:10px;"> 
      <b>수정</b>
      </button>
      <button type="button" class="btn btn-default" id="bt2" style="padding:10px;">
      <b>삭제</b>
      </button>
      </form>
      </c:if>
   </div>
   <!-- 리뷰 입력 -->

   <br />
   <div class="panel panel-default" style="width: 700px; border:2px; ">
      <div class="panel-heading" style="border:2px; background-color: #282832;">
         <input size="4" type="text" required="required" class="form-control"
            id="comments" name="review" placeholder=" 내용" style="border:2px; color:white; background-color: #a8a8b9;"><br /> <input
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
         <div class="panel panel-default" style="border:2px; width: 700px; margin-bottom: 5px;">
            <div style="border:2px; background-color:#434354; color:white; padding: 0px;" class="panel-heading">
               <table style="width:700px; border:2px; table-layout: fixed; word-break: break-all;">
                  <tr style="background-color:#434354; color: white;">
                     <td style="padding: 10px;" width="70%">${r.writer}</td>
                     <td style="padding: 10px;" align="right" ; width="200px">
                     <span class="glyphicon glyphicon-time" style="text-align: right;">
                     <fmt:formatDate value="${r.writedate}" pattern="yyyy-MM-dd HH:mm:ss" />
                     </span>
                     </td>
                  </tr>
                  <tr style="color:white;background-color: #282832">
                     <td colspan="2" style="padding: 10px;">${r.comments}</td>
                    
                  </tr>
               </table>
            </div>
         </div>
      		<c:if test="${r.writer eq user}">
      		<div class="but" align="right" style="padding-right: 450px;">
      		<button type="button" class="btt" id="bu" value="${r.uuid}" style="padding:10px;">      		
      		<b>삭제</b>
      		</button>
      		<script>
			$("#bu").attr("id",function(){
				i=i+1;
				console.log("button"+i);
				return "button"+i;
			});
      		</script>
	   		</div>
	   		<br/>
      		</c:if>
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
   $(".btt").click(function() {
	      var uuid = $(this).attr("value");
	      console.log(uuid);
	      //var pass = $("#pass").val();
	      //var save = $("#save").prop("checked");
	      $.ajax({
	         "url" : "/review/delete?uuid="+uuid,
	         "method" : "post",
	         "aSync" : true
	      }).done(function(txt) {  
	         console.log(txt);
	         location.reload();
	      })
	   });
</script>