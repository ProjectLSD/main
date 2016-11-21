<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

   <h2 style="color: silver;">포인트 충전하기</h2>
   
   <form action="/cash/chargePoint" method="post">
   <select required name="point">
   		<option value="">금액을  선택하세요</option>
   		<option value="100">100</option>
   		<option value="200">200</option>
   		<option value="300">300</option>
   		<option value="400">400</option>
   </select>
   <br>
   <br>
 	<input type="submit" value="충전하기">
   </form>