<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>cookTeacher</title>
    <!-- 경로 체크 필수 -->
    <link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
    <link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
    <link rel="stylesheet" href="../resources/css/order/orderSuccess.css">
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
                            <p>30000원</p>
                        </div>

                        <div class="notice">
                            <span>&#183; [배송준비중] 이전일 때 주문내역 상세페이지에서 주문 취소가 가능합니다.</span>
                            <span>&#183; 주문/배송 및 기타 문의가 있을 경우, 1:1 문의에 남겨주시면 신속히 해결해드리겠습니다.</span>
                        </div>
                        <div class="movePage">
                            <button class="moveHome" type="button" onclick="location.href='/cookTeacher'">홈으로 이동</button>
                            <button class="moveDetail" type="button" onclick="location.href='/cookTeacher/order/orderDetail'">주문내역 상세보기</button>
                        </div>
                    </div>
                    
                </div>



            </div>
        

            
        </main>
        <%@include file="/views/common/footer.jsp" %> 
</body>
</html>