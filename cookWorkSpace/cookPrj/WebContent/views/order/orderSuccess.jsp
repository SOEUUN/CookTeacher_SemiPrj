<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	int totalPrice = (int) request.getAttribute("totalPrice");
    MemberVo cartMember = (MemberVo) request.getAttribute("cartMember");
    
    double rate = 0;
	
    // 회원 등급에 따른 적립 포인트
    switch(cartMember.getGrade()) {
    
    case "1": 
        rate = 0.01;
        break;
        
    case "2":
        rate = 0.03;
        break;
        
    case "3":
        rate = 0.05;
        break;
    
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>집밥쿡선생 :: 주문페이지</title>
    <!-- 경로 체크 필수 -->
    <link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
    <link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
    <link rel="stylesheet" href="../resources/css/order/orderSuccess.css">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
</head>
<body>
    <%@include file="/views/common/header.jsp" %> 
    <div id="container"> 
        <main>
            <div class="success">
                <div class="check-icon">
                    <img src="../resources/img/icons/결제완료.png">
                </div>
                <div class="check-wrapper">
                    
                    <div class="order-wrapper">
                        <div class="order-success">
                            <h1>고객님의 주문이 완료되었습니다.</h1>
                            <p>열심히 달려갈게요!</p>
                        </div>
                        <div class="order-price">
                            <p>결제 금액 : </p>
                            <p><fmt:formatNumber value="${totalPrice}" pattern="#,###"/>원</p>
                        </div>
                        <c:set var="memberRate" value="<%=rate%>"/>
                        <div class="order-price">
                            <p>적립포인트 : </p>
                            <p><fmt:formatNumber value="${totalPrice * memberRate}" pattern="#,###" />원</p>
                        </div>
                        <div class="notice">
                            <span>&#183; [배송준비중] 이전일 때 주문내역 상세페이지에서 주문 취소가 가능합니다.</span>
                            <span>&#183; 주문/배송 및 기타 문의가 있을 경우, 1:1 문의에 남겨주시면 신속히 해결해드리겠습니다.</span>
                        </div>
                        <div class="movePage">
                            <button class="moveHome" type="button" onclick="location.href='/cookTeacher'">홈으로 이동</button>
                            <button class="moveDetail" type="button" onclick="location.href='/cookTeacher/order/mypage/orderlist'">주문내역 상세보기</button>
                        </div>
                    </div>
                    
                </div>

            </div>
        
        </main>
        <%@include file="/views/common/footer.jsp" %> 
</body>
</html>