<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>



<link rel="stylesheet" href="css/map.css" />
<script
   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAT0Mp7oBqIMB38egvlesA8j9uf6nYdEeE&libraries=places&callback=initAutocomplete"
   async defer></script>
<script type="text/javascript" src="/js/map.js"></script>

<script>
var i = 0;
function Map() {
	 this.elements = {};
	 this.length = 0;
	}

	Map.prototype.put = function(key,value) {
	 this.length++;
	 this.elements[key] = value;
	}


	Map.prototype.get = function(key) {
	 return this.elements[key];
	}

	var map = new Map();
	map.put("name","이상훈");
	
	
	  var px = ${notice.PX};
	   var py = ${notice.PY};
	    
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
      
      <div>
      공연장 장소
      
      
      </div>
   </div>
   <c:set var="user" value="${sessionScope.userId}"/>
   <div align="right" style="padding-right: 450px;">
      <c:if test="${notice.writer eq user}">
      <form action="/board/register" method="post">
      <input type="hidden" name="subject" value="${notice.TITLE}">
      <input type="hidden" name="comments" value="${notice.TEXT}">
      <input type="hidden" name="num" value="${notice.NUM}">
      <button type="submit" class="btn btn-default" id="bt1" style="padding:10px;"> 
      <b>수정</b>
      </button>
      <button type="button" class="btn btn-default" id="bt2" style="padding:10px;">
      <b>삭제</b>
      </button>
      </form>
      </c:if>
   </div>
   <!-- 리뷰 입력 -->
</div>