<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${board.subject==null}">
		<h2 style="color: white;">���ۼ�</h2>
		<form action="/board/insertin">
	</c:when>
	<c:otherwise>
		<h2 style="color: white;">�ۼ���</h2>
		<form action="/board/update" method="post">
			<input type="hidden" name="num" value="${board.num }" />
	</c:otherwise>
</c:choose>
<div class="panel panel-default" style="border:2px; width: 700px;">
	<div class="panel-heading" style="border:2px; background-color: #434354;">
		<input style="border: 2px;color:white; background-color: #a8a8b9 " size="4" type="text" required="required" id="subject"
			class="form-control" name="subject" placeholder=" ����">
	</div>
</div>
<div class="panel panel-default" style="border:2px; width: 700px; height: 370px;">
	<div class="panel-heading" style="border:2px; background-color: #282832; height: 370px;">
		<textarea style="color:white; background-color: #a8a8b9;" name="comments" id="comments" rows="15" cols="92"
			placeholder=" ����"></textarea>
		<br /> <input type="submit" class="btn btn-success pull-right"
			id="bt" value="���">
		<button type="submit" class="btn btn-danger pull-left"
			data-dismiss="modal" onclick="location.href='/'">
			<span class="glyphicon glyphicon-remove"></span>���
		</button>
	</div>
</div>

</form>
<script>
	subject.value = "${board.subject}"
	comments.value = "${board.comments}"
</script>