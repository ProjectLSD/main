<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div style="background-color: #1e1e26">
   <div class="thumbnail" style="height: 320px; background-color: #1e1e26">
      <div style="float: left;">
      <img src="/paris.jpg" alt="Paris" width="300" height="300" style="margin-left: 0px;"/>
      </div>
      <div style="font-size:50px; color: #a3c2ca; width: 500px;margin-left: 350px;">
       album :
      </div>
      <div style="font-size:30px; color: #a3c2ca; width: 500px;margin-left: 350px;">
       owner :
      </div>
   </div>
      <div class="panel panel-default" style="width: 1028px;">
      <table class="table" style="font-size: 18px;border: 0px;">
         <tr  style="color: #a3c2ca; background-color: #282832">
            <td align="center" width="40px"><span
               class="glyphicon glyphicon-sort-by-attributes"></span></td>
            <td align="center" width="100px"></td>
            <td><b>SONG</b></td>
            <td width="50px"><span class="glyphicon glyphicon-thumbs-up">&nbsp;</span></td>
            <td width="50px"><span class="glyphicon glyphicon-download-alt">&nbsp;</span></td>
         </tr>
         <c:forEach var="ob" begin="0" end="${album.size() }" varStatus="status" items="${album }">
          <tr id="${status.count}" class="trevent" style="color: #a3c2ca; background-color: #1e1e26">  
            <td id="data${status.count}" align="center">${status.count}</td>
            <td align="center" width="100px"><span class="glyphicon glyphicon-plus"></span></td>
            <td>${ob.FILENAME}</td>
            <td>${ob.LIKES}</td>
            <td>${ob.COUNT}</td>
         </tr>
         </c:forEach>
      </table>
   </div>
   </div>
   <script>
   $(".trevent").mouseover(function(){
      var id = $(this).attr("id");
      var data = "#data"+id;
      var html = $(this).html();
      $(data).text(data);
           console.log(html);
         console.log(id);
         console.log(data);
   });
   </script>