<!-- sitemesh 사용을 위한 설정 파일 -->
<!-- 작성자 : 홍다운-->
<!-- 작성일 : 2018-04-19 -->
<!-- 작성자 : 홍다운 -->
<!-- 작성일 : 2018-04-19 -->
<!-- sitemesh 설정에 대한 정의 xml 파일 -->
<!-- 1. web.xml에 filter를 지정해야한다. -->
<!-- 2. sitemesh.xml을 설정한다: parser, mapper를 설정 .  --> 
<!-- 3. 꾸미기에 대한 설정은 :decorator에 지정 : 적용을 시킬 구체적인 URI 적용  -->
<!-- 4. decorators.xml에 설정한 JSP를 만든다.  --> 

<!-- sitemesh 사용을 위한 설정 파일 -->
<!-- 작성자 : 이영환 -->
<!-- 작성일 : 2018.04.19 -->
<!-- 1. web.xml에 filter를 지정해야 한다 -->
<!-- 2. sitemesh.xml 설정: parser, mapper를 지정 -->
<!-- 3. decorators.xml 설정: 꾸미기에 대한 설정 - 구체적인 uri 적용 -->
<!-- 4. default_decorator.jsp: decorators.xml 설정한 JSP를 만든다.(*) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
System.out.println("default_decorator.jsp:"+request.getContextPath());
pageContext.setAttribute("absUri", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>둥가둥가 푸드트럭:<decorator:title /></title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Modern Business - Start Bootstrap Template</title>

    <!-- Bootstrap core CSS -->
    <link href="../../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../../css/modern-business.css" rel="stylesheet">
<style type="text/css">
header, footer {
	background: purple;
	}

pre {
	background: white;
	border: 0px;
}

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: purple;
	padding: 25px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}

 /* Hide the carousel text when the screen is less than 600 pixels wide */ */
 @media{ 
 	.carousel-caption { 
 		display: none; 
 	} 
 } 

article {
	min-height: 795px;
}

#welcome {
	color: grey;
	margin: 0 auto;
}
</style>
<decorator:head/>
</head>
<body>
	<header>
	   <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    	  <div class="container">
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<div class="navbar-header"><a href="${absUri }/main/main.do"
							 class="navbar-brand">둥가둥가</a></div>
					<ul class="nav navbar-nav">
						<li><a href="${absUri }/fest/FestMngr/FestList.do">행사일정</a></li>
						<li><a href="${absUri }/review/reviewlist.do">리뷰</a></li>
						<li><a href="/board/list.do">트렌트</a></li>
						<li><a href="${absUri }/notice/noticeList.do">공지사항</a></li>
						<li class="nav-item dropdown">
			              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown">데이터 분석</a>
			              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
			                <a class="dropdown-item" href="blog-home-1.html">1</a>
			                <a class="dropdown-item" href="blog-home-2.html">2</a>
			                <a class="dropdown-item" href="blog-post.html">3t</a>
			              </div>
			            </li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
					    <c:if test="${ empty id }">
						   <li><a href="../member/login.do">
						   <span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
						   <li><a href="../member/join.do">
						   	<span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
					    </c:if>
					    <c:if test="${ !empty id }">
						   <li><a href="../member/logout.do">
						   <span class="glyphicon glyphicon-log-out"> </span>로그아웃</a></li>
      					</c:if>

					</ul>
				</div>
			</div>
		</nav>
	</header>
	<article>
		<decorator:body />
	</article>
	<footer class="container-fluid text-center">
		<p>Copyright: 둥가둥가 푸드트럭 2018</p>
	</footer>
	    <!-- Bootstrap core JavaScript -->
    <script src="../../vendor/jquery/jquery.min.js"></script>
    <script src="../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>