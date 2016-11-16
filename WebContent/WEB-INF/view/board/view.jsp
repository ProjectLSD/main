<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>    
<div class="container">
  <h2 style="color: white;">FREE-TALK</h2>
  <br/>
  <div class="panel panel-default" style="width: 700px;">
    <div class="panel-heading">${board.subject}</div>
    <table class="table table-bordered">
      <tr style="color: black;">
        <td align="center" width="30px"><span class="glyphicon glyphicon-blackboard"></span></td>
        <td><b>${board.writer}</b></td>
        <td align="right"; width="200px"><span class="glyphicon glyphicon-time" style="text-align: right;"><fmt:formatDate value="${board.writedate}" pattern="yyyy-MM-dd hh:mm:ss"/></span></td>
        <td width="50px"><span class="glyphicon glyphicon-eye-open">&nbsp${board.viewcount}</span></td>
      	<td width="50px"><span class="glyphicon glyphicon-thumbs-up">&nbsp${board.likes}</span></td>
      </tr>
    </table>  
    <div class="panel-body">${board.comments}</div>
   
  </div>
   <!-- 리뷰 -->
    <form action="/band/input" method="post" style="font-size: 12pt;" class="form-inline">
    <br/>
    <div class="form-group" style="padding-bottom: 5px;">
      <input size="82px" type="text" required="required" class="form-control" name="review" placeholder=" 내용">
      <input type="button" class="btn btn-default btn-success" value="submit"> 	
    </div>
    
    <br/>
 <button type="button" class="btn btn-default" onclick="location.href='/login'"><h3><b>1</b></h3><br/>comment</button>

</div>
<script>
   $("#bt").click(function() {
      var id = $("#id").val();
      var pass = $("#pass").val();
      var save = $("#save").prop("checked");
      $.ajax({
         "url" : "/member/loginCheck?id=" + id + "&pass=" + pass,
         "method" : "post",
         "aSync" : true
      }).done(function(txt) {
         console.log(txt);
         if (txt == "true") {
            location.replace("/member/loginConfirm?id="+ id+ "&pass="+ pass+ "&save="+ save);
         } else {
            $("#result").html("<i style='color:red'>회원 정보가 다릅니다!</i>");
         }
      })
   });
</script>
 