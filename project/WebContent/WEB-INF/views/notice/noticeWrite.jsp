<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="">
<meta name="author" content=""> <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>공지사항 글쓰기</title>
    <!-- Bootstrap core CSS -->
    <link href="../../../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../../../css/modern-business.css" rel="stylesheet">

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
	<h1>공지사항 글쓰기</h1>
	<form action="noticeWrite.jsp" method="post">
		<div class="row">
			<div class="col-lg-8 mb-4">
				<div class="control-group form-group">
					<div class="controls">
						<label>제목</label> <input name="title" size="60" maxlength="100"
							required="required">
						<p class="help-block"></p>
					</div>
				</div>
				<div class="control-group form-group">
					<div class="controls">
						<label>작성자</label> <input name="id" size="10" maxlength="10"
							required="required" placeholder="관리자">
					</div>
				</div>
				<div class="control-group form-group">
					<div class="controls">
						<label>내용</label>
						<textarea name="content" rows="10" cols="100" id="content"
							required="required"
							data-validation-required-message="내용을 입력해주세요."></textarea>
					</div>
				</div>
				<div id="success"></div>
				<!-- For success/fail messages -->
				<button>등록</button>
				<button type="reset">새로고침</button>
				<button type="button" class="btn btn-primary" id="cancel">취소</button>
			</div>

		</div>
	</form>
	   <script src="../../../vendor/jquery/jquery.min.js"></script>
    <script src="../../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>