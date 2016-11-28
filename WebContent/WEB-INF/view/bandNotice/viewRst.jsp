<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>



<link rel="stylesheet" href="css/map.css" />
<script
   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAT0Mp7oBqIMB38egvlesA8j9uf6nYdEeE&libraries=places&callback=initAutocomplete"
   async defer></script>
<script type="text/javascript" src="/js/map.js"></script>
<script>
   var px = parseFloat(${view[0].LOCATIONPX});
   var py = parseFloat(${view[0].LOCATIONPY});
   
   var src= {
      lat : parseFloat(py),
      lng : parseFloat(px)
   };
   
   function initAutocomplete() {
      if(isNaN(src.lat)){
         $("#pac-input").hide();
         $("#mapview").hide();
         return;
      }
      map(src, true);
   }
   $(".add").click(function(){
      $(this).next().toggle();
  })
   
    </script>