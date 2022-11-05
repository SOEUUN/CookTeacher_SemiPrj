<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String view = (String)request.getAttribute("view");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 마이페이지</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/mypage/main.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/member/mypage/info.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

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
                                <a href="<%=root %>/login/mypage/member/check">
                                    회원정보
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="<%=root%>/order/mypage/orderlist">
                                    주문내역
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="<%=root%>/bobstory/mypage/myCookStory">
                                    쿡스토리
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="<%=root%>/product/mypage/myReview">
                                    리뷰조회
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="<%=root%>/login/cs/QnAhistory">
                                    문의내역
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="<%=root%>/cs/QnA/write">
                                    문의하기
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="mypage-right">
                    <h2 id="head-aticle">
                        적립금
                    </h2>
                    <div id="line"></div>
                    <div id="board-container">

                        <div>
                            <div class="flex-box">
                                <div class="grade-area">
                                    <i class="bi bi-emoji-sunglasses"></i>
                                    <div>현재 적립금</div>

                                </div>
                                <div class="point-area">
                                    <div>${loginMember.point}P</div>
                                </div>
                            </div>
                            <div class="point-info">
                                <div>일반 1% 적립</div>
                                <div>화이트 3% 적립</div>
                                <div>그린 5% 적립</div>
                            </div>
                            <div class="btn-area">
                                <button class="grade-btn" type="button">
                                    등급확인
                                </button>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/views/common/footer.jsp" %>
    </div>

    <script>
        $('.grade-btn').click(function(){
            $.ajax({
                url : "/cookTeacher/login/mypage/member",
                method : "POST",
                success : function(data){
                    if(data != ""){
                        const result = JSON.parse(data); 

                        console.log(result.grade);

                        Swal.fire({
                            title:  result.nick+'님 현재 "'+result.grade+'" 등급',
                            text : result.save+'% 적립 가능',
                            width: 600,
                            padding: '3em',
                            color: '#716add',
                            backdrop: `
                                rgba(0,0,123,0.4)
                                url("/cookTeacher/resources/img/icons/grade.gif")
                                right top
                                no-repeat
                            `
                        });
                    }
                },
                error : function(){
                    alert('ajax 오류');
                },
            });
        });
    </script>


</body>
</html>