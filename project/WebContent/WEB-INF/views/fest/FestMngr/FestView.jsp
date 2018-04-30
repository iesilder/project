<%@page import="com.foodtruck.fest.FestService.FestViewService"%>
<%@page import="com.foodtruck.fest.dto.FestDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>게시판 글보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
// 	alert("OK");
	// 버튼 이벤트 처리
// 	수정 & 수정취소 버튼을 일단 숨긴다. 
	
	$("#update").click(function(){
// 		location="update.do?festno="+$("#td_festno").text();
		$("#dataForm").attr("action","FestUpdate.do");
		$("#dataForm").submit();
	});
	$("#delete").click(function(){
		if(confirm("정말 삭제하시겠습니까?"))
			location="FestDelete.do?festno="+$("#td_festno").text();
	});
	$("#list").click(function(){
// 		location="list.do";
		$("#dataForm input[name='festno']").attr("disabled", "disabled");
		$("#dataForm").attr("action","FestList.do"). submit();
	});
});
</script>
<link rel="stylesheet" href="../css/board.css" />
</head>
<body>
<h1>게시판 글보기</h1>
<!-- 넘어온 데이터를 저장해 놓는 form tag 작성. 모든 input tag는 속성을 hidden으로 지정한다.  -->
<form id="dataForm">
	<input type ="hidden" name="festno" value="${FestDTO.festno }" />
	<input type ="hidden" name="page" value="${param.page }"/>
	<input type ="hidden" name="rowPerPage" value="${param.rowPerPage }"/>
</form>
<div class="container">
  <h2>Basic Table</h2>
  <p>The .table class adds basic styling (light padding and only horizontal dividers) to a table:</p>
<table class="table">
<tbody>
<!-- 데이터를 출력한다. -->
	<tr>
		<th>행사번호</th>
		<td id="td_festno">${FestDTO.festno}</td>
	</tr>
	<tr>
		<th>행사기관</th>
		<td>${FestDTO.festcomp}</td>
	</tr>
	<tr>
		<th>행사이름</th>
		<td><pre>${FestDTO.festname}</pre></td>
	<tr/>
	<tr>
		<th>행사날짜</th>
		<td>${FestDTO.festdate}</td>
	</tr>
	<tr>
		<th>행사지역</th>
		<td>${FestDTO.festloc}</td>
	</tr>
	<tr>
		<th>행사시간</th>
		<td>${FestDTO.festtime}</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${FestDTO.applydate}</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${FestDTO.hit}</td>
	</tr>
</tbody>
<tfoot>
	<tr>
		<td colspan="2">
			<button id="update" class="btn btn-warning">수정</button>
			<button id="delete" class="btn btn-danger">삭제</button>
			<button id="list" class="btn btn-success">리스트</button>
		</td>
	</tr>
</tfoot>
</table>
</div>
</body>
</html>