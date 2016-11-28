<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<h3>글올리기</h3>

<div class="container">
   <form id="form1" name="form1" action="/bandNotice/reg" method="post" enctype="multipart/form-data">

     <input type="file" name="file" id="file"/>
     <br> 
      <div class="form-group">
         <label for="ti">Title:</label> <input type="text"
            class="form-control" name="title" id="ti">
      </div>
      <label>Comment:</label>
      <textarea class="form-control" rows="5" name="text" id="ta"></textarea>
      <br /> <label>위치 등록 :</label> 
      <input id="location" name="location" type="text" class="form-control" style="width: 60%" readonly="readonly" /> 
      <input id="px" name="px" type="hidden" class="form-control" style="width: 30%" /> 
      <input id="py" name="py" type="hidden" class="form-control" style="width: 30%" />

   </form>

<!-- 구글지도 START -->
   <input id="pac-input" class="controls" type="text"
      placeholder="Search Box">
   <div id="mapview" style="width: 60%; height: 50%; border: 1px solid;">
   </div>
<!-- 구글지도 END -->   
   <input id="btn" name="submit" type="button" value="자료등록" /> <a href="">이전페이지로가기</a>
</div>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<!-- 지도 JS css -->
<link rel="stylesheet" href="/css/map.css" />
<script
   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAT0Mp7oBqIMB38egvlesA8j9uf6nYdEeE&libraries=places&callback=initAutocomplete"
   async defer></script>
<script type="text/javascript" src="/js/map.js"></script>
<script>
   $("#btn").click(function() {
      //$("#form1").attr("action");
      $("#form1").submit();
   });

   //===========================================
   // ckeditor
   var opt = {
      "height" : 300,
      "width" : 570
   };
   CKEDITOR.replace("ta");
   //====================================

   var x = document.getElementById("demo");
   function getLocation() {
      if (navigator.geolocation) {
         navigator.geolocation.getCurrentPosition(showPosition);
      } else {
         x.innerHTML = "Geolocation is not supported by this browser.";
      }
   }
   function showPosition(position) {
      alert(position);
      x.innerHTML = "Latitude: " + position.coords.latitude
            + "<br />Longitude: " + position.coords.longitude;
   }

   //====================================
   var src = {
      lat : 37.497942,
      lng : 127.02760
   };
   function initAutocomplete() {
      map(src, false);
   }
</script>