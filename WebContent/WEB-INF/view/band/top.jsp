<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<c:forEach items="${data}" var="b">
            <tr>
               <td style="width: 80px;">${b.ID}</td>
               <td style="width: 50px;">${b.LIKES}</td><br>
               
            </tr>
         </c:forEach>