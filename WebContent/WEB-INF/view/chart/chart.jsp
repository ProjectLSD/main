<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="no-padding" id="musicchart">
         <h2 style="color: white;">Top Songs</h2>         
   <ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#top">TOP10</a></li>
  <li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Genre
    <span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li><a data-toggle="tab" href="#pop">pop</a></li>
      <li><a data-toggle="tab" href="#rock">rock</a></li>
      <li><a data-toggle="tab" href="#jazz">jazz</a></li>
      <li><a data-toggle="tab" href="#hiphop">hiphop</a></li>
      <li><a data-toggle="tab" href="#country">country</a></li>
      <li><a data-toggle="tab" href="#electronic">electronic</a></li> 
    </ul>
  </li>
</ul>

<div class="tab-content">
  <div id="top" class="tab-pane fade in active">
   <div class="table-responsive">
            <table class="table">
               <thead>
                  <tr>
                     <th>rank</th>
                     <th>album</th>
                     <th>title</th>
                     <th>artist</th>
                     <th>like</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach var="obj" items="${top }" varStatus="status">
                     <tr>
                        <td>${status.count }</td>
                        <td><img src="/${obj.IMGUUID}" width="50" height="50" /></td>
                        <td>${obj.FILENAME }</td>
                        <td>${obj.OWNER}</td>
                        <td>${obj.LIKES}</td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
         </div>
  </div>  
  <div id="pop" class="tab-pane fade">
    <div class="table-responsive">
            <table class="table">
               <thead>
                  <tr>
                     <th>rank</th>
                     <th>album</th>
                     <th>title</th>
                     <th>artist</th>
                     <th>like</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach var="obj" items="${pop }" varStatus="status">
                     <tr>
                        <td>${status.count }</td>
                        <td><img src="/${obj.IMGUUID}" width="50" height="50" /></td>
                        <td>${obj.FILENAME }</td>
                        <td>${obj.OWNER}</td>
                        <td>${obj.LIKES}</td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
         </div>
  </div>
  <div id="rock" class="tab-pane fade">
    <div class="table-responsive">
            <table class="table">
               <thead>
                  <tr>
                     <th>rank</th>
                     <th>album</th>
                     <th>title</th>
                     <th>artist</th>
                     <th>like</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach var="obj" items="${rock }" varStatus="status">
                     <tr>
                        <td>${status.count }</td>
                        <td><img src="/${obj.IMGUUID}" width="50" height="50" /></td>
                        <td>${obj.FILENAME }</td>
                        <td>${obj.OWNER}</td>
                        <td>${obj.LIKES}</td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
         </div>
  </div>
  <div id="jazz" class="tab-pane fade">
    <div class="table-responsive">
            <table class="table">
               <thead>
                  <tr>
                     <th>rank</th>
                     <th>album</th>
                     <th>title</th>
                     <th>artist</th>
                     <th>like</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach var="obj" items="${jazz }" varStatus="status">
                     <tr>
                        <td>${status.count }</td>
                        <td><img src="/${obj.IMGUUID}" width="50" height="50" /></td>
                        <td>${obj.FILENAME }</td>
                        <td>${obj.OWNER}</td>
                        <td>${obj.LIKES}</td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
         </div>
  </div>
  <div id="hiphop" class="tab-pane fade">
    <div class="table-responsive">
            <table class="table">
               <thead>
                  <tr>
                     <th>rank</th>
                     <th>album</th>
                     <th>title</th>
                     <th>artist</th>
                     <th>like</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach var="obj" items="${hiphop }" varStatus="status">
                     <tr>
                        <td>${status.count }</td>
                        <td><img src="/${obj.IMGUUID}" width="50" height="50" /></td>
                        <td>${obj.FILENAME }</td>
                        <td>${obj.OWNER}</td>
                        <td>${obj.LIKES}</td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
         </div>
  </div>
   <div id="country" class="tab-pane fade">
    <div class="table-responsive">
            <table class="table">
               <thead>
                  <tr>
                     <th>rank</th>
                     <th>album</th>
                     <th>title</th>
                     <th>artist</th>
                     <th>like</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach var="obj" items="${country }" varStatus="status">
                     <tr>
                        <td>${status.count }</td>
                        <td><img src="/${obj.IMGUUID}" width="50" height="50" /></td>
                        <td>${obj.FILENAME }</td>
                        <td>${obj.OWNER}</td>
                        <td>${obj.LIKES}</td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
         </div>
  </div>
   <div id="electronic" class="tab-pane fade">
    <div class="table-responsive">
            <table class="table">
               <thead>
                  <tr>
                     <th>rank</th>
                     <th>album</th>
                     <th>title</th>
                     <th>artist</th>
                     <th>like</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach var="obj" items="${electronic }" varStatus="status">
                     <tr>
                        <td>${status.count }</td>
                        <td><img src="/${obj.IMGUUID}" width="50" height="50" /></td>
                        <td>${obj.FILENAME }</td>
                        <td>${obj.OWNER}</td>
                        <td>${obj.LIKES}</td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
         </div>
  </div>
</div>
</section>