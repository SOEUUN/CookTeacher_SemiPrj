<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 에러페이지</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
</head>
<body>
<%@include file="/views/common/header.jsp" %>
	<h1>에러페이지</h1>
	<h2>추후 꾸밀 예정,,,</h2>
	${errorMsg}
	<button type="button" onclick="goBack()">이전페이지로 돌아가기</button>
	
	<script>
		function goBack(){
			history.back();
		}
	</script>

</body>
</html>