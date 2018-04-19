<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>공지사항 글보기</title>
<script>
	$(document).ready(function() {
		// alert("OK")
		// 버튼 이벤트 처리
		$("#update").click(function() {
			alert("수정");
			location = "update.do?no=" + $("#td_no").text();
		});
		$("#delete").click(function() {
			if (confirm("정말 삭제하시겠습니까?"))
				location = "delete.do?no=" + $("#td_no").text();
		});
		$("#list").click(function() {
			location = "list.do";
		});
	});
</script>
<link rel="stylesheet" href="../css/board.css" />
</head>
<body>
	<h1>게시판 글보기</h1>
	
	<table class="table">
		<tbody>
			<!--데이터를 출력한다.-->

			<tr>
				<th>번호</th>
				<td id="td_no">${noticeDTO.no}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${noticeDTO.title}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><pre>${noticeDTO.content}</pre></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${noticeDTO.id}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${noticeDTO.writeDate}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${noticeDTO.hit}</td>
			</tr>

		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<button id="update" class="btn btn-primary">수정</button>
					<button id="delete" class="btn btn-danger">삭제</button>
					<button id="list" class="btn btn-success">리스트</button>
				</td>
			</tr>
		</tfoot>

	</table>
</body>
</html>







