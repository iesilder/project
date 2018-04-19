<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 리스트</title>
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
	<h1>공지사항 리스트</h1>
	<table class="table">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<!-- 데이터를 출력하는 반복 처리 -->
			<c:forEach items="${list }" var="noticeDTO">
				<tr class="data">
					<td>${noticeDTO.no }</td>
					<td>${noticeDTO.title }</td>
					<td>${noticeDTO.id }</td>
					<td>${noticeDTO.writeDate }</td>
					<td>${noticeDTO.hit }</td>
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