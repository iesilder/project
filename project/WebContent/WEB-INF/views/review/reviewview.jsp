<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 글보기</title>
 <meta charset="utf-8">
  <meta name="reviewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
// 	alert("OK");
	$("#update").click(function(){
// 		location="update.do?no="+$("#td_no").text();
		$("#dataForm").attr("action","reviewupdate.do");
		$("#dataForm").submit();
	});
	$("#delete").click(function(){
		if(confirm("정말 삭제하시겠습니까?"))
			location="reviewdelete.do?rno="+$("#td_rno").text();
	});
// 	$("#list").click(function(){
// // 		location="list.do";
// 		$("#dataForm input[name='rno']").attr("disabled","disabled")
// 		$("#dataForm").attr("action","reviewlist.do");
// 		$("#dataForm").submit();
// 	});
});
</script>
</head>
<body>
<!-- 넘어온 데이터를 저장해 놓는 form tag 작성. 모든 input tag는 type 속성을 hidden -->
<form id="dataForm">
	<input type="hidden" name="rno" value="${reviewDTO.rno }" />
	<input type="hidden" name="page" value="${param.page }" />
	<input type="hidden" name="rowPerPage" value="${param.rowPerPage }" />
	<input type="hidden" name="searchKey" value="${param.searchKey }" />
	<input type="hidden" name="searchWord" value="${param.searchWord }" />
</form>
<div class="container">
<h1>공지사항 글보기</h1>
<table class="table">
<tbody>
<!-- 데이터를 출력한다. -->
	<tr>
		<th>번호</th>
		<td id="td_rno">${reviewDTO.rno}</td>
	</tr>
	<tr>
		<th>아이디</th>
		<td>${reviewDTO.id}</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${reviewDTO.hit}</td>
	</tr>
	<tr>
		<th>회사명</th>
		<td>${reviewDTO.fname}</td>
	</tr>
	<tr>
		<th>주요메뉴</th>
		<td>${reviewDTO.maindish}</td>
	</tr>
	<tr>
		<th>행사장소</th>
		<td>${reviewDTO.festloc}</td>
	</tr>
	<tr>
		<th>행사날짜</th>
		<td>${reviewDTO.festdate}</td>
	</tr>
	<tr>
		<th>평점</th>
		<td><pre>${reviewDTO.score}</pre></td>
	<tr/>
	<tr>
		<th>별점</th>
		<td>${reviewDTO.starscore}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${reviewDTO.content}</td>
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
</div>
</body>
</html>