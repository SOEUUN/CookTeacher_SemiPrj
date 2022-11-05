package com.kh.cook.order.service;

import static com.kh.cook.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.cook.cart.dao.CartDao;
import com.kh.cook.cart.vo.CartItemVo;
import com.kh.cook.cart.vo.CartVo;
import com.kh.cook.member.vo.MemberVo;
import com.kh.cook.order.dao.OrderDao;
import com.kh.cook.order.vo.OrderDetailVo;
import com.kh.cook.order.vo.OrderListVo;
import com.kh.cook.order.vo.OrderVo;
import com.kh.cook.order.vo.PaymentVo;

public class OrderService {
	
	private final OrderDao dao = new OrderDao();

	// 회원 장바구니 가져오기
	public MemberVo checkCartMember(String no, String[] check) {

		Connection conn = getConnection();
		
		// 회원 정보 가져오기
		MemberVo vo = dao.selectMemberByNo(conn, no);
		
		close(conn);
		
		return vo;
		
	}

	// 장바구니 상품 하나 조회하기
	public List<CartItemVo> selectCartList(String no, String[] check) {
		
		Connection conn = getConnection();
		
		// 장바구니에 담긴 상품을 담을 list 선언
		List<CartItemVo> productList = new ArrayList<CartItemVo>();
		
		// 장바구니의 길이만큼 돌면서
		for(int i = 0; i < check.length; i++) {
			// 장바구니 상품을 하나씩 조회하면서
			CartItemVo cartItem = dao.selectCartOne(conn, no, check[i]);
			// 정보를 list에 담아주기
			productList.add(cartItem);
		}
		
		
		close(conn);
		
		return productList;
		
	}

	// 주문 내역 만들기
	public int insertOrder(MemberVo cartMember, List<CartItemVo> cartList, String point, String payment) {

		//전체 가격 선언
		int totalPrice = 0;
		
		// 장바구니 목록을 반복하면서 
		for(int i = 0; i < cartList.size(); i++) {
			// 장바구니 목록의 i번째를 가져오기
			CartItemVo item = cartList.get(i);
			// 전체 가격 계산(상품 가격 * 상품 개수)
			int sum = Integer.parseInt(item.getPrice()) * Integer.parseInt(item.getCnt());
			// 전체 가격에 더해주기
			totalPrice += sum;
		}
		// 전체가격이 3만원 이하일 경우
		if(totalPrice < 30000) {
			// 배송비 더해주기
			totalPrice += 2500;
		}
		// 포인트가 null이 아니고 포인트가 빈 문자열이 아닐때
		if(point != null && !point.equals("")) {
			// 전체 가격에서 포인트를 빼준다
			totalPrice -= Integer.parseInt(point);
		}
		
		// 적립률 선언
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
		
		// 적립 포인트 계산(전체 가격 * 적립률)
		int earn = (int)(totalPrice * rate);
		// 포인트 변화량 계산(적립 포인트 - 사용한 포인트)
		int totalPoint = earn - Integer.parseInt(point);
	
		Connection conn = getConnection();
		
		// 포인트 업데이트 해주기
		int resultPoint = dao.subtractPoint(conn, cartMember, totalPoint);
		
		// 주문 생성해주기
		int result = dao.insertOrder(conn, cartMember, point, totalPrice, earn);
		
		// 주문 번호 받아오기
		String num = dao.selectSeq(conn);
		
		// 결제 정보 넣어주기
		int paymentResult = dao.insertPayment(conn, num, payment);

		// 성공 여부 변수 선언
		boolean isSuccess = true;
		
		// 주문 리스트까지 돌면서 
		for(int i = 0; i < cartList.size(); i++) {
			// 리스트의 i번째 가져오기
			CartItemVo item = cartList.get(i);
			
			// 주문 내역 만들기
			int detailResult = dao.insertOrderDetail(conn, num, item);
			// 장바구니에 결제 여부 업데이트 해주기
			int updateResult = dao.updatePaymentYN(conn, cartMember, item);
			// 결제시 재고 수량 업데이트 
			int updateStock = dao.updateStock(conn, item);
			
			// 실패하면 롤백해줌 (커밋하지 않기 위해서)
			if(detailResult == 0) {
				result = 0;
				isSuccess = false;
				break;
			}
		}
		
		// 성공하면 커밋 해줌
		if(isSuccess == true && paymentResult == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		if(result == 1) {
			return totalPrice;
		}else {
			return -1;
		}
		
	}
 
	// 주문 내역 가져오기
	public List<OrderDetailVo> selectOrderList(String no, String num) {
		

		// 커넥션 가져오기
		Connection conn =  getConnection();
		
		// 주문한 상품 정보 가져오기
		List<OrderDetailVo> orderDetailList = dao.selectOrderDetail(conn, num);
		
		close(conn);
		
		return orderDetailList;
	
	}
	
	// 주문 정보 가져오기
	public OrderVo selectOrderInfo(String num) {
		
		// 커넥션 가져오기
		Connection conn = getConnection();
		
		// 주문 정보 하나 가져오기
		OrderVo orderInfo = dao.selectorderInfo(conn, num);
		
		close(conn);
		
		return orderInfo;
		
	}
	
	// 결제 정보 가져오기
	public PaymentVo selectPaymentInfo(String num) {
		
		// 커넥션 가져오기
		Connection conn = getConnection();
		
		// 결제 정보 하나 조회하기
		PaymentVo paymentInfo = dao.selectPaymentInfo(conn, num);
		
		close(conn);
		
		return paymentInfo;
		
	}
	
	// 주문 내역 조회하기
	public List<OrderListVo> selectOrderInfoList(String no) {
		
		Connection conn = getConnection();
		
		// 주문 정보 조회하기
		List<OrderListVo> orderList = dao.selectOrderInfoList(conn, no);
		
		close(conn);
		
		return orderList;
		
	}

	public int deleteOrder(String orderNo) {
		
		Connection conn = getConnection();
		
		// 주문 취소 여부 변경하기
		int result = dao.deleteOrder(conn, orderNo);
		
		close(conn);
		
		return result;
		
	}

}

/* 주문에 주문번호 / 결제 금액
 * 주문내역에 내역번호 / 식재료 번호 / 주문 번호 
 * 결제에 결제 수단 / 결제 날짜
 * 
 * 셀렉트 하려면 식재료 이름 / 주문 번호 / 결제 방법 / 결제 금액
 */

/* 결제 완료된 상품 하나 조회하기
 * 
 */