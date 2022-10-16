<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>cookTeacher</title>
        <!-- 경로 체크 필수 -->
        <link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
        <link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
        <link rel="stylesheet" href="../../resources/css/cart/list.css">
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
                                        <input id="all" type="checkbox"><label for="all">전체선택</label>
                                    </div>
                                </div>

                                <div id="product-area">
                                    <div class="product-header">상품</div>
                                    <ul>
                                        <li class="product">
                                            <input type="checkbox">
                                            <div class="thumb">
                                                <img src="../../resources/img/양파.jpg" alt="양파">
                                            </div>
                                            <div class="product-name">
                                                <a href="#">유기농 양파 1.5kg</a>
                                            </div>
                                            <div class="count-wrapper">
                                                <button class="minus"></button>
                                                <div class="count">1</div>
                                                <button class="plus"></button>
                                            </div>
                                            <div class="price">5,990원</div>
                                            <button class="remove"></button>
                                        </li>
                                        <li class="product">
                                            <input type="checkbox">
                                            <div class="thumb">
                                                <img src="../../resources/img/소시지.jpg" alt="소시지">
                                            </div>
                                            <div class="product-name">
                                                <a href="#">[존쿡 델리미트]살라미 스낵 50g</a>
                                            </div>
                                            <div class="count-wrapper">
                                                <button class="minus"></button>
                                                <div class="count">1</div>
                                                <button class="plus"></button>
                                            </div>
                                            <div class="price">3,290원</div>
                                            <button class="remove"></button>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <div id="order-price">
                                <div class="price-pay">
                                    <div>결제예정금액</div>
                                </div>
                                <div class="price-wrapper">
                                    <div class="price">
                                        <div>상품금액</div>
                                        <div>9,280원</div>
                                    </div>
                                    <div class="price">
                                        <div>배송비</div>
                                        <div>3,000원</div>
                                    </div>
                                </div>
                                <div class="sum">
                                    <div class="sum-cnt">총 2건</div>
                                    <div class="sum-amt"><strong>12,280</strong>원</div>
                                </div>
                                <input type="submit" value="주문하기">
                            </div>
                        </div>

                    </div>

                </main>
                <%@include file="/views/common/footer.jsp" %> 
            </div>

    </body>

    </html>