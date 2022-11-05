package com.kh.cook.order.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cook.cart.vo.CartItemVo;
import com.kh.cook.member.vo.MemberVo;
import com.kh.cook.order.service.OrderService;
import com.kh.cook.order.vo.OrderVo;

@WebServlet(urlPatterns = "/order/info")
public class OrderInfoController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session = req.getSession();
		
		// 회원 불러오기(session)
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		// 선택한 상품 목록 가져오기
		String[] check = req.getParameterValues("check");
		
		// 회원 정보 가져와서
		MemberVo cartMember = new OrderService().checkCartMember(no, check);
		// 선택된 상품의 정보를 가져오기
		List<CartItemVo> cartList = new OrderService().selectCartList(no, check);
		
		// JSP로 넘겨주기
		req.setAttribute("cartMember", cartMember);
		req.setAttribute("cartList", cartList);
		req.getRequestDispatcher("/views/order/orderInfo.jsp").forward(req, resp);
		
	}

}
/* 배송정보, 포인트 조회 및 사용, 결제수단 선택(무통장, 신용카드, 카카오페이)
 * 1. 회원 정보 가져오기(이름, 전화번호, 주소, 포인트, 회원 등급)
 * 2. 장바구니 목록 가져오기
 * 3. 포인트 조회 해서 얼마 사용 할건지
 * 4. 결제수단, 배송지 api
 * 
 * 
 * 회원등급에 따른 사항 물어보기
 * 
 */
