<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<form action="/file/upload" method="post" enctype="multipart/form-data">
	<div align="center">
		<table border="1" style="width: 500, height:500;">
			<tr>
				<th><b style="font: large;">�帣</b> <br> <select style="color: black;"
					name="genre">
						<option value="">�帣 ����</option>
						<option value="pop">Pop</option>
						<option value="rock">Rock</option>
						<option value="jazz">Jazz</option>
						<option value="hiphop">HipHop</option>
						<option value="country">Country</option>
						<option value="electronic">Electronic</option>
				</select> <br> <b>�ٹ���</b> <br> <input  style="color: black;" type="text" name="album" />
					<br> <b>���� ����</b> <br> <input type="file" name="file" accept="audio/*"/><br>
					<br> <b>�̹��� ����</b> <br> <input type="file" name="image" accept="image/*"/><br>
					<input  style="color: black;"  type="submit" value="�ø���"></th>
			</tr>

		</table>
</form>
</div>