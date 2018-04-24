<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- DataTable css start-->

<!-- DataTable css end -->
<title>몽고디비내용 출력</title>
<!-- jquery start -->

<!-- jquery end -->
<script type="text/javascript">
	$(document).ready(function() {
		$('#example').DataTable();
	});
</script>
</head>
<body>
	<table>
		<tbody>
			<c:forEach var="data" items="${list }">
				<tr>
					<td>${data['TRDAR_CD_NM'] }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>