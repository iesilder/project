<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 글쓰기</title>
<!-- Bootstrap core CSS -->
<link href="../../vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../../css/modern-business.css" rel="stylesheet">
<script>
	$(document).ready(function() {
		// 	alert("OK");
		// 버튼 이벤트 처리
		$("#cancel").click(function() {
			location="noticeList.do";
		});
	});
</script>
</head>

<body>

	<!-- Page Content -->
<!-- 	<form method="post"> -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			공지사항 <small>작성란</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="index.html">홈</a></li>
			<li class="breadcrumb-item active">공지사항</li>
		</ol>

		<!-- Contact Form -->
		<!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
		<div class="row">
			<div class="col-lg-8 mb-4">
				<h3>공지사항 작성란</h3>
				<form name="sentMessage" id="contactForm" method="post">
					<div class="control-group form-group">
						<div class="controls">
							<label>제목:</label> <input type="text" class="form-control"
								id="title" placeholder="제목을 입력하세요." required
								data-validation-required-message="제목을 입력하세요."
								required="required">
							<p class="help-block"></p>
						</div>
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label></label> <input type="hidden" class="form-control"
								id="id" data-validation-required-message="작성자를 입력하세요."
								required="required" value="admin ">
						</div>
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label>내용:</label>
							<textarea rows="10" cols="100" class="form-control" id="content"
								placeholder="공지사항 내용을 입력하세요." required
								data-validation-required-message="공지사항 내용을 입력하세요."
								maxlength="999" style="resize: none"></textarea>
						</div>
					</div>
					<div id="success"></div>
					<!-- For success/fail messages -->
					<div>
						<button type="submit" class="btn btn-primary">공지사항 등록</button>
						<button type="button" id="cancel" class="btn btn-danger">취소</button>
					</div>
				</form>
			</div>

		</div>
		<!-- /.row -->

	</div>

<!-- </form> -->
</body>

</html>