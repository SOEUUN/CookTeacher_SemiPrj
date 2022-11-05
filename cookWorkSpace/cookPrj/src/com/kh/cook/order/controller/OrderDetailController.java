package com.kh.cook.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cook.member.vo.MemberVo;
import com.kh.cook.order.service.OrderService;
import com.kh.cook.order.vo.OrderDetailVo;
import com.kh.cook.order.vo.OrderVo;
import com.kh.cook.order.vo.PaymentVo;

@WebServlet(urlPatterns = "/order/mypage/orderlist/orderDetail")
public class OrderDetailController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 회원 불러오기
		HttpSession session = req.getSession();
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		// 회원번호 가져오기
		String no = loginMember.getNo();
		
		// 주문 번호 가져오기
		String num = req.getParameter("num");
		
		// 주문한 상품 정보 가져오기
		List<OrderDetailVo> orderlist = new OrderService().selectOrderList(no,num);
		// 주문 정보 가져오기
		OrderVo orderInfo = new OrderService().selectOrderInfo(num);
		// 결제 정보 가져오기
		PaymentVo paymentInfo = new OrderService().selectPaymentInfo(num);
		
		// 주문한 사람과 로그인 한 사람의 memberNo가 같은지 비교
		String memberNo = orderInfo.getMemberNo();
		if(no.equals(memberNo)) {
			// JSP로 넘겨주기
			req.setAttribute("orderlist", orderlist);
			req.setAttribute("orderInfo", orderInfo);
			req.setAttribute("paymentInfo", paymentInfo);
			 
			req.getRequestDispatcher("/views/order/orderDetail.jsp").forward(req, resp);
			 
		}else {
			// 일치하지 않으면 로그인 페이지로 넘겨주기
			resp.sendRedirect("/cookTeacher/member/login");
		}
		 
		
	}

}
