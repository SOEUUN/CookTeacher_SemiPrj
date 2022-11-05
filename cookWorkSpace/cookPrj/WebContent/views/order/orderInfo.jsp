<%@page import="com.kh.cook.cart.vo.CartItemVo" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
    List<CartItemVo> cartList = (List<CartItemVo>) request.getAttribute("cartList");
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
    <link rel="stylesheet" href="../resources/css/order/orderInfo.css">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>
    <%@include file="/views/common/header.jsp" %>
        <!-- 헤더부분 가져오기-->
        <!-- 헤더는 컨테이너 밖에 -->
        <div id="container">
            <!-- 컨테이너 -->
            <form action="/cookTeacher/order/success" method="post">
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
                                        <div class="member-info">${cartMember.getName()}
                                        </div>
                                    </li>
                                    <li>
                                        <div class="info-list">배송지</div>
                                        <div class="member-info">
                                            <input type="text" id="addr" value="${cartMember.getAddr()}" readonly></input>
                                            <button type="button" class="search" onclick="searchAddr()">주소검색</button>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="info-list">상세주소</div>
                                        <div class="member-info">
                                            <input class="member-info" id="detailAddr"
                                                value="${cartMember.getDetailAddr()}" placeholder="나머지 주소를 입력해주세요." readonly>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="info-list">휴대전화번호</div>
                                        <div class="member-info">${cartMember.getPhone()}
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
                                <c:forEach var="cartItem" items="${cartList}">
                                    <li class="order-product">
                                        <input type="hidden" name="check"
                                            value="${cartItem.prodNo}">
                                        <div class="thumb">
                                            <img src="<c:url value="/upload/img/" />${cartItem.imgPath}" alt="${cartItem.name}">
                                        </div>
                                        <div class="product-name">
                                            <a href="#">${cartItem.name}</a>
                                        </div>

                                            <div class="count">${cartItem.cnt}개</div>
                                    
                                        <div class="price">
                                            <fmt:formatNumber
                                                value="${Integer.parseInt(cartItem.price) * Integer.parseInt(cartItem.cnt)}"
                                                pattern="#,###" />원
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>

                        </div>

                        <c:set var="total" value="0" />
                        <c:set var="totalCnt" value="0" />
                        <c:forEach var="cartItem" items="${cartList}">
                            <c:set var="total"
                                value="${total + Integer.parseInt(cartItem.price) * Integer.parseInt(cartItem.cnt)}" />
                            <c:set var="totalCnt" value="${totalCnt + 1}" />
                        </c:forEach>
                        <c:set var="deliveryFee" value="0" />
                        <c:if test="${total <= 30000}">
                            <c:set var="deliveryFee" value="2500" />
                        </c:if>

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
                                                <span class="total-price">
                                                    <fmt:formatNumber value="${total}"
                                                        pattern="#,###" />
                                                </span>
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
                                                <span class="shipping-price">
                                                    <fmt:formatNumber value="${deliveryFee}"
                                                        pattern="#,###" />
                                                </span>
                                                <span>원</span>
                                            </dd>
                                        </dl>
                                        <dl class="total-dl">
                                            <dt class="total-dt">
                                                <label for="point">포인트
                                                    ${cartMember.getPoint()}P</label>
                                            </dt>
                                            <dd class="total-dd">
                                                <input type="text" name="save-point"
                                                    class="save-point"
                                                    placeholder="입력"><button type="button" onclick="clickPoint()">사용</button>
                                            </dd>

                                        </dl>
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
                                        <div>
                                            <fmt:formatNumber value="${total}"
                                                pattern="#,###" />원
                                        </div>
                                    </div>
	
                                    <div class="price">
                                        <div>사용 포인트</div>
                                        <div class="usePoint">
                                            0P
                                        </div>
                                        <input name="usePoint" type="hidden" value="0">
                                    </div>
									<c:set var="memberRate" value="<%=rate%>"/>
                                    <div class="price">
                                        <div>적립예정 포인트</div>
                                        <div class="addPoint">
                                            <fmt:formatNumber value="${total * memberRate}"
                                                pattern="#,###" />원
                                        </div>
                                        <input name="addPoint" type="hidden" value="0">
                                    </div>

                                    <div class="price">
                                        <div>배송비</div>
                                        <div>
                                            <fmt:formatNumber value="${deliveryFee}"
                                                pattern="#,###" />원
                                        </div>
                                    </div>
                                </div>
                                <div class="sum">
                                    <div class="sum-cnt">총 ${totalCnt}건</div>
                                    <div class="sum-amt"><strong>
                                            <fmt:formatNumber value="${total + deliveryFee}"
                                                pattern="#,###" />
                                        </strong>원</div>
                                </div>
                                <button type="button" onclick="requestPay()">결제하기</button>
                            </div>
                        </section>



                    </div>

                </div>

        </div>
        <input type="hidden" name="payment" value="">

    </form>
        <%@include file="/views/common/footer.jsp" %>
            <!-- 푸터부분 파일 가져오기-->
            </div>
            <script>
                const point = <%=cartMember.getPoint()%>;
                const totalPrice = ${total};
                const deliveryFee = ${deliveryFee};

                let prodName = "${cartList.get(0).name}";

                const cnt = ${cartList.size()};
                if(cnt > 1){
                    prodName += ' 외 ' +(cnt-1) +'건'
                }

                const name = "<%=cartMember.getName()%>";
                const email = "<%=cartMember.getEmail()%>";
                const phone = "<%=cartMember.getPhone()%>";
                const addr = "<%=cartMember.getAddr()%>";
            </script>
                 <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script src="../resources/js/order/orderInfo.js"></script>

</body>

</html>