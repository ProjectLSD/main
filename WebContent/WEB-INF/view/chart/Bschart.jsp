<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="no-padding" id="musicchart">
   <h2 style="color: white;">Top Songs</h2>
   <ul class="nav nav-tabs">
   <li class="active"><a data-toggle="tab" href="#top">TOP</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Genre <span class="caret"></span></a>
         <ul class="dropdown-menu">
            <li><a data-toggle="tab" href="#bugs" >벅스</a></li>
            <li><a data-toggle="tab" href="#Mnet" >엠넷</a></li>
         </ul></li>
   </ul>
   <div class="tab-content">
      <div id="bugs" class="tab-pane fade in active">
         <h3>벅스 차트</h3>
         <div class="table-responsive">
            <table class="table">
               <thead>
                  <tr>
                     <th><input type="checkbox" name="chk_all" onclick="allChk()"></th>
                     <th>rank</th>
                     <th>album</th>
                     <th>title</th>
                     <th>artist</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach var="obj" items="${bugs }" varStatus="status">
                     <tr>
                        <td><input type="checkbox" name="chk"></td>
                        <td>${status.count }</td>
                        <td><img src="${obj.album}" width="50" height="50" /></td>
                        <td>${obj.title }</td>
                        <td>${obj.artist}</td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
         </div>
      </div>

   <div id="Mnet" class="tab-pane fade">
   <h3>M.NET 차트</h3>
      <div class="table-responsive">
         <table class="table">
            <thead>
               <tr>
                  <th><input type="checkbox" name="chk_all" onclick="allChk()"></th>
                  <th>rank</th>
                  <th>album</th>
                  <th>title</th>
                  <th>artist</th>
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
                  </tr>
               </c:forEach>
            </tbody>
         </table>
      </div>
   </div>
</div>
</section>