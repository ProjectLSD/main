<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div align="center">
	<marquee>
		<h1 style="color: white;">으헤헤헤</h1>
	</marquee>
</div>
<h1 style="color: white;">WLECOME</h1>
<p>헤헤</p>
<hr>
<h3 style="color: white;">Test</h3>
<p>헤헤</p>
<hr />

<div class="row text-center">
	<c:forEach var="ob" items="${map }">
		<div class="col-sm-3">
			<div class="thumbnail">

				<a href="/file/Album1?owner=${ob.OWNER }"><img src="paris.jpg"
					alt="Paris" width="400" height="300" />
					<p>
						<strong style="color: black;">${ob.OWNER }</strong>
					</p>
					<p style="color: black;">${ob.ALBUM }</p>
					<hr /> <a />
 


					<div></div>
			</div>
		</div>
	</c:forEach>
</div>
<hr />
