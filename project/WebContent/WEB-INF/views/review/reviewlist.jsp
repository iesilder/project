<%@page import="com.foodtruck.review.controller.ReviewController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 리스트</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						// 	alert("OK");
						$("#review").click(
										function() {
											//         $(this).hide();
											var no = $(this).find("td:first").text();
											// 		alert("click");
											// 		alert(no);
											location = "reviewview.do"
// 													"rno="	+ rno
// 													+ "&page=${pageObject.page}"
// 													+ '&rowPerPage=${(empty param.rowPerPage)?"10":param.rowPerPage}';
										});
// 						$("#write").click(function() {
// 							location = "reviewwrite.do";
// 						});
					});
</script>
<!-- <link rel="stylesheet" href="../css/board.css" /> -->
</head>
<!-- <body> -->

<!-- 	<h1 style="margin: center; align-items: center;">리뷰 리스트</h1> -->
<!-- 	<table class="table" -->
<!-- 		style="width: 70%; height: 180%; margin: auto; border-top: 1px solid #aaa; margin-top: 20px;"> -->

<!-- 		<thead> -->
			<!-- 			<tr> -->
			<!-- 				<th>번호</th> -->
			<!-- 				<th>행사지역</th> -->
			<!-- 				<th>행사명</th> -->
			<!-- 				<th>행사음식</th> -->
			<!-- 				<th>별점</th> -->
			<!-- 				<th>평점</th> -->
			<!-- 				<th>조회수</th> -->
			<!-- 			</tr> -->
<!-- 		</thead> -->
<!-- 		<tbody> -->
			<!-- 데이터를 출력하는 반복 처리 -->

<div class="container">
 <!-- Page Content -->
      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">리뷰
        <small>메인 화면</small>
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="../../main/main.do">메인</a>
        </li>
        <li class="breadcrumb-item active">행사 리뷰 </li>
        <li style="position: absolute;
    top: 97px;
    right: 500px;
    font-size: 18px;"><table>	<tr><td colspan="2">
					<div class="btn-group">
						<button id="write" class="btn btn-primary" onclick="window.open('reviewwrite.do','window_name','width=600,height=800,location=no,status=no,scrollbars=yes');">글쓰기</button>
						<button id="reload" class="btn btn-info">새로고침</button>
					</div>
				</td>
				</tr>
				</table>
				</li>
      </ol>

			
      <!-- Project One -->
      <div class="row">
      	<c:forEach items="${list }" var="reviewDTO">
  		<div class="col-md-7">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="../../../img/portfolio_4 - burger 700x400.jpg" alt="버버푸드트럭 리뷰" style="width:650px; height:300px;">
          </a><br>
        </div>
        <div class="col-md-5">
<table>
<tr>
<td>${reviewDTO.rno }</td>
</tr>
</table>

<%--         <p>${reviewDTO.rno }</p> --%>
          <a style="font-size: 40px; text-decoration: none; color: black;">"${reviewDTO.fname }"&ensp;</a>
          <a style="text-decoration: none; color: black">행사날짜 :</a>${reviewDTO.festdate }<br>
          <a style="font-size: 12px; text-decoration: none; color: black;">행사지역 : </a>${reviewDTO.festloc }<br>
          <a style="font-size: 12px;text-decoration: none;color: black;">메인음식 :</a> ${reviewDTO.maindish }<br><br>
          <br><a style="font-size: 16px;text-decoration: none;color: black;">${reviewDTO.content }</a><br>          
          <a style="color: red; font-size:40px;text-decoration: none;">${reviewDTO.starscore }&emsp;&emsp;</a>
          <a style="font-size: 50px;text-decoration: none; ">${reviewDTO.score } ${reviewDTO.writedate }</a><br>
          
          <a class="btn btn-primary" id="review" >리뷰 자세히 보러가기
            <span class="glyphicon glyphicon-chevron-right"></span>
          </a>
        </div>
        </c:forEach>
        
      </div>
        <!-- Project Three -->
      <div class="row">
        <div class="col-md-7">
          <a href="../../error/ing.jsp">
            <img class="img-fluid rounded mb-3 mb-md-0" src="../../../img/festival3.jpg" alt="장미축제" style="width:650px; height:350px;">
          </a>
        </div>
        <div class="col-md-5">
          <h3>장미 축제</h3>
            <p>2018-05-20</p>
          	<p>경기-용인</p>
            <p>나와 쌓은 10년의 우정의 고마움을 표현 할 수 있는 축제. 서로에게 장미를 선물하면서 소중한 시간을 보내세요...</p>
          <a class="btn btn-primary" href="../../error/ing.jsp">행사 자세히 보러가기
            <span class="glyphicon glyphicon-chevron-right"></span>
          </a>
        </div>
      </div>
      <!-- /.row -->
	
<%-- 			<c:forEach items="${list }" var="reviewDTO"> --%>
<!-- 				<tr class="data" style="cursor: pointer;" -->
<!-- 					onmouseover="this.style.color = 'grey'" -->
<!-- 					onmouseout="this.style.color = 'black'"> -->
<!-- 					<td -->
<!-- 						style="position: relative; height: 180px; border-bottom: 1px solid #aaa;"></td> -->
<!-- 					<th -->
<%-- 						style="position: relative; float: left; width: 140px; height: 140px; margin: 20px 4%; overflow: visible; background-color: #f1f1f1;">${reviewDTO.no }</th> --%>
<!-- 					<th -->
<!-- 						style="float: right; width: 520px; height: 140px; background-color: #f7f7f7; "> -->
						
<%-- 						<div>"${reviewDTO.fname }"   "${reviewDTO.festdate }"</div> --%>
<%-- 						<div>${reviewDTO.maindish }</div> --%>
<%-- 						<div>${reviewDTO.starscore }</div> --%>
<%-- 						<div>${reviewDTO.score }</div> --%>
<%-- 						<div>${reviewDTO.maindish }</div> --%>
						
<!-- 						</th> -->
<%-- <%-- 					<td>${reviewDTO.festloc }</td> --%>
<%-- <%-- 					<td>${reviewDTO.fname }</td> --%> 
<%-- <%-- 					<td>${reviewDTO.maindish }</td> --%> 
<%-- <%-- 					<td>${reviewDTO.starscore }</td> --%> 
<%-- <%-- 					<td>${reviewDTO.score }</td> --%> 
<%-- <%-- 					<td>${reviewDTO.hit }</td> --%> 
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
<!-- 		</tbody> -->
<table>
			<tr>
				<td colspan="3">
					<ul class="pagination">
						<c:if test="${pageObject.startPage > 1 }">
							<li><a
								href='reviewlist.do?page=${pageObject.startPage - 1 }&rowPerPage=${(empty param.rowPerPage)?"10":param.rowPerPage}'>
									<i class="glyphicon glyphicon-step-backward"></i>
							</a></li>
						</c:if>
						<c:forEach begin="${pageObject.startPage }"
							end="${pageObject.endPage }" var="idx">
							<li ${(pageObject.page == idx)?"class='active'":"" }><a
								href='reviewlist.do?page=${idx }&rowPerPage=${(empty param.rowPerPage)?"10":param.rowPerPage}'>
									${idx }</a></li>
						</c:forEach>
						<c:if test="${pageObject.endPage != pageObject.totalPage }">
							<li><a
								href='reviewlist.do?page=${pageObject.endPage + 1 }&rowPerPage=${(empty param.rowPerPage)?"10":param.rowPerPage}'>
									<i class="glyphicon glyphicon-step-forward"></i>
							</a></li>
						</c:if>
					</ul>
				</td>
			
			</tr>
	</table>
	</div>
</body>
</html>