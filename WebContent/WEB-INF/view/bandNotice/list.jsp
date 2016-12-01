<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.panel {
   border: 1px solid #23232c;;
   border-radius: 0 !important;
   transition: box-shadow 0.5s;
}

.panel:hover {
   box-shadow: 5px 0px 40px rgba(0, 0, 0, .2);
}

.panel-heading {
   color: #fff !important;
   background-color: #5b5f6d !important;
   padding: 10px;
   border-bottom: 1px solid transparent;
   border-top-left-radius: 0px;
   border-top-right-radius: 0px;
   border-bottom-left-radius: 0px;
   border-bottom-right-radius: 0px;
}

.panel-footer {
   background-color: white !important;
}
</style>

<h2 style="color: white;">Band AD</h2>
<hr />
<c:forEach items="${data3}" var="b" varStatus="status">
   <div class="col-sm-2" style="margin: 1%; width: 18%; height: 100%;">
      <div class="panel panel-default text-center">
         <div class="panel-heading">
            <h5>
               <b id="data${status.count}" style="font-size: 12px;" title="${b.TITLE}"><strong>${b.TITLE}</strong></b>
               <script>
               var alsize = "${b.TITLE}".length;
               if (alsize > 12) {
                  var subalbum = $("#data" + "${status.count}").text().substring(0, 12);
                  $("#data" + "${status.count}").text(subalbum + "...");
               }
            </script>
            </h5>
         </div>
         <div class="panel-body">
            <p style="color: black;"> 
               <b id="data1${status.count}" style="color:black; font-size: 12px;" title="${b.ID}" class="glyphicon glyphicon-user"><strong >${b.ID}</strong></b>
               <script>
               var filsize= "${b.ID}".length;
               if (filsize > 10) {
                  var subfile = $("#data1" + "${status.count}").text().substring(0, 10);
                  $("#data1" + "${status.count}").text(subfile + "...");
               }
               </script>
            </p>
            <p style="color: black;">
               <strong><span class="glyphicon glyphicon-time"
                  style="text-align: right;"></span> <fmt:formatDate
                     value="${b.WRITEDATE}" pattern="yyyy-MM-dd" /></strong>
            </p>
         </div>
         <div class="panel-footer">
            <a href="/bandNotice/view?num=${b.NUM}"><button
                  class="btn btn btn-default ">Watching</button></a>
         </div>

      </div>
   </div>
</c:forEach>