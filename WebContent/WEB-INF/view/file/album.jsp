<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div style="background-color: #1e1e26">
<script>
	    var vars = [], hash;
	    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
	    for(var i = 0; i < hashes.length; i++)
	    {
	        hash = hashes[i].split('=');
	        vars.push(hash[0]);
	        vars[hash[0]] = hash[1];
	    }
	    return vars;
</script>
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
   <div align="center">
      <div class="row text-center">
         <c:forEach var="ob" items="${album }">
         <br/>
            
            <strong style="color: black;">${ob.ALBUM }</strong>
            <audio style="width: 290px; height: 30px;" controls="controls">
               <source src="/${ob.FILEUUID}">
            </audio>
            <br/>
         </c:forEach>
      </div>
   </div>
   <div class="panel panel-default" style="width: 1028px;">
      <table class="table " style="font-size: 18px;border: 0px;">
         <tr style="color: #a3c2ca; background-color: #282832">
            <td align="center" width="30px"><span
               class="glyphicon glyphicon-sort-by-attributes"></span></td>
            <td align="right" width="100px">3</td>
            <td><b>SONG</b></td>
            <td width="50px"><span class="glyphicon glyphicon-thumbs-up">&nbsp;4</span></td>
            <td width="50px"><span class="glyphicon glyphicon-download-alt">&nbsp;5</span></td>
         </tr>
          <tr style="color: #a3c2ca; background-color: #1e1e26">  
         <c:forEach var="ob" items="${album }">
            <td>1 </td>
            <td align="right" width="100px"><span class="glyphicon glyphicon-plus"></span></td>
            <td>${ob.FILENAME}</td>
            <td>${ob.LIKES}</td>
            <td>${ob.COUNT}</td>
         </c:forEach>
         </tr>
      </table>
      
   </div>