<%@page import="com.kh.cook.order.vo.OrderListVo"%>
<%@page import="com.kh.cook.order.vo.PaymentVo"%>
<%@page import="com.kh.cook.order.vo.OrderDetailVo"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.cook.order.vo.OrderVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String view = (String)request.getAttribute("view");
	OrderVo orderInfo = (OrderVo)request.getAttribute("orderInfo");
	List<OrderDetailVo> orderlist = (List<OrderDetailVo>) request.getAttribute("orderlist");
	PaymentVo paymentInfo = (PaymentVo) request.getAttribute("paymentInfo");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 마이페이지</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/mypage/main.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<link rel="stylesheet" href="/cookTeacher/resources/css/order/orderDetail.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
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
                                <a href="/cookTeacher/mypage/member/check">
                                    회원정보
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="/cookTeacher/order/mypage/orderlist">
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
                       <div class="header">
                           <h2 id="head-aticle">주문 내역 상세</h2>
                        </div>
                        <div class="order-header">
                            <h3 class="orderNo">주문번호 ${orderInfo.no}</h3>
                            <span class="askQnA">배송 또는 상품에 문제가 있나요?
                                <a href="<%=root%>/cs/QnA/write">1:1 문의하기
                                    <img src="/cookTeacher/resources/img/icons/right-arrow.png" alt="문의하기" class="askImg">
                                </a>
                            </span>
                        </div>
                        
                    <div>
                    <div id="board-container"> 
                            <c:forEach items="${orderlist}" var="orderItem">
                        <div class="board-wrapper">
                            <div class="thumb">
                               <img src="<c:url value="/upload/img/" />${orderItem.imgPath}" alt="${orderItem.name}">
                            </div>
                            <div class="productName">
                                <a href="<c:url value="/product/detail/productDetail?no=${orderItem.prodNo}"/>" alt="${orderItem.name}">${orderItem.name}</a>
                                <div class="productPrice">
                                    <span class="price"><fmt:formatNumber value="${Integer.parseInt(orderItem.getPrice()) * Integer.parseInt(orderItem.cnt)}" pattern="#,###"/>원</span>
                                    <span class="cnt">${orderItem.cnt}개</span>
                                </div>
                                
                            </div>
                            <c:if test="${orderInfo.cancelYN eq 'Y'}">
                             <span class="shipping">결제취소</span>
                            </c:if>
                            <c:if test="${orderInfo.cancelYN eq 'N'}">
                                <span class="shipping">결제완료</span>
                            </c:if>
                            
                            <form class="cartWrap" action="/cookTeacher/cart/add" method="POST">
                                <button class="cartAdd-btn">
                                    <span>장바구니 담기</span>
                                </button>
                                <input type="hidden" name="prodNo" value="${orderItem.prodNo}">
                                <input type="hidden" name="cnt" value="1">
                            </form>
                        </div>
                            </c:forEach>
                        <div class="btn-wrapper">
                            <button class="product-cancel" onclick="cancel(${orderInfo.no})" <c:if test="${orderInfo.cancelYN eq 'Y'}">disabled</c:if>>
                                <span>전체 상품 주문 취소</span>
                            </button>
                        </div>
                        <span class="notice">주문취소는 [주문완료] 상태일 경우에만 가능합니다.</span>
                        <div class="payment-info">
                            <div class="payment-header">
                                <h3>결제정보</h3>
                            </div>
                            
                            <c:set var="prodPrice" value="0"/>
                            <c:forEach items="${orderlist}" var="orderItem">
                            <c:set var="prodPrice" value="${prodPrice + Integer.parseInt(orderItem.price) * Integer.parseInt(orderItem.cnt)}" />
                            </c:forEach>
                            <c:set var="deliveryFee" value="0" />
                             <c:if test="${prodPrice <= 30000}">
	                              <c:set var="deliveryFee" value="2500" />
                             </c:if>
                            
                            <ul>
                                <li class="list">
                                    <span class="listName">상품금액</span>
                                    <span class="pay-info"><fmt:formatNumber value="${prodPrice}" pattern="#,###"/><span>원</span></span>
                                </li>
                                <li class="list">
                                    <span class="listName">배송비</span>
                                    <span class="pay-info"><fmt:formatNumber value="${deliveryFee}" pattern="#,###"/><span>원</span></span>
                                </li>
                                <li class="list">
                                    <span class="listName">결제금액</span>
                                    <span class="pay-info"><fmt:formatNumber value="${orderInfo.sum}" pattern="#,###"/><span>원</span></span>
                                </li>
                                <li class="list">
                                    <span class="listName">적립금액</span>
                                    <span class="pay-info">${orderInfo.point}<span>원</span></span>
                                </li>
                                <li class="list">
                                    <span class="listName">결제방법</span>
                                    <span class="pay-info">${paymentInfo.payment}</span>
                                </li>
                            </ul>
                        </div>

                        <div class="order-info">
                            <div class="order-info-header">
                                <h3>주문정보</h3>
                            </div>
                            <ul>
                                <li class="list">
                                    <span class="info-name">주문번호</span>
                                    <span class="info">${orderInfo.no}</span>
                                </li>
                                <li class="list">
                                    <span class="info-name">보내는분</span>
                                    <span class="info">${orderInfo.name}</span>
                                </li>
                                <li class="list">
                                <fmt:parseDate value="${paymentInfo.payDate}" var="payDate" pattern="yyyy-MM-dd HH:mm:ss" />
                                    <span class="info-name">결제일시</span>
                                    <span class="info"><fmt:formatDate value="${payDate}" pattern="yyyy-MM-dd"/></span>
                                </li>
                            </ul>
                        </div>

                        <div class="order-info">
                            <div class="order-info-header">
                                <h3>배송정보</h3>
                            </div>
                            <ul>
                                <li class="list">
                                    <span class="info-name">받는분</span>
                                    <span class="info">${orderInfo.name}</span>
                                </li>
                                <li class="list">
                                    <span class="info-name">핸드폰</span>
                                    <span class="info">${orderInfo.phone}</span>
                                </li>
                                <li class="list">
                                    <span class="info-name">주소</span>
                                    <span class="info">${orderInfo.addr}</span>
                                </li>
                                <li class="list">
                                    <span class="info-name">받으실 장소</span>
                                    <span class="info">문앞</span>
                                </li>
                            </ul>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <%@include file="/views/common/footer.jsp" %>
    </div>

    <script src="../../../resources/js/order/orderDetail.js">


    </script>
</body>
</html>