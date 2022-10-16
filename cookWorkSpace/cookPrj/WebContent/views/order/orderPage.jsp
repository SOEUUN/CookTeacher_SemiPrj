<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 경로 체크 필수 -->
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<link rel="stylesheet" href="../../resources/css/order/orderPage.css">
</head>
<body>
    <%@include file="/views/common/header.jsp" %> <!-- 헤더부분 가져오기-->
    <!-- 헤더는 컨테이너 밖에 -->
    <div id="container"> <!-- 컨테이너 -->
            <main>
                <div id="order">
                        <h1>주문 / 결제</h1>

                    <div class="order-container">
                        <div class="orderInfo-wrap">
                            <div class="order-info">배송 정보</div>
                        </div>

                        <div class="shipping-info">
                            <ul>
                                <div class="info-wrapper">
                                    <li>
                                        <div class="info-list">받는 분</div>
                                        <div class="member-info">홍길동</div>
                                    </li>
                                    <li>
                                        <div class="info-list">배송지</div>
                                        <div class="member-info">[06234]서울 강남구 테헤란로14길 6 남도빌딩 2층, 3층, 4층</div>
                                    </li>
                                    <li>
                                        <div class="info-list">휴대전화번호</div>
                                        <div class="member-info">010-1234-5678
                                        </div>
                                    </li>
                                    <li>
                                        <div class="info-list">배송 요청 사항</div>
                                        <div class="dropdown-wrapper">
                                            <select class="dropdown" value="선택하여 주세요. ">
                                                
                                                    <option>부재 시 경비실에 맡겨주세요</option>
                                                    <option>부재 시 문앞에 놓아주세요</option>
                                                    <option>배송 전 연락주세요</option>
                                                
                                            </select>
                                        </div>
                                    </li>
                                </div>
                            </ul>
                        </div>
                        
                        <div id="order-header">
                            결제 상품 목록
                        </div>
                        <div class="order-wrpper">
                            <ul>
                                <li class="order-product">
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

                                <li class="order-product">
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

                        <section class="order-wrapper">
                            <div class="left">
                                <div class="use-point">
                                    <h1>포인트 사용</h1>
                                </div>
                                <div class="point-wrapper">
                                    <div class="product-price">
                                        <dl class="total-dl">
                                            <dt class="total-dt">
                                                <span>총 상품 금액</span>
                                            </dt>
                                            <dd class="total-dd">
                                                <span class="total-price">9,280</span>
                                                <span>원</span>
                                            </dd>
                                        </dl>
                                    </div>
                                    <div class="shipping">
                                        <dl class="total-dl">
                                            <dt class="total-dt">
                                                <span class="shipping-total">배송비</span>
                                            </dt>
                                            <dd class="total-dd">
                                                <span class="shipping-price">3,000</span>
                                                <span>원</span>
                                            </dd>
                                        </dl>
                                        <dl class="total-dl">
                                            <dt class="total-dt">
                                                <label for="point">포인트 2000P</label>
                                            </dt>
                                            <dd class="total-dd">
                                                <input type="text" class="save-point" placeholder="입력"><button>사용</button>
                                            </dd>
                                           
                                        </dl>
                                    </div>
                                    
                                </div>

                                <div class="payment-method">
                                    <h1>결제 수단</h1>
                                </div>
                                <div class="payment-wrapper">
                                    <div class="choose-payment">
                                        <input type="button" value="무통장입금" class="account">
                                        <input type="button" value="신용카드" class="card">
                                        <input type="button" value="카카오페이" class="kakaopay">
                                    </div>
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
                                <input type="submit" value="결제하기">
                            </div>
                        </section>



                    </div>

                </div>

                </div>   


            </main>
            <%@include file="/views/common/footer.jsp" %> <!-- 푸터부분 파일 가져오기-->
    </div>
</body>
</html>