<%@page import="com.foodtruck.review.controller.ReviewController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int gradeno;
	if (session.getAttribute("gradeno") != null) {
		gradeno = (int) session.getAttribute("gradeno");
	} else {
		gradeno = 0;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 리스트</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$("#data")
								.click(
										function() {
											var no = $(this).find("td:first")
													.text();
											location = "reviewview.do?rno="
													+ rno
													+ "&page=${pageObject.page}"
													+ '&rowPerPage=${(empty param.rowPerPage)?"10":param.rowPerPage}';
										});
					});
</script>
</head>
<div class="container">
	<h1 class="mt-4 mb-3">
		리뷰 <small>메인 화면</small>
	</h1>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="../../main/main.do">메인</a></li>
		<li class="breadcrumb-item active">행사 리뷰</li>
		<li
			style="position: absolute; top: 97px; right: 500px; font-size: 18px;"><table>
				<tr>
					<td colspan="2">
						<div class="btn-group">
							<button id="write" class="btn btn-primary"
								onclick="window.open('reviewwrite.do','window_name','width=600,height=800,location=no,status=no,scrollbars=yes');">글쓰기</button>
							<button id="reload" class="btn btn-info">새로고침</button>
						</div>
					</td>
				</tr>
			</table></li>
	</ol>
	<!-- Project One -->
	<div class="row">
		<c:forEach items="${list }" var="reviewDTO">
			<div class="col-md-7">
				<a href="#"> <img class="img-fluid rounded mb-3 mb-md-0"
					src="../../../img/portfolio_4 - burger 700x400.jpg" alt="버버푸드트럭 리뷰"
					style="width: 600px; height: 300px;">
				</a><br>
			</div>
			<div class="col-md-5">

				<a style="font-size: 15px; text-decoration: none; color: blue;">${reviewDTO.id}님의
					작성글</a><br> <a
					style="font-size: 30px; text-decoration: none; color: black;">"${reviewDTO.fname }"&ensp;</a>
				<a style="text-decoration: none; color: black">행사날짜 :</a>${reviewDTO.festdate }<br>
				<a style="font-size: 12px; text-decoration: none; color: black;">행사지역
					: </a>${reviewDTO.festloc }<br> <a
					style="font-size: 12px; text-decoration: none; color: black;">메인음식
					:</a> ${reviewDTO.maindish }<br>
				<br> <br>
				<a style="font-size: 16px; text-decoration: none; color: black;">${reviewDTO.content }</a><br>
				<%
				if (gradeno < 1) {
			    %>
				<a href="../member/join.do" style="color: orange;;">자세한 리뷰가 보고 싶다면? 회원가입하러 고고고!</a>
				<%} %>
				<a style="color: red; font-size: 40px; text-decoration: none;">${reviewDTO.starscore }&emsp;&emsp;</a>
				<a style="font-size: 50px; text-decoration: none;">${reviewDTO.score }
					${reviewDTO.writedate }</a><br>

				<%
					if (gradeno >= 1) {
				%>
				<a class="btn btn-primary" href="reviewview.do?rno=${reviewDTO.rno}">리뷰
					자세히 보러가기 <%
					}
				%> <span class="glyphicon glyphicon-chevron-right"></span>
				</a><br>
				<br>
				<br>
				<br>
				<br>
				<br>
			</div>
		</c:forEach>
</div>
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