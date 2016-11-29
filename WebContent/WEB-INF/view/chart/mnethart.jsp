<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<section class="no-padding" id="musicchart">
   <div class="container-fluid">

      <div class="container">
         <h2>Soul Music Chart</h2>
         <div class="table-responsive">
            <table class="table">
               <thead>
                  <tr>
                     <th><input type="checkbox" name="chk_all" onclick="allChk()"></th>
                     <th>rank</th>
                     <th>album</th>
                     <th>title</th>
                     <th>artist</th>
                     <th>like</th>
                     <th>MV</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach var="bugs" items="${mnet }" varStatus="status">
                     <tr>
                        <td><input type="checkbox" name="chk"></td>
                        <td>${status.count }</td>
                        <td><img src="${bugs.img }" /></td>
                        <td>${bugs.title }</td>
                        <td>${bugs.artist }</td>
                        <td><img src="/img/like.jpg" width="30" height="30" /></td>
                        <td><img src="/img/mv.png" width="30" height="30" /></td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
         </div>
      </div>

   </div>
</section>