<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

   <h2 style="color: silver;">����Ʈ �����ϱ�</h2>
   
   <form action="/cash/chargePoint" method="post">
   <select required name="point">
   		<option value="">�ݾ���  �����ϼ���</option>
   		<option value="100">100</option>
   		<option value="200">200</option>
   		<option value="300">300</option>
   		<option value="400">400</option>
   </select>
   <br>
   <br>
 	<input type="submit" value="�����ϱ�">
   </form>