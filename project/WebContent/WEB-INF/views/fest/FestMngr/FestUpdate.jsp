<%@page import="com.foodtruck.fest.dto.FestDTO"%>
<%@page import="com.foodtruck.fest.service.FestUpdateService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- <%@ include file = ""%> ->> jsp에서 jsp로 이동할 때 필요 --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>게시판 글수정</title>
<script>
$(document).ready(function(){
// 	alert("OK");
	// 버튼 이벤트 처리
	$("#cancel").click(function(){
		history.go(-1);
	});
	$("#reload").click(function(){
	    location = "FestUpdate.do";
	});
});
</script>
<link rel="stylesheet" href="../css/board.css" />
</head>
<body>
<div class="container">
<div class="panel_group">
<div class="panel panel-primary">
<div class="panel-heading">
<h1>게시판 글수정</h1>
</div>
<%-- <jsp:include page="../board/list.jsp" 혹은 ="${jsp}"></jsp:include> ->> 위에 선언된 include file로 jsp에서 jsp로 이동할 때 선언 --%>
<!-- 아님 sitemash를 통해 layout 짜서 이동 : filter를 하나 만들어서 자동적으로 part별로 적용되게 한다. -->
<div class="panel-body">
<form action="FestUpdate.do" method="post">
<input name="page" type="hidden" value="${param.page }"/>
<input name="rowPerPage" type="hidden" value="${param.rowPerPage }"/>
<table>
<tbody>
<!-- 데이터를 입력하는 -->
	<tr>
		<th>행사기관</th>
		<td><input name="festcomp" size="60" maxlength="100"/></td>
	</tr>
	<tr>
		<th>행사이름</th>
		<td><input name="festname" size="60" maxlength="100"/></td>
	</tr>
	<tr>
		<th>행사날짜</th>
		<td><input name="festdate" size="60" maxlength="100"/></td>
	</tr>
	<tr>
		<th>행사지역</th>
		<td><input name="festloc" size="60" maxlength="100"/></td>
	</tr>
	<tr>
		<th>행사시간</th>
		<td><input name="festtime" size="60" maxlength="100"/></td>
	</tr>
</tbody>
<tfoot>
	<tr>
	<td colspan="2">
			<button class="btn btn-primary">수정</button>
			<button type="reset" class="btn btn-info">새로고침</button>
			<button type="button" id="cancel" class="btn btn-warning">취소</button>
	</td>
	</tr>
</tfoot>
</table>
</form>
</div>
</div>
</div>
</div>
</body>
</html>