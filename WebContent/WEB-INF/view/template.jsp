<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<head>
<title>LSD Music</title>
<link rel='icon' href='/img/bacon.ico' type=‘image/x-ico’ />
<link rel="main.jpg" href="/main.jpg" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/css/loading.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#container {
	min-height: 100%;
	position: relative;
}

a:link, a:hover, a:visited {
	color: white;
}

label, a, p, tr {
	color: white;
}

.btn-default {
	box-shadow: 1px 2px 5px #000000;
}

.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	background-color: #1e1e26;
}

/* Set gray background color and 100% height  rgba(42, 42, 53, 1);*/
.sidenav {
	padding-top: 20px;
	background-color: #23232c;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #23232c;
	color: white;
	padding: 10px;
}
</style>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- stylesheet for demo and examples -->

<!-- custom scrollbar stylesheet -->
<link rel="stylesheet"
	href="/malihu-custom-scrollbar-plugin-master/jquery.mCustomScrollbar.css">
</head>
<body>
	<div id="container" style="min-height: 100%; position: relative;">
		<div class="row content">

			<div class="col-sm-2 sidenav" id="content-1" class="content"
				style="height: 750px; max-height: 100%; padding: 5px; border: 3;">
				<p>
					<tiles:insertAttribute name="menu" />
				</p>
			</div>
			<div
				class="${sessionScope.PlayList eq null ? 'col-sm-10' : 'col-sm-8 text-left' }"
				id="content-2" class="content"
				style="height: 750px; max-height: 100%; padding: 5px; border: 3;">
				<!-- 로딩중 태그 -->
				<div id="load" class="loading-container" style="height: 100%;">
					<div class="loading"></div>
					<div id="loading-text">loading</div>
				</div>
				<div id="loadon" style="display: none;">
					<tiles:insertAttribute name="body" />
				</div>
				<script>
					function loadEffect() {
						$("#load").hide();
						$("#loadon").fadeIn(200);
					}	
					setTimeout(loadEffect, 1000);
				</script>
			</div>
			<div
				class="${sessionScope.PlayList eq null ? '' : 'col-sm-2 sidenav' }"
				id="content-3" class="content"
				style="height: 750px; max-height: 100%; padding: 5px; border: 3;">
				<p>
					<tiles:insertAttribute name="header" />
				</p>
			</div>
		</div>
		<div class="content"
			style="height: 30px; max-height: 100%; position: fixed;; bottom: 0; width: 100%;"
			align="center">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
	<!-- Google CDN jQuery with fallback to local -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write(
								'<script src="../js/minified/jquery-1.11.0.min.js"><\/script>')
	</script>
	<!-- custom scrollbar plugin -->
	<script
		src="/malihu-custom-scrollbar-plugin-master/jquery.mCustomScrollbar.concat.min.js"></script>
	<script>
		(function($) {
							$(window).on("load", function() {

								$("#content-1").mCustomScrollbar({
									autoHideScrollbar : true,
									scrollInertia : 60
								});
								$("#content-2").mCustomScrollbar({
									autoHideScrollbar : true,
									scrollInertia : 60
								});
								$("#content-3").mCustomScrollbar({
									autoHideScrollbar : true,
									scrollInertia : 60
								});

							});
						})(jQuery);
	</script>
</body>
</html>
