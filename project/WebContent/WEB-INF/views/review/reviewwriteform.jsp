<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 글쓰기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		// alert("OK")
		// 버튼 이벤트 처리
		$("#cancel").click(function() {
			alert("취소");
			location = "list.do";
		});
	});
</script>
<link rel="stylesheet" href="../css/board.css" />
</head>
<body>
	<h1>게시판 글쓰기</h1>
	<form action="reviewWrite.jsp" method="post">
	<table>
		<tbody>
			<!--데이터를 입력하는-->
			<tr>
				<th>제목</th>
				<td><input name="title" size="60" maxlength="100" required="required"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="5" cols="60" required="required"></textarea></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input name="id" size="10" maxlength="10" required="required"></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<button>등록</button>
					<button type="reset">새로고침</button>
					<button type="button" id="cancel">취소</button>
				</td>
			</tr>
		</tfoot>
		
	</table>
	</form>
</body>
</html>







