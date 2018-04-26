<%@page import="com.foodtruck.review.dto.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.foodtruck.review.service.ReviewListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% ReviewListService reviewlistservice =new ReviewListService();
Object obj = null;
    List<ReviewDTO> list = reviewlistservice.execute(obj);
    request.setAttribute("list", list);
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰게시판 리스트</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		// 	alert("OK");
		$(".data").click(function() {
			//         $(this).hide();
			var no = $(this).find("td:first").text();
			// 		alert("click");
			alert(no);
			location = "view.do?no=" + no;
		});
		$("#write").click(function() {
			location = "write.do";
		});
	});
</script>
<link rel="stylesheet" href="../css/board.css" />
</head>
<body>
	<h1>리뷰게시판 리스트</h1>
	<table class="table">
		<thead>
			<tr>
				<th>행사명</th>
				<th>행사지역</th>
				<th>행사날짜</th>
				<th>메인요리</th>
				<th>별점</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<!-- 데이터를 출력하는 반복 처리 -->
			<c:forEach items="${list }" var="reviewDTO">
				<tr class="data">
					<td>${reviewDTO.festloc }</td>
					<td>${reviewDTO.fname }</td>
					<td>${reviewDTO.festdate }</td>
					<td>${reviewDTO.maindish }</td>
					<td>${reviewDTO.starscore }</td>
					<td>${reviewDTO.hit }</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">
					<button id="write" class="btn btn-primary">글쓰기</button>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>