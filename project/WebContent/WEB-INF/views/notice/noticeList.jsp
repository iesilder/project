<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	System.out.println("내가 gradeno:"+session.getAttribute("gradeno"));
%>
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
		// 		alert(no);
		location = "noticeView.do?no="
					+ no
					+ "&page=${pageObject.page}"
					+ '&rowPerPage=${(empty param.rowPerPage)?'10':param.rowPerPage}';
		});
	$("#write").click(function() {
			location = "noticeWrite.do";
		});
});
</script>
<link rel="stylesheet" href="../css/board.css" />
</head>
<body>
	<h1>공지사항 리스트 </h1>
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
				<td colspan="3">
					<ul class="pagination">
						<c:if test="${pageObject.startPage > 1 }">
							<li><a
								href='noticeList.do?page=${pageObject.startPage - 1 }&rowPerPage=${(empty param.rowPerPage)?"10":param.rowPerPage}'>
									<i class="glyphicon glyphicon-step-backward"></i>
							</a></li>
						</c:if>
						<c:forEach begin="${pageObject.startPage }"
							end="${pageObject.endPage }" var="idx">
							<li ${(pageObject.page == idx)?"class='active'":"" }><a
								href='noticeList.do?page=${idx }&rowPerPage=${(empty param.rowPerPage)?"10":param.rowPerPage}'>
									${idx }</a></li>
						</c:forEach>
						<c:if test="${pageObject.endPage != pageObject.totalPage }">
							<li><a
								href='noticeList.do?page=${pageObject.endPage + 1 }&rowPerPage=${(empty param.rowPerPage)?"10":param.rowPerPage}'>
									<i class="glyphicon glyphicon-step-forward"></i>
							</a></li>
						</c:if>
					</ul>
				</td>

				
				<c:if test="${session.gradeno > 8} ">
					<td colspan="2">
						<div class="btn-group">
							<button id="write" class="btn btn-primary">글쓰기</button>
						</div>
					</td>
				</c:if>

			</tr>
		</tfoot>
	</table>
</body>
</html>