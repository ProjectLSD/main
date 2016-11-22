<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h3 style="color: white;">Test</h3>
<p>헤헤</p>
<hr />
<div class="row text-center">
	<c:forEach var="ob" items="${map }">
		<div class="col-sm-3">
			<div class="thumbnail" style="padding-right: 0px;padding-top: 0px;padding-left: 0px;padding-bottom: 0px;background-color: #23232c;">	
				<form action="/file/one">
				<input type="hidden" name="album" value="${ob.ALBUM }"/>
				<input type="hidden" name="filename" value="${ob.FILENAME }"/>
				<input type="hidden" name="filename" value="${ob.FILEUUID }"/>
				<a href="/file/Album1?owner=${ob.OWNER }&album=${ob.ALBUM }">
				<img src="/paris.jpg" alt="Paris" width="400" height="300" /></a>
					<p>
						<strong style="color:white;">${ob.OWNER }</strong>
					</p>
					<p style="color:white;">${ob.ALBUM }</p>
					<hr style="margin-bottom: 10px;margin-top: 10px;"/> 
					
	<input type="submit" class="btn btn-success" id="on" value="Play"/>
	</form>
					<div>
					</div>
			</div>
		</div>
	</c:forEach>
</div>
<hr />
