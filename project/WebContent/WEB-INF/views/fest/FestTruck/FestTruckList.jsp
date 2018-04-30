<%@page import="com.foodtruck.fest.dto.FestTruckDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.foodtruck.fest.TruckService.FestTruckListService"%>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
pageContext.setAttribute("absURI", request.getContextPath());

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>게시판 리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
// 	alert("OK");
    $(".data").click(function(){
//         $(this).hide();
        var truckno = $(this).find("td:first").text();
// 		alert("click");
// 		alert(truckno);
		location = "FestTruckView.do?truckno="+truckno+'&page=${pageObject.page}&rowPerPage=${(empty param.rowPerPage)?"10":param.rowPerPage}&searchKey=${param.searchKey}&searchWord=${param.searchWord}';
    });
    $("#reload").click(function(){
    	location = "FestTruckList.do";
    });
});
</script>
<link rel="stylesheet" href="../css/board.css" />
</head>
<body>
<h1>게시판 리스트</h1>
<div class="container">
  <h2>Basic Table</h2>
  <p>The .table class adds basic styling (light padding and only horizontal dividers) to a table:</p>
 <form class="navbar-form">
 <input name="page" value="1" type="hidden" />
	<input name="rowPerPage" value='${(empty param.rowPerPage)?"10":param.rowPerPage}' type="hidden" />
 <div class="form-group navbar-left">
 <select class="form-control navbar-left list-group"  name="searchKey"  class="input-group-addon">
<option value="country" ${(param.searchKey == "country")?"selected=\"selected\"":"" } 
  		>국적</option>
<option value="maindish" ${(param.searchKey == "maindish")?"selected=\"selected\"":"" } 
  		>주요 메뉴</option>
<option value="mngrname" ${(param.searchKey == "mngrname")?"selected=\"selected\"":"" } 
  		>매니저 이름</option>
<option value="mngrtel" ${(param.searchKey == "mngrtel")?"selected=\"selected\"":"" } 
  		>매니저 연락처</option>
<option value="applydate" ${(param.searchKey == "applydate")?"selected=\"selected\"":"" } 
  		>접수 날짜</option>
<option value="applyname,applytel" ${(param.searchKey == "country,maindish")?"selected=\"selected\"":"" } 
  		>국적+주요메뉴</option>
<option value="applyname,applydate" ${(param.searchKey == "mngrname,mngrtel")?"selected=\"selected\"":"" } 
  		>매니저 이름+매니저 연락처</option>
<option value="applytel,applydate" ${(param.searchKey == "mngrtel,applydate")?"selected=\"selected\"":"" } 
  		>매니저 연락처+접수 날짜</option>
 </select> 
 <input type="text" class="form-control navbar-left " placeholder="Search" name="searchWord">
 </div>
 <button type="submit" class="btn btn-default">
 <i class="glyphicon glyphicon-search"></i>
 </button>
</form>
<table class="table">
<thead>
	<tr>
		<th>푸드트럭번호</th>
		<th>국적</th>
		<th>주요 메뉴</th>
		<th>매니저 이름</th>
		<th>매니저 연락처</th>
		<th>접수 날짜</th>
		<th>조회수</th>
	</tr>
</thead>
<tbody>
<!-- 데이터를 출력하는 반복 처리 -->
<c:forEach items="${list }" var="FestTruckDTO">
	<tr class="data">
		<td>${FestTruckDTO.truckno }</td>
		<td>${FestTruckDTO.country }</td>
		<td>${FestTruckDTO.maindish }</td>
		<td>${FestTruckDTO.mngrname }</td>
		<td>${FestTruckDTO.mngrtel }</td>
		<td>${FestTruckDTO.applydate }</td>
		<td>${FestTruckDTO.hit }</td>
	</tr>
</c:forEach>
</tbody>
<tfoot>
	<tr>
		<td colspan="3">
			<ul class="pagination">
			<c:if test="${pageObject.startPage > 1 }">
			  <li>
			  	<a href='FestTruckList.do?page=${pageObject.startPage -1 }&rowPerPage=${(empty param.rowPerPage)?"10":param.rowPerPage}&searchKey=${param.searchKey}&searchWord=${param.searchWord}'>
			  	<i class="glyphicon glyphicon-backward"></i></a></li>
			</c:if>
			<c:forEach begin="${pageObject.startPage }" end="${pageObject.endPage }"
			var="idx">
			  <li ${(pageObject.page == idx)?"class='active'":"" }>
			  	<a href='FestTruckList.do?page=${idx }&rowPerPage=${(empty param.rowPerPage)?"10":param.rowPerPage}'>
			  	${idx }</a></li>
			</c:forEach>
			<c:if test="${pageObject.endPage != pageObject.totalPage}">
			  <li>
			  	<a href='FestTruckList.do?page=${pageObject.endPage + 1 }&rowPerPage=${(empty param.rowPerPage)?"10":param.rowPerPage}&searchKey=${param.searchKey}&searchWord=${param.searchWord}'>
			  	<i class="glyphicon glyphicon-forward"></i></a></li>
			</c:if>
			</ul>
		</td>
			<td colspan="2">
				<div class="btn-group">
					<button id="write" class="btn btn-primary">글쓰기</button>
					<button id="reload" class="btn btn-info">새로고침</button>
				</div>
			</td>
	</tr>
</tfoot>
</table>
</div>
</body>
</html>