<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 에러페이지</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<style>
	#container>div{
    box-sizing: border-box;
    
}

#container{
    position: absolute;
    padding-bottom: 50px;
    top: 250px;
    left: 50%;
    transform: translate(-50%);
    
}

#error-wrap{
    width: 500px;
    margin: 0px auto;
}

#error-wrap>div:nth-child(1){
    font-weight: 700;
    font-size: 30px;
    color: rgb(51, 51, 51);
    line-height: 35px;
    text-align: center;
    letter-spacing: -1px;
}
#error-wrap>div:nth-child(2){
    font-weight: 600;
    font-size: 25px;
    color: rgb(51, 51, 51);
    line-height: 35px;
    text-align: center;
    letter-spacing: -1px;
}
#error-wrap>div:nth-child(3){
    font-weight: 500;
    font-size: 20px;
    color: rgb(51, 51, 51);
    line-height: 35px;
    text-align: center;
    letter-spacing: -1px;
}
#error-wrap>div:nth-child(4){
	padding: 75px 0px;
	display: flex;
	justify-content: center;
}

button{
	display: block;
    padding: 0px,10px;
    text-align: center;
    overflow: hidden;
    width: 120px;
    height: 42px;
    border-radius: 3px;
    color: rgb(255, 255, 255);
    background-color: #255D00;
    border: 0px none;
    margin: 5px;
}
</style>
</head>
<body>
<%@include file="/views/common/header.jsp" %>

	<div id="container">
		<div id="error-wrap">
			<div>에러페이지</div>
			<div>불편을 드려 죄송합니다.</div>
			<div>
				${errorMsg}
			</div>
			<div id="btn-area">
				<button type="button" onclick="goHome()">HOME</button>
			</div>
		</div>
		<%@include file="/views/common/footer.jsp" %>
	</div>
	
	
	<script>
		function goHome(){
			window.location.href = "/cookTeacher"
		}
	</script>

</body>
</html>