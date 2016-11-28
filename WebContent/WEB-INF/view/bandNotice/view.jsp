<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	map.put("name","�̻���");
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
   </div>
   <c:set var="user" value="${sessionScope.userId}"/>
   <div align="right" style="padding-right: 450px;">
      <c:if test="${notice.writer eq user}">
      <form action="/board/register" method="post">
      <input type="hidden" name="subject" value="${notice.TITLE}">
      <input type="hidden" name="comments" value="${notice.TEXT}">
      <input type="hidden" name="num" value="${notice.NUM}">
      <button type="submit" class="btn btn-default" id="bt1" style="padding:10px;"> 
      <b>����</b>
      </button>
      <button type="button" class="btn btn-default" id="bt2" style="padding:10px;">
      <b>����</b>
      </button>
      </form>
      </c:if>
   </div>
   <!-- ���� �Է� -->
</div>