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
   <!-- ¸®ºä -->
    <form action="/band/input" method="post" style="font-size: 12pt;" class="form-inline">
    <br/>
    <div class="form-group" style="padding-bottom: 5px;">
      <input size="82px" type="text" required="required" class="form-control" name="review" placeholder=" ³»¿ë">
      <input type="submit" class="btn btn-default btn-success" value="submit"> 	
    </div>
    
    <br/>
 <button type="button" class="btn btn-default" onclick="location.href='/login'"><h3><b>1</b></h3><br/>comment
</div>

 </button>
