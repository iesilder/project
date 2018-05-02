<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
System.out.println("default_decorator.jsp:"+request.getContextPath());
pageContext.setAttribute("absUri", request.getContextPath());

	//관리자용 페이지를 위한 처리 - 유태선 20180430
	int gradeno;
	if(session.getAttribute("gradeno") != null){
		gradeno = (int) session.getAttribute("gradeno");
	}else{
		gradeno = 0;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상권분석</title>
</head>
<body>
<br><br><br>
<a class="dropdown-item" href="${absUri }/data/HuffGravityModelPrint.do">상관관계분석</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a class="dropdown-item" href="${absUri }/data/agelm.do">회귀분석(나이)</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a class="dropdown-item" href="${absUri }/data/daylm.do">회귀분석(요일)</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a class="dropdown-item" href="${absUri }/data/timelm.do">회귀분석(시간대)</a>
<br><br><h3 class="mid">상관관계 분석</h3>
<div align="center">

	<h3 class="mid">상관관계 분석</h3>
	<iframe class="mid" src="http://127.0.0.1:7776/foodtruck.html" width="50%" height="400px" frameborder="0"></iframe>
	<img alt="상관분석" src="../../../img/dataimg/cor.png" width="50%" height="50%"/>

</div>

	
</body>
</html>