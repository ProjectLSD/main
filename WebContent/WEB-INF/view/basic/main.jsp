<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet" />

<style>
#portfolio .portfolio-item .portfolio-caption p, section h3.section-subheading
	{
	font-family: "Droid Serif", "Helvetica Neue", Helvetica, Arial,
		sans-serif;
	font-style: italic
}
#portfolio .portfolio-item .portfolio-link {
	display: block;
	position: relative;
	max-width: 400px;
	margin: 0 auto
}
#portfolio .portfolio-item .portfolio-link .portfolio-hover {
	background: rgba(0, 0, 0, 0.6);
	position: absolute;
	width: 100%;
	height: 100%;
	opacity: 0;
	transition: all ease .5s;
	-webkit-transition: all ease .5s;
	-moz-transition: all ease .5s
}

#portfolio .portfolio-item .portfolio-link .portfolio-hover:hover {
	opacity: 1
}

#portfolio .portfolio-item .portfolio-link .portfolio-hover .portfolio-hover-content
	{
	position: absolute;
	width: 100%;
	height: 20px;
	font-size: 20px;
	text-align: center;
	top: 50%;
	margin-top: -12px;
	color: #fff
}



</style>
<h3 style="color: white;">New Disc</h3>
<hr color="blue" />
<section id="portfolio">
	<c:forEach var="ob" items="${map }">
		<c:choose>
			<c:when test="${ob.IMGSIZE==0 }">
			</c:when>
			<c:otherwise>
				<div id="imgDiv" class="col-sm-2" align="center"
					style="position: relative; padding-bottom: 20%; margin: 1%;">
					<div class="row">
						<div class="col-md-4 col-sm-6 portfolio-item"
							style="background-color: #23232c; position: absolute; width: 100%; height: 100%; border: 0px; padding: 0px;">
							<a href="/file/Album1?owner=${ob.OWNER }&album=${ob.ALBUM }"
								class="portfolio-link" data-toggle="modal">
								<div class="portfolio-hover">
									<div class="portfolio-hover-content">
										<i class="fa fa-play-circle-o fa-3x"></i>
									</div>
								</div> <img src="${ob.IMGUUID}" alt="${ob.IMGNAME}"
								class="img-responsive"
								style="max-width: auto; height: 200px; left: 0; top: 0">
							</a>
							<p>
								<strong style=" color: white;">${ob.OWNER }</strong>
							</p>
							<p style="color: white;">${ob.ALBUM }</p>
						</div>

					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</section>




