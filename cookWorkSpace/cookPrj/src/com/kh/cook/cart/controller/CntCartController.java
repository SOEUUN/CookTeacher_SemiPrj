package com.kh.cook.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cook.cart.service.CartService;
import com.kh.cook.member.vo.MemberVo;

@WebServlet(urlPatterns = "/cart/cnt")
public class CntCartController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 회원 불러오기
		HttpSession member = req.getSession();
		MemberVo loginMember = (MemberVo) member.getAttribute("loginMember");

		if(loginMember == null) {
			resp.sendRedirect("/member/login");
			return;
		}
		
		// 회원일 경우
		String no = loginMember.getNo();
		
		// 입력된 식재료를 가져오기
		String prodNo = req.getParameter("prodNo");
		String cnt = req.getParameter("cnt");
		
		int result = new CartService().changeCnt(no, prodNo, cnt);

	}
	
	
}
