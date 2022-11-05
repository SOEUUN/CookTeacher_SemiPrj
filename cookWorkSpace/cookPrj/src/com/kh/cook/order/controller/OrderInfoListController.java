package com.kh.cook.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.ant.jmx.JMXAccessorQueryTask;

import com.kh.cook.member.vo.MemberVo;
import com.kh.cook.order.service.OrderService;
import com.kh.cook.order.vo.OrderDetailVo;
import com.kh.cook.order.vo.OrderListVo;
import com.kh.cook.order.vo.OrderVo;
import com.kh.cook.order.vo.PaymentVo;

@WebServlet(urlPatterns = "/order/mypage/orderlist")
public class OrderInfoListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 회원 불러오기
		HttpSession session = req.getSession();
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		// 회원번호 가져오기
		String no = loginMember.getNo();
		
		// 주문 정보 조회하기
		List<OrderListVo> orderList = new OrderService().selectOrderInfoList(no);
		
		// JSP로 보내주기
		req.setAttribute("orderList", orderList);
		req.getRequestDispatcher("/views/order/orderList.jsp").forward(req, resp);
		
		// 주문 내역 -> 주문 상세(결제 정보, 주문정보 등등) 이걸 여러개 뭉쳐야하는데..
	}
	
}
