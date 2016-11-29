<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h3 style="color: white;">New Disc</h3>
<hr color="blue" />

<div class="row text-center">
	<c:forEach var="ob" items="${map }">
		<c:choose>
			<c:when test="${ob.IMGSIZE==0 }">
			</c:when>
			<c:otherwise>
				<div id="imgDiv" class="col-sm-2"
					style="position: relative; padding-bottom: 23%; margin: 1%;">
					<div class="thumbnail"
						style="background-color: #23232c; position: absolute; width: 100%; height: 100%; border: 0px; padding: 0px;">
						<a href="/file/Album1?owner=${ob.OWNER }&album=${ob.ALBUM }">
							<img
							style="position: relative; width: auto; height: 80%; left: 0; top: 0"
							src="${ob.IMGUUID}" alt="${ob.IMGNAME}" />
						</a>
						<p>
							<strong style="color: white;">${ob.OWNER }</strong>
						</p>
						<p style="color: white;">${ob.ALBUM }</p>

					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
<hr />
