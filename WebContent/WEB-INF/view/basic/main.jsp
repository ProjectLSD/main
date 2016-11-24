<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h3 style="color: white;">New Disc</h3>
<hr />
<div class="row text-center">
	<c:forEach var="ob" items="${map }">
		<div class="col-sm-3" style="position:relative; height:3em; padding-bottom:30%">
			<div class="thumbnail" style="background-color: #23232c; position:absolute; width:95%; height:100%; left:0; top:0">	
				<a href="/file/Album1?owner=${ob.OWNER }&album=${ob.ALBUM }">
				<img style="position:relative; width:auto; height:85%; left:0; top:0" src="${ob.IMGUUID}" alt="${ob.IMGNAME}"/></a>
					<p>
						<strong style="color:white;">${ob.OWNER }</strong>
					</p>
					<p style="color:white;">${ob.ALBUM }</p>
			</div>
		</div>
	</c:forEach>
</div>
<hr />
