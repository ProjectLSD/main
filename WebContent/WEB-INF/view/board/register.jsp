<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<h2 style="color: white;">글작성</h2>
<form action="/board/insertin">
	<div class="panel panel-default" style="width: 700px;">
		<div class="panel-heading">
			<input size="4" type="text" required="required" class="form-control"
				name="subject" placeholder=" 제목">
		</div>
	</div>
	<div class="panel panel-default" style="width: 700px;">
		<div class="panel-heading">
			<textarea name="comments" rows="15" cols="92" placeholder=" 내용"></textarea>
			<br /> <input type="submit" class="btn btn-success" id="bt"
				value="등록">
		</div>
	</div>

</form>
