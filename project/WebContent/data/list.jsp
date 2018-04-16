<%-- <%@page import="com.webjjang.board.dto.BDTO"%> --%>
<%-- <%@page import="java.util.List"%> --%>
<%-- <%@page import="com.webjjang.Reviewboard.service.Blist"%> --%>
<%-- <%@page import="com.webjjang.board.dto.BDAO"%> --%>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<%--     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%--     <% Blist blist =new Blist(); --%>
//     List<BDTO> list = blist.process();
//     request.setAttribute("list", list);
<%--     %> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
<p>

</p>
<form action="">

<h1>푸드트럭 행사 후기란</h1>
<select>

<option value="key1">--시 선택--</option>
<c:forEach items="${list }" var="BDTO">

<option> ${BDTO.loc}</option>
</c:forEach>

</select>
<select>
<option>--구 선택--</option>
<c:forEach items="${list }" var="BDTO">

<option> ${BDTO.loc}</option>
</c:forEach>
</select>

<table>
<thead>

<tr>
<th></th>


</tr>
</thead>
<c:forEach items="${list}" var="boardDTO">
<tbody>
<tr>
<td></td>

</tr>



</tbody>
</c:forEach>
</table>
</form>
</body>
</html>