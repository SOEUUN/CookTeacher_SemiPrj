package com.kh.cook.order.controller;

import java.io.IOException;
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

@WebServlet(urlPatterns = "/order/success")
public class OrderSuccessController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		// 회원 불러오기(session)
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		
		// 선택된 상품 목록 가져오기
		String[] check = req.getParameterValues("check");
		// 사용된 포인트 가져오기
		String usePoint = req.getParameter("usePoint");
		// 결제 수단 가져오기
		String payment = req.getParameter("payment");

		// 회원 정보 가져오기
		MemberVo cartMember = new OrderService().checkCartMember(no, check);
		// 선택된 상품 정보 가져오기
		List<CartItemVo> cartList = new OrderService().selectCartList(no, check);
		// 주문 생성(결제 정보, 주문내역)
		int totalPrice = new OrderService().insertOrder(cartMember, cartList, usePoint, payment);
		
		// 성공하면
		if(totalPrice != -1) {
			// JSP에 정보 넘겨주기
			req.setAttribute("totalPrice", totalPrice);
			req.setAttribute("cartMember", cartMember);
			req.getRequestDispatcher("/views/order/orderSuccess.jsp").forward(req, resp);
		}else{
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
		
	}
	
}
