<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<table border="1" width="500" height="500" align="center">
<form action="file/upload" method="post" enctype="multipart/form-data">
<tr>
	<th>
	<b style="font:large;">장르</b>
	<br>
	<select name="genre">
	<br>
    <option value="">장르 선택</option>
    <option value="pop">Pop</option>
    <option value="rock">Rock</option>
    <option value="jazz">Jazz</option>
    <option value="hiphop">HipHop</option>
    <option value="country">Country</option>
    <option value="electronic">Electronic</option>
</select>
<br>
<b>앨범명</b>
<br>
<input type="text" name="album"/>
<br>
<b>앨범 이미지</b>
<br>
<input type="file" name="image"/>
<br>
<b>파일 선택</b>  
<br>
<input type="file" name="file"/>
<input type="submit" value="올리기">
</th>
</tr>

</form>
</table>