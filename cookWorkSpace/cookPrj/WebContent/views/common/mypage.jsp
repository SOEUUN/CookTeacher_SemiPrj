<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 마이페이지</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/mypage/main.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<link rel="stylesheet" href="/cookTeacher/resources/css/mypage/check.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/mypage/modify.css">
</head>
<body>
	<%@include file="/views/common/header.jsp" %>
	<div id="container">
        <div id="mypage-wrap">
            <div id="mypage-area">
                <div id="mypage-left">
                    <h2 id="tit-aticle">마이쿡</h2>
                    <div id="inner">
                        <ul id="list-menu">
                            <li class="non-clcik">
                                <a href="">
                                    회원정보
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="">
                                    주문내역
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="">
                                    쿡스토리
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="">
                                    리뷰조회
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="">
                                    문의내역
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="">
                                    문의하기
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="mypage-right">
                    <h2 id="head-aticle">
                        회원정보
                    </h2>
                    <div id="line"></div>
                    <div id="board-container">
                    	<!-- <%@include file="/views/member/mypage/check.jsp" %> -->
                        <%@include file="/views/member/mypage/modify.jsp" %> 
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/views/common/footer.jsp" %>
    </div>

    <script>


    </script>
</body>
</html>