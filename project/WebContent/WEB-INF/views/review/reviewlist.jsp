<%@page import="com.foodtruck.review.controller.ReviewController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 
// // String list = (String)request.getAttribute("list");
// String a = request.getParameter("list");
// // out.println(list);
out.println("도착했다!!!!!");
System.out.println("도착했다!!!!!");

// // Object x = request.getAttribute("list");

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 리스트</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
// 	alert("OK");
    $(".data").click(function(){
//         $(this).hide();
        var no = $(this).find("td:first").text();
// 		alert("click");
// 		alert(no);
		location = "reviewview.do?no="+no
				+"&page=${pageObject.page}"
				+'&rowPerPage=${(empty param.rowPerPage)?"10":param.rowPerPage}';
    });
    $("#write").click(function(){
    	location = "reviewWrite.do";
    });
});
</script>
<!-- <link rel="stylesheet" href="../css/board.css" /> -->
</head>
<body>
	<h1>공지사항 리스트</h1>
	<table class="table">
		<thead>
			<tr>
				<th>번호</th>
				<th>행사지역</th>
				<th>행사명</th>
				<th>행사음식</th>
				<th>별점</th>
				<th>평점</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<!-- 데이터를 출력하는 반복 처리 -->
			<c:forEach items="${list }" var="reviewDTO">
				<tr class="data">
					<td>${reviewDTO.no }</td>
					<td>${reviewDTO.festloc }</td>
					<td>${reviewDTO.fname }</td>
					<td>${reviewDTO.maindish }</td>
					<td>${reviewDTO.starscore }</td>
					<td>${reviewDTO.score }</td>
					<td>${reviewDTO.hit }</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
		<td colspan="3">
			<ul class="pagination">
			<c:if test="${pageObject.startPage > 1 }">
			  <li>
			  	<a href='reviewlist.do?page=${pageObject.startPage - 1 }&rowPerPage=${(empty param.rowPerPage)?"10":param.rowPerPage}'>
			  	<i class="glyphicon glyphicon-step-backward"></i></a></li>
			 </c:if>
			<c:forEach begin="${pageObject.startPage }" end="${pageObject.endPage }"
			var="idx">
			  <li ${(pageObject.page == idx)?"class='active'":"" }>
			  	<a href='reviewlist.do?page=${idx }&rowPerPage=${(empty param.rowPerPage)?"10":param.rowPerPage}'>
			  	${idx }</a></li>
			</c:forEach>
			<c:if test="${pageObject.endPage != pageObject.totalPage }">
			  <li>
			  	<a href='reviewlist.do?page=${pageObject.endPage + 1 }&rowPerPage=${(empty param.rowPerPage)?"10":param.rowPerPage}'>
			  	<i class="glyphicon glyphicon-step-forward"></i></a></li>
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
</body>
</html>