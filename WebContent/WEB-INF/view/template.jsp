<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<head>
<title>LSD Music</title>
<link rel="main.jpg" href="/main.jpg" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
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
	height: auto;
}

/* Set gray background color and 100% height  rgba(42, 42, 53, 1);*/
.sidenav {
	padding-top: 20px;
	background-color: #23232c;
	height: 1200px;
	color: white;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #23232c;
	color: white;
	padding: 10px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!-- stylesheet for demo and examples -->
	<link rel="stylesheet" href="style.css">
	<!-- custom scrollbar stylesheet -->
	<link rel="stylesheet" href="/malihu-custom-scrollbar-plugin-master/jquery.mCustomScrollbar.css">	
</head>
<body>
	<div class="container-fluid text-center">
		<div class="row content">
		
			<div class="col-sm-2 sidenav" id="content-1" class="content mCustomScrollbar" style="height: 540px;"  >
				<p>
					<tiles:insertAttribute name="menu" />
				</p>
			</div>
			<div class="col-sm-8 text-left" id="content-2" class="content" style="height: 540px;" >
	
				<p>
					<tiles:insertAttribute name="body" />
				</p>
			</div>
			<div class="col-sm-2 sidenav" id="content-3" class="content" style="height: 540px;">
				<p>
					<tiles:insertAttribute name="header" />
				</p>
			</div>
		</div>
	</div>
	<footer class="container-fluid text-center">
		<p>
			<tiles:insertAttribute name="footer" />
		</p>
	</footer>
	<!-- Google CDN jQuery with fallback to local -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="../js/minified/jquery-1.11.0.min.js"><\/script>')</script>
	<!-- custom scrollbar plugin -->
	<script src="/malihu-custom-scrollbar-plugin-master/jquery.mCustomScrollbar.concat.min.js"></script>
	<script>
		(function($){
			$(window).on("load",function(){
				
				$("#content-1").mCustomScrollbar({
					autoHideScrollbar:true,
					theme:"rounded"
				});
				$("#content-2").mCustomScrollbar({
					autoHideScrollbar:true,
					theme:"rounded"
				});
				$("#content-3").mCustomScrollbar({
					autoHideScrollbar:true,
					theme:"rounded"
				});
				
			});
		})(jQuery);
	</script>
</body>
</html>
