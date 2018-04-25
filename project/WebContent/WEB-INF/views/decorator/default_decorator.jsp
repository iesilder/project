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

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
pageContext.setAttribute("absURI", request.getContextPath());

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>웹짱:<decorator:title /></title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
header, footer {
	background: AntiqueWhite;
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
	background-color: #f2f2f2;
	padding: 25px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
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
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="${absURI }">Logo</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li><a href="${absURI }/info/view.do?no=${infoNo}">카페 소개</a></li>
						<li><a href="${absURI }/notice/list.do">공지사항</a></li>
						<li><a href="${absURI }/room/list.do">ROOM</a></li>
						<li><a href="${absURI }/teacher/list.do">TEACHER</a></li>
						<li><a href="${absURI }/board/list.do">게시판</a></li>
						      <c:if test="${ empty id }">
						      	<li><a href="../member/login.do">로그인</a></li>
						      	<li><a href="../member/join.do">회원가입</a></li>
						      </c:if>
						      <c:if test="${ !empty id }">
						      	<li><a href="../member/logout.do">로그아웃</a></li>
						      </c:if>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<c:if test="${empty login }">
							<li><a href="${absURI }/member/writeForm.do">회원가입</a></li>
							<li><a href="${absURI }/member/login.do"><span
									class="glyphicon glyphicon-log-in"></span> Login</a></li>
						</c:if>
						<c:if test="${!empty login }">
							<li id="welcome">${login.name}[${login.gradeName }]님,환영합니다</li>
							<li><a href="${absURI }/member/view.do?id=${login.id}">MyPage</a></li>
							<li><a href="${absURI }/member/logoutProcess.do"><span
									class="glyphicon glyphicon-log-in"></span> Logout</a></li>
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
		<p>이 홈페이지의 저작권은 나훈주에게 있습니다.</p>
	</footer>
</body>
</html>