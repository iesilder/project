<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>게시판 글쓰기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
// 	alert("OK");
	// 버튼 이벤트 처리
	$("#cancel").click(function(){
		history.back();
	});
});
</script>
<link rel="stylesheet" href="../css/board.css" />
</head>
<body>
<h1>게시판 글쓰기</h1>
<div class="container">
<h2>Basic Table</h2>
  <p>The .table class adds basic styling (light padding and only horizontal dividers) to a table:</p>
<form action="FestWrite.do" method="post">
<table class="table">
<tbody>
<!-- 데이터를 입력하는 -->
	<tr>
		<th>행사기관</th>
		<td><input name="festcomp" size="60" maxlength="100"/></td>
	</tr>
	<tr>
		<th>행사이름</th>
		<td><input name="festname" size="60" maxlength="100"/></td>
	</tr>
	<tr>
		<th>행사날짜</th>
		<td><input name="festdate" size="60" maxlength="100"/></td>
	</tr>
	<tr>
		<th>행사지역</th>
		<td><input name="festloc" size="60" maxlength="100"/></td>
	</tr>
	<tr>
		<th>행사시간</th>
		<td><input name="festtime" size="60" maxlength="100"/></td>
	</tr>
</tbody>
<tfoot>
	<tr>
		<td colspan="2">
			<button class="btn btn-success">등록</button>
			<button type="reset" class="btn btn-warning">새로고침</button>
			<button type="button" id="cancel" class="btn btn-danger">취소</button>
		</td>
	</tr>
</tfoot>
</table>
</form>
</div>
</body>
</html>