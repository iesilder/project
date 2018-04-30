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

	//관리자용 페이지를 위한 처리 - 유태선 20180430
	int gradeno;
	if(session.getAttribute("gradeno") != null){
		gradeno = (int) session.getAttribute("gradeno");
	}else{
		gradeno = 0;
	}
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

.container li ul {
background: #800080;
display:none;  /* 평상시에는 서브메뉴가 안보이게 하기 */
height:auto;
padding:0px;
margin:0px;
border:0px;
position:absolute;
width:130px;
z-index:200;
}
.container li:hover ul {
display:block;   /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
list-style: none;
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
						<li class="nav-item dropdown">
			              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
			                	행사일정
			              </a>
			              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
			                <ul>
				                <li><a class="dropdown-item" href="../fest/FestMngr/FestList.do">행사일정표 </a></li>
				                <li><a class="dropdown-item" href="../fest/FestTruck/TruckWrite.do">푸드트럭 신청서</a></li>
				                <li><a class="dropdown-item" href="../fest/FestCust/CustWrite.do">소비자 신청서</a></li>
			                </ul>
			              </div>
			            </li>
						<li><a href="${absUri }/review/reviewlist.do">리뷰</a></li>
						<li><a href="${absUri }/notice/noticeList.do">공지사항</a></li>
						<li class="dropdown">
			              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                	데이터 분석
			              </a>
			                <ul>
				                <li><a class="dropdown-item" href="${absUri }/notice/noticeList.do">상권분석</a></li>
				                <li><a class="dropdown-item" href="${absUri }/notice/noticeList.do">공공데이터</a></li>
				                <li><a class="dropdown-item" href="${absUri }/notice/noticeList.do">푸드트럭 지도</a></li>
				                <%if(gradeno >= 9 ){ %>
				                <li><a class="dropdown-item" href="${absUri }/notice/noticeList.do">관리자용 페이지</a></li>
			              		<%} %>
			              	</ul>
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
						   <span class="glyphicon glyphicon-log-out"> </span> 로그아웃</a></li>
						   <li><a href="../member/mypage.do">
						   <span class="glyphicon glyphicon-user"> </span> 회원정보</a></li>
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