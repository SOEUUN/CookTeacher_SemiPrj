package com.kh.cook.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cook.member.vo.MemberVo;
import com.kh.cook.order.service.OrderService;

@WebServlet(urlPatterns = "/login/mypage/member/orderDetail")
public class OrderDetailController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 회원 불러오기
		HttpSession member = req.getSession();
		MemberVo loginMember = (MemberVo) member.getAttribute("loginMember");
		
		// 회원번호 가져오기
		String no = loginMember.getNo();
		
		// 주문번호
		
		// 결제방법
		
		new OrderService().selectOrderList(no);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		
	}
	
}
