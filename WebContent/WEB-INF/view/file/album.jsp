<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
   <div class="thumbnail" style="height: 320px">
   	<div style="float: left;">
      <img src="/paris.jpg" alt="Paris" width="300" height="300" style="margin-left: 0px;"/>
      </div>
      <div style="font-size:50px; ;width: 500px;margin-left: 350px;">
      dddd
      </div>
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
    <div class="thumbnail">
      <img src="/paris.jpg" alt="Paris" width="400" height="300" />
   </div>
   <div class="panel panel-default" style="width: 700px;">
      <div class="panel-heading">1</div>
      <table class="table table-bordered">
         <tr style="color: black;">
            <td align="center" width="30px"><span
               class="glyphicon glyphicon-blackboard"></span></td>
            <td><b>2</b></td>
            <td align="right" width="200px">3</td>
            <td width="50px"><span class="glyphicon glyphicon-eye-open">&nbsp;4</span></td>
            <td width="50px"><span class="glyphicon glyphicon-thumbs-up">&nbsp;5</span></td>
         </tr>
      </table>
      <div class="panel-body">6</div>
   </div>