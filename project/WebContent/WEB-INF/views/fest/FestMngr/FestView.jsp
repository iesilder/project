<%@page import="com.foodtruck.fest.service.FestViewService"%>
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
	$("#replyUpdateDiv").hide();
	
	$("#update").click(function(){
// 		location="update.do?no="+$("#td_no").text();
		$("#dataForm").attr("action","update.do");
		$("#dataForm").submit();
	});
	$("#delete").click(function(){
		if(confirm("정말 삭제하시겠습니까?"))
			location="delete.do?no="+$("#td_no").text();
	});
	$("#list").click(function(){
// 		location="list.do";
		$("#dataForm input[name='no']").attr("disabled", "disabled");
		$("#dataForm").attr("action","list.do"). submit();
	});
	
	// 댓글에 대한 이벤트 처리 - 등록
	$("#replyWriteBtn").click(function() {
		$("#replyForm").attr("action", "replyWrite.do").submit();
	});
	// 댓글에 대한 이벤트 처리 - 수정
	$("#replyUpdateBtn").click(function() {
		$("#replyForm").attr("action", "replyUpdate.do").submit();
	});
	// 댓글 목록에 있는 수정&삭제버튼
	$(".rereplyUpateBtn").click(function() {
		// 클릭한 td를 선택한다.
		var tdObj = $(this).parent().parent();
		$("#replyForm input[name='rno']").removeAttr("disabled");
		// 클릭한 td안에 있는 rno를 가져와서 폼안에 rno에 넣어준다.
		$("#replyForm input[name='rno']")
		.val($(tdObj).find("#rno").text());
		$("#replyForm textarea[name='content']")
		.val($(tdObj).find("#content").text());
		$("#replyForm input[name='writer']")
		.val($(tdObj).find("#writer").text());
		// 버튼을 바꿔준다. '등록'-> '수정'&'수정취소'
		// toggle이란? hide<->show 로 바꾸는 것 
		$("#replyWriteDiv, #replyUpdateDiv").toggle();
		// 수정을 위하여 cursor의 위치를 옮긴다.
		$("#replyForm textarea[name='content']").focus();
	});
	$("#replyCancelBtn").click(function() {
		// 1. 내용을 지운다. 셋팅했던 내용을 지운다.
		$("#replyForm input[name='rno']").val("");
		$("#replyForm textarea[name='content']").val("");
		$("#replyForm input[name='writer']").val("");
		// 2. rno를 disable로 바꾼댜.
		$("#replyForm input[name='rno']").attr("disabled", "disabled");
		// 3. 댓글 등록버튼으로 바꾼다.
		$("#replyWriteDiv, #replyUpdateDiv").toggle();
	});
});
</script>
<link rel="stylesheet" href="../css/board.css" />
</head>
<body>
<h1>게시판 글보기</h1>
<!-- 넘어온 데이터를 저장해 놓는 form tag 작성. 모든 input tag는 속성을 hidden으로 지정한다.  -->
<form id="dataForm">
	<input type ="hidden" name="no" value="${boardDTO.no }" />
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
		<th>번호</th>
		<td id="td_no">${boardDTO.no}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${boardDTO.title}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td><pre>${boardDTO.content}</pre></td>
	<tr/>
	<tr>
		<th>작성자</th>
		<td>${boardDTO.writer}</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${boardDTO.writeDate}</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${boardDTO.hit}</td>
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
	<!-- 	댓글 쓰기 폼 -->
	<tr>
		<td colspan = "2">
		<h3>댓글</h3>
<!-- 		action은 이벤트 처리로 옮긴다. - jQuery를 이용해서 속성을 셋팅한다. -->
		<form id="replyForm" method="post">
			<input type="hidden" name="no" value="${param.no }"/> 
<!-- 			댓글을 수정하게 되면 rno가 필요하므로 수정처리를 위해 넣어둔다.  -->
			<input type="hidden" name="rno" disabled="disabled"/> 
			<input type="hidden" name="page" value="${param.page }"/> 
			<input type="hidden" name="rowPerPage" value="${param.rowPerPage }"/> 
			<input type="hidden" name="searchKey" value="${param.searchKey }"/> 
			<input type="hidden" name="searchWord" value="${param.searchWord }"/> 
			내용:<textarea rows="3" name="content" class="form-control"></textarea>
			작성자:<input name="writer" pattern="^.{2, 10}$" class="form-control"/>
			<div id="replyWriteDiv"><button class="btn btn-success" id="replyWriteBtn" type="button">댓글 등록</button></div>
			<div id="replyUpdateDiv">
				<button class="btn btn-warning" id="replyUpdateBtn" type="button">댓글 수정</button>
				<button class="btn btn-danger" id="replyCancelBtn" type="button">수정 취소</button>
			</div>
		</form>
		</td>
	</tr>
	<!-- 	댓글 보여주기 -->
	<c:forEach items="${replyList }" var="replyDTO">
	<tr>
		<td colspan = "2">
				<span id="rno">${replyDTO.rno}</span>
				<span id="content">${replyDTO.content} </span><br/>
				(<span>${replyDTO.writeDate} -  </span>
				<span id="writer">${replyDTO.writer}  </span>)
				<span>
					<button class="rereplyUpdateBtn">수정</button>
					<button class="rereplyDeleteBtn">삭제</button>
				</span>
		</td>
	</tr>
	</c:forEach>
</tfoot>
</table>
</div>
</body>
</html>