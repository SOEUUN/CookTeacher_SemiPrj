<%@page import="com.kh.cook.cart.vo.CartItemVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	List<CartItemVo> cartList = (List<CartItemVo>) request.getAttribute("cartList");

%>

    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>cookTeacher</title>
        <!-- 경로 체크 필수 -->
        <link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
        <link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
        <link rel="stylesheet" href="../resources/css/cart/list.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    </head>

    <body>

        <%@ include file="/views/common/header.jsp" %>
            <!-- 헤더는 컨테이너 밖에 -->
            <div id="container">
                <!-- 컨테이너 -->
                <main>
                    <div id="cart">
                        <h1>장바구니</h1>

                        <div class="cart-container">
                            <div id="cart-wrapper">
                                <div id="cart-header">
                                    <div class="all-btn">
                                        <div class="choose-all">
                                            <input id="all" type="checkbox" ><label for="all">전체선택</label>
                                        </div>
                                        <div class="delete">
                                            <input type="button" value="삭제하기" onclick="deleteList()">
                                        </div>
                                    </div>
                                </div>
								
                                <form id="product-area" onsubmit="cookOrder()" action="/cookTeacher/order/info" method="post">
                                    <ul>
                                        <c:if test="${empty cartList}">
                                            <div class="none-cart">
                                                <p>장바구니에 담긴 상품이 없습니다.</p></div>
                                        </c:if>
                                   		<c:forEach items="${cartList}" var="cartItem">
                                        <li class="product">
                                            <input type="checkbox" name="check" value="${cartItem.prodNo}" onchange="cookCheck()">
                                            <div class="thumb">
                                                <img src="<c:url value="/resources/img/product/"></c:url>${cartItem.imgPath}" alt="${cartItem.name}">
                                            </div>
                                            <div class="product-name">
                                                <a href="#">${cartItem.name}</a>
                                            </div>
                                            <div class="count-wrapper">
                                                <button type="button" class="minus" onclick="changeCnt(${cartItem.prodNo}, -1)"></button>
                                                <div class="count">${cartItem.cnt}</div>
                                                <button type="button" class="plus" onclick="changeCnt(${cartItem.prodNo}, 1)"></button>
                                            </div>
                                            <div class="price"><fmt:formatNumber value="${Integer.parseInt(cartItem.price) * Integer.parseInt(cartItem.cnt)}" pattern="#,###"/>원</div>
                                            <button type="button" class="remove" onclick="deleteOne(${cartItem.prodNo})"></button>
                                        </li>
                                    </c:forEach>
                                       <c:set var="total" value="0" />
			                            <c:set var="totalCnt" value="0"/>
										<c:forEach var="cartItem" items="${cartList}">
											<c:set var="total" value="${total + Integer.parseInt(cartItem.price) * Integer.parseInt(cartItem.cnt)}" />
											<c:set var="totalCnt" value="${totalCnt + 1}"/>
										</c:forEach>
	                                    <c:set var="deliveryFee" value="0" />
	                                    <c:if test="${total <= 30000}">
		                                	<c:set var="deliveryFee" value="2500" />
	                                    </c:if>
                                        <div class="product-footer">
                                            <span><fmt:formatNumber value="${total}" pattern="#,###"/>원 + 배송비 <fmt:formatNumber value="${deliveryFee}" pattern="#,###"/>원 = <fmt:formatNumber value="${total + deliveryFee}" pattern="#,###"/>원</span>
                                            <span>(30,000원이상 무료배송)</span>
                                        </div>
                                    </ul>
                                </form>
                            </div>

                            <div id="order-price">
                                <div class="price-pay">
                                    <div>결제예정금액</div>
                                </div>
                                <div class="price-wrapper">
                                    <div class="price">
                                        <div>상품금액</div>
                                        <div><fmt:formatNumber value="${total}" pattern="#,###"/>원</div>
                                    </div>
                                    <div class="price">
                                        <div>배송비</div>
                                        <div><fmt:formatNumber value="${deliveryFee}" pattern="#,###"/>원</div>
                                    </div>
                                </div>
                                <div class="sum">
                                    <div class="sum-cnt">총 ${totalCnt}건</div>
                                    <div class="sum-amt"><strong><fmt:formatNumber value="${total + deliveryFee}" pattern="#,###"/></strong>원</div>
                                </div>
                                <input type="submit" value="주문하기" form="product-area" id="order">
                            </div>
                        </div>

                    </div>
                </main>
                <%@include file="/views/common/footer.jsp" %> 
            </div>
    <script src="../resources/js/cart/list.js"></script>
    <script>

    </script>        
    </body>

    </html>