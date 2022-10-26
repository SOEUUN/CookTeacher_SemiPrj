package com.kh.cook.order.service;

import static com.kh.cook.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.cook.cart.dao.CartDao;
import com.kh.cook.cart.vo.CartItemVo;
import com.kh.cook.member.vo.MemberVo;
import com.kh.cook.order.dao.OrderDao;

public class OrderService {
	
	private final OrderDao dao = new OrderDao();

	// 회원 장바구니 가져오기
	public MemberVo checkCartMember(String no, String[] check) {

		Connection conn = getConnection();
		
		MemberVo vo = dao.selectMemberByNo(conn, no);
		
		close(conn);
		
		return vo;
		
	}

	// 장바구니 상품 하나 조회하기
	public List<CartItemVo> selectCartList(String no, String[] check) {
		
		Connection conn = getConnection();
		

		List<CartItemVo> productList = new ArrayList<CartItemVo>();
		
		for(int i = 0; i < check.length; i++) {
			CartItemVo cartItem = dao.selectCartOne(conn, no, check[i]);
			productList.add(cartItem);
		}
		
		
		close(conn);
		
		return productList;
		
	}

	// 주문 내역 만들기
	public int insertOrder(MemberVo cartMember, List<CartItemVo> cartList, String point) {

		int totalPrice = 0;
		
		for(int i = 0; i < cartList.size(); i++) {
			CartItemVo item = cartList.get(i);
			int sum = Integer.parseInt(item.getPrice()) * Integer.parseInt(item.getCnt());
			totalPrice += sum;
		}
		
		if(point != null && !point.equals("")) {
			totalPrice -= Integer.parseInt(point);
		}
		
		double rate = 0;
		
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
		
		int earn = (int)(totalPrice * rate);
	
		Connection conn = getConnection();
		
		int result = dao.insertOrder(conn, cartMember, point, totalPrice, earn);
		String num = dao.selectSeq(conn);

		boolean isSuccess = true;
		
		for(int i = 0; i < cartList.size(); i++) {
			CartItemVo item = cartList.get(i);
			
			int detailResult = dao.insertOrderDetail(conn, num, item);
			
			// 실패하면 롤백해줌 (커밋하지 않기 위해서)
			if(detailResult == 0) {
				rollback(conn);
				result = 0;
				isSuccess = false;
				break;
			}
		}
		
		// 성공하면 커밋 해줌
		if(isSuccess == true) {
			commit(conn);
		}
		
		close(conn);
		return result;
		
	}

}