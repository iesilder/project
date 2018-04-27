<%@page import="com.foodtruck.fest.dto.FestDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.foodtruck.fest.service.FestListService"%>
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
        var festno = $(this).find("td:first").text();
// 		alert("click");
// 		alert(festno);
		location = "FestView.do?festno="+festno+'&page=${pageObject.page}&rowPerPage=${(empty param.rowPerPage)?"10":param.rowPerPage}&searchKey=${param.searchKey}&searchWord=${param.searchWord}';
    });
    $("#write").click(function(){
    	location = "FestWrite.do";
    });
    $("#reload").click(function(){
    	location = "FestList.do";
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
<option value="festname" ${(param.searchKey == "festname")?"selected=\"selected\"":"" } 
  		>행사이름</option>
<option value="festdate" ${(param.searchKey == "festdate")?"selected=\"selected\"":"" } 
  		>행사날짜</option>
<option value="festloc" ${(param.searchKey == "festloc")?"selected=\"selected\"":"" } 
  		>행사지역</option>
<option value="festname,festloc" ${(param.searchKey == "festname,festloc")?"selected=\"selected\"":"" } 
  		>행사이름+행사날짜</option>
<option value="festname,festloc" ${(param.searchKey == "festname,festloc")?"selected=\"selected\"":"" } 
  		>행사이름+행사지역</option>
<option value="festdate,festloc" ${(param.searchKey == "festdate,festloc")?"selected=\"selected\"":"" } 
  		>행사날짜+행사지역</option>
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
		<th>행사번호</th>
		<th>행사이름</th>
		<th>행사날짜</th>
		<th>행사지역</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
</thead>
<tbody>
<!-- 데이터를 출력하는 반복 처리 -->
<c:forEach items="${list }" var="FestDTO">
	<tr class="data">
		<td>${FestDTO.festno }</td>
		<td>${FestDTO.festname }</td>
		<td>${FestDTO.festdate }</td>
		<td>${FestDTO.festloc }</td>
		<td>${FestDTO.applydate }</td>
		<td>${FestDTO.hit }</td>
	</tr>
</c:forEach>
</tbody>
<tfoot>
	<tr>
		<td colspan="3">
			<ul class="pagination">
			<c:if test="${pageObject.startPage > 1 }">
			  <li>
			  	<a href='FestList.do?page=${pageObject.startPage -1 }&rowPerPage=${(empty param.rowPerPage)?"10":param.rowPerPage}&searchKey=${param.searchKey}&searchWord=${param.searchWord}'>
			  	<i class="glyphicon glyphicon-backward"></i></a></li>
			</c:if>
			<c:forEach begin="${pageObject.startPage }" end="${pageObject.endPage }"
			var="idx">
			  <li ${(pageObject.page == idx)?"class='active'":"" }>
			  	<a href='FestList.do?page=${idx }&rowPerPage=${(empty param.rowPerPage)?"10":param.rowPerPage}'>
			  	${idx }</a></li>
			</c:forEach>
			<c:if test="${pageObject.endPage != pageObject.totalPage}">
			  <li>
			  	<a href='FestList.do?page=${pageObject.endPage + 1 }&rowPerPage=${(empty param.rowPerPage)?"10":param.rowPerPage}&searchKey=${param.searchKey}&searchWord=${param.searchWord}'>
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