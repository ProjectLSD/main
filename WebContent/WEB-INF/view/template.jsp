<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>음악에 미치다</title>
<link rel="main.jpg" href="/main.jpg"/>
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
a:link,a:hover,a:visited  {
    color: white;
}

label,a,p,tr{
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
    background-color:#000000;
   height: auto;
   
}

/* Set gray background color and 100% height  rgba(42, 42, 53, 1);*/
.sidenav {
   padding-top: 20px;
   background-color:#000000;
   height: 100%;
   color:white;
   
}

/* Set black background color, white text and some padding */
footer {
   background-color:#000000;
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
</head>
<body>
   <div class="container-fluid text-center">
      <div class="row content">
         <div class="col-sm-2 sidenav">
      
          <p><tiles:insertAttribute name="menu"/></p>
         </div>
         <div class="col-sm-8 text-left">
            
         <p><tiles:insertAttribute name="body"/></p>
         </div>
          </div>
         </div>
    <div class="col-sm-2 sidenav">
         </div>

   <footer class="container-fluid text-center">
   <p><tiles:insertAttribute name="footer"/></p>
   </footer>

</body>
</html>