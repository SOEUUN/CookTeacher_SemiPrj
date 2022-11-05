package com.kh.cook.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cook.cart.service.CartService;
import com.kh.cook.member.vo.MemberVo;

@WebServlet(urlPatterns = "/cart/delete")
public class DeleteCartController extends HttpServlet {

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
		
		// 입력된 식재료를 가져오기(전체 삭제, 선택 삭제를 위해서 배열로 받아오기)
		String[] prodNo = req.getParameterValues("prodNo");
		
		// 장바구니에 있는 상품 삭제
		new CartService().deleteList(prodNo, no);
		
		// 요청에 대한 응답을 해줌
		PrintWriter writer = resp.getWriter();
		// 배열의 모양을 만들어줌(배열의 모양을 만들어서 출력해야 JS에서 처리 가능)
		writer.write("["+String.join(",",prodNo)+"]");

	}
	
}
