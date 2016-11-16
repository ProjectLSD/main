<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <h2>글작성</h2>
    <form action="/board/insertin">
  제목 <input type="text" size="50" name="subject"/>
  <br/>
내용<textarea  name="comments" placeholder="500자 이내로 입력하세요.">
</textarea>
<input type="submit"  value="등록">
<input type="button" value="취소">
</form>