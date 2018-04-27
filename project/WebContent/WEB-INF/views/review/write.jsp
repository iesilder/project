<%@page import="com.foodtruck.review.service.ReviewWriteService"%>
<%@page import="com.foodtruck.review.dto.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
System.out.println("write.jsp로 넘어왓대두!?");
// 한글처리
// request.setCharacterEncoding("utf-8");
// 데이터를 받는다.
ReviewDTO reviewDTO 
= new ReviewDTO(
		0,
		request.getParameter("content"),
		request.getParameter("starscore")
		);
// DB에 넣는다.
ReviewWriteService reviewwriteService = new ReviewWriteService();
reviewwriteService.execute(reviewDTO);
// 자동으로 리스트로 간다.
// response.sendRedirect("reviewlist.do");
%>
<html>
<head></head>
<body>
write.jsp 로넘어옵니까?
</body>
</html>