<%@page import="com.kh.cook.order.vo.OrderListVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String view = (String)request.getAttribute("view");
	List<OrderListVo> orderList = (List<OrderListVo>) request.getAttribute("orderList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 마이페이지</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/order/mainCopy.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
<link rel="stylesheet" href="/cookTeacher/resources/css/order/orderList.css">

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
                                <a href="<%=root %>/order/mypage/orderlist">
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
                        <div class="header-wrapper">
                            <h2 id="head-aticle">주문내역</h2>
                            <span class="explain">최대 지난 1년간의 주문 내역까지 확인 할 수 있어요</span>
                        </div>
                        <div class="period">
                            <select class="dropdown">
                                <option class="option">3개월</option>
                                <option class="option">6개월</option>
                                <option class="option">1년</option>
                            </select>
                        </div>
                    </div>
                    <div id="board-container">
                        <div class="empty">
                            <c:if test="${empty orderList}">
                                <div class="none-cart">
                                    <p>주문내역이 없습니다.</p>
                                </div>
                            </c:if>
                        </div>
                        <c:forEach items="${orderList}" var="orderItem">
                            <fmt:parseDate value="${orderItem.payDate}" var="payDate" pattern="yyyy-MM-dd HH:mm:ss" />
                        <div class="order-info">
                            <div class="order-header">
                                <span><fmt:formatDate value="${payDate}" pattern="yyyy-MM-dd"/></span>
                                <a href="/cookTeacher/order/mypage/orderlist/orderDetail?num=${orderItem.getNo()}">주문내역 상세보기</a>
                            </div>
                            <div class="order-info-wrapper">
                                <div class="thumb">
                                    <img src="<c:url value="/upload/img/" />${orderItem.imgPath}" alt="${orderItem.name}">
                                </div>
                                <div class="order-list">
                                    <dl class="order-dl">
                                        <dt class="order-dt">상품명</dt>
                                        <dd class="order-dd">${orderItem.name}<c:if test="${orderItem.cnt > 1}">외 ${Integer.parseInt(orderItem.cnt)-1}건</c:if></dd>
                                    </dl>
                                    <dl class="order-dl">
                                        <dt class="order-dt">주문번호</dt>
                                        <dd class="order-dd">${orderItem.no}</dd>
                                    </dl>
                                    <dl class="order-dl">
                                        <dt class="order-dt">결제방법</dt>
                                        <dd class="order-dd">${orderItem.payment}</dd>
                                    </dl>
                                    <dl class="order-dl">
                                        <dt class="order-dt">결제금액</dt>
                                        <dd class="order-dd"><fmt:formatNumber value="${orderItem.sum}" pattern="#,###"/>원</dd>
                                    </dl>
                                </div>
                                <div class="order-right">
                                    <div class="status">
                                        <c:if test="${orderItem.cancelYN eq 'Y'}">
                                    <span class="shipping">결제취소</span>
                                    </c:if>
                                    <c:if test="${orderItem.cancelYN eq 'N'}">
                                        <span class="shipping">결제완료</span>
                                    </c:if>
                                    </div>
                                    <div class="ask">
                                        <button class="ask-btn"><a href="<%=root%>/cs/QnA/write">1:1문의하기</a></button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/views/common/footer.jsp"%>
    </div>

    <script>


    </script>
</body>
</html>