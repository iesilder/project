<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="">
<meta name="author" content=""> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Modern Business - Start Bootstrap Template</title>
<!-- Bootstrap core CSS -->
<link href="../../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../../css/modern-business.css" rel="stylesheet">
<script>
$(document).ready(function(){
// 	alert("OK");
	// 버튼 이벤트 처리
	$("#cancel").click(function(){
		history.back();
	});
	$("#send").click(function(){
// 		location = "write.do";
		
1	});
});
</script>
</head>

<body>
<script>
		$(document).ready(function() {
			var i = 1;
			var htmlString = "";
			$("#bt1").click(function() {
				if (i < 5) {
					var x = $("#s").text();
					htmlString = "<span>" + x + "</span>";
					$("#star").append(htmlString);
					i++;
					$("#score").text(i);
					$("#star1").val(i);
					if (i == 2) {
						$("#starImg").val("★★");
						$("#score").val("2");

					} else if (i == 3) {
						$("#starImg").val("★★★");
						$("#score").val("3");

					} else if (i == 4) {
						$("#starImg").val("★★★★");
						$("#score").val("4");

					} else if (i == 5) {
						$("#starImg").val("★★★★★");
						$("#score").val("5");

					}
				}
			});

			$("#bt2").click(function() {
				if (1 < i) {
					$("#star span:last").remove();
					i--;
					$("#score").text(i);
					$("#star1").val(i);

					if (i == 2) {
						$("#starImg").val("★★");
						$("#score").val("2");
					} else if (i == 3) {
						$("#starImg").val("★★★");
						$("#score").val("3");

					} else if (i == 4) {
						$("#starImg").val("★★★★");
						$("#score").val("4");

					} else if (i == 1) {
						$("#starImg").val("★");
						$("#score").val("1");

					}

				}
			})
		});
	</script>


    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">리뷰게시판
        <small>작성란</small>
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.html">홈</a>
        </li>
        <li class="breadcrumb-item active">리뷰게시판</li>
      </ol>

      <!-- Contact Form -->
      <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
      <div class="row">
        <div class="col-lg-8 mb-4">
          <h3>리뷰 작성란</h3>
<!--           <form name="sentMessage" id="contactForm" novalidate> -->
           <form action="reviewupdate.do" method="post">
           <input type="hidden" id="starImg" name="starscore" value="★">
           <input type="hidden" id="score"name="score1" value="1">
            <div class="control-group form-group">
              <div class="controls">
                <label>평점:</label>
               <div>
               </div>
		
		<table>
			<thead>
				<tr>
					<td>
						<button id="bt1" type="button">+</button>
						<button id="bt2" type="button">-</button>
					</td>
				</tr>

				<tr>
					<td id="s" style="color: red; font-size: 50px;">★</td>
					<td id="star" align="left" style="color: red; font-size: 50px;"></td>
				</tr>
				</table>
				
              </div>
            </div>
            <div class="control-group form-group">
              <div class="controls">
                <label>내용:</label>
                <textarea rows="10" cols="100" class="form-control" name="content" id="content" placeholder="리뷰 내용을 입력하세요." required data-validation-required-message="공지사항 내용을 입력하세요." maxlength="999" style="resize:none"></textarea>
              </div>
            </div>
            <div id="success"></div>
            <!-- For success/fail messages -->
            <div>
	            <button type="submit" class="btn btn-primary" id="send">등록</button>
				<button type="reset" class="btn btn-warning">새로고침</button>
				<button type="button" id="cancel" class="btn btn-danger">취소</button>
			</div>
          </form>
        </div>

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright 둥가둥가 푸드트럭 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="../../vendor/jquery/jquery.min.js"></script>
    <script src="../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Contact form JavaScript -->
    <!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <script src="../../js/jqBootstrapValidation.js"></script>
    <script src="../../js/contact_me.js"></script>

  </body>

</html>