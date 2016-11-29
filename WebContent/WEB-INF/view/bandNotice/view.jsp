<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script type="text/javascript" src="/js/map.js"></script>


<div class="container">
	<h2 style="color: white;">Band</h2>
	<br />
	<div class="panel panel-default" style="width: 700px;">
		<div class="panel-heading">${notice.TITLE}</div>
		<table class="table table-bordered">
			<tr style="color: black;">
				<td align="center" width="30px"><span
					class="glyphicon glyphicon-blackboard"></span></td>
				<td><b>${notice.ID}</b></td>
				<td align="right" width="200px"><span
					class="glyphicon glyphicon-time" style="text-align: right;"><fmt:formatDate
							value="${notice.WRITEDATE}" pattern="yyyy-MM-dd hh:mm:ss" /></span></td>
			</tr>
		</table>
		<div class="panel-body">${notice.TEXT}</div>
		<div>
			밴드 동영상
			<video controls="controls" width="300" height="250">
				<source src="/${notice.FILEUUID}">
			</video>
		</div>
		공연 장소
		<div id="map" style="width: 500px; height: 300px; border: 1 solid;"></div>
		${notice.LOCATION }

	</div>
	<c:set var="user" value="${sessionScope.userId}" />
	<div align="right" style="padding-right: 450px;">
		<c:if test="${notice.writer eq user}">
			<form action="/board/register" method="post">
				<input type="hidden" name="subject" value="${notice.TITLE}">
				<input type="hidden" name="comments" value="${notice.TEXT}">
				<input type="hidden" name="num" value="${notice.NUM}"> <input
					type="hidden" name="px" id="px" value="${notice.PX}"> <input
					type="hidden" name="py" id="py" value="${notice.PY}">
				<button type="submit" class="btn btn-default" id="bt1"
					style="padding: 10px;">
					<b>수정</b>
				</button>
				<button type="button" class="btn btn-default" id="bt2"
					style="padding: 10px;">
					<b>삭제</b>
				</button>
			</form>
		</c:if>
	</div>
</div>

<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWw_0vNidLB9rB78fcVBZmOhiB02hZsKM&callback=initMap"
	async defer></script>
<script>
	function initMap() {
		var dest = {
				"lat" : ${notice.PY},  
				"lng" : ${notice.PX} 
			};
		var src= {
				"lat" : ${notice.PY},  
				"lng" : ${notice.PX} 
			}
		
		var map = new google.maps.Map(document.getElementById('map'), {
			"center" : dest,
			"scrollwheel" : true,
			"zoom" : 17
		});
		
		var marker = new google.maps.Marker({
			"position" : dest,
			"map" : map,
			"title" : "공연 장소"
		});
		var directionsDisplay = new google.maps.DirectionsRenderer({
	          "map" : map
	    });
		var request = {
		    "destination" : dest,
            "origin": src,
		    "travelMode": "TRANSIT"
		};
	}
</script>