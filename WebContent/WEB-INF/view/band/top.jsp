<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!--  -->
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th><input type="checkbox" name="chk_all" onclick="allChk()"></th>
					<th>rank</th>
					<th>artist</th>
					<th>e-mail</th>
					<th>like</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="obj" items="${data }" varStatus="status">
					<tr>
						<td><input type="checkbox" name="chk"></td>
						<td>${status.count }</td>
						<td>${obj.ID}</td>
						<td>${obj.EMAIL}</td>
						<td>${obj.LIKES}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
