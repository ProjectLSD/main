<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!--  -->
<h2 style="color: silver; font-style: oblique;">Band Chart</h2>
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>rank</th>
					<th>artist</th>
					<th>name</th>
					<th>like</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="obj" items="${data1 }" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${obj.ID}</td>
						<td>${obj.NAME}</td>
						<td>${obj.LIKES}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
