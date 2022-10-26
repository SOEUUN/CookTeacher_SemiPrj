package com.kh.cook.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cook.cart.service.CartService;
import com.kh.cook.cart.vo.CartVo;
import com.kh.cook.member.vo.MemberVo;

@WebServlet(urlPatterns = "/cart/add")
public class AddCartController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 회원 불러오기
		HttpSession member = req.getSession();
		MemberVo loginMember = (MemberVo) member.getAttribute("loginMember");
		
		// 회원이 아니면 로그인 페이지로 이동
		if(loginMember == null) {
			resp.sendRedirect("/member/login");
			return;
		}
		
		// 입력된 식재료를 가져오기
		String prodNo = req.getParameter("prodNo");
		String cnt = req.getParameter("cnt");
		String memberNo = loginMember.getNo();
		
		// 데이터 뭉치기
		CartVo vo = new CartVo();
		vo.setProdNo(prodNo);
		vo.setNo(memberNo);
		vo.setCnt(cnt);
		
		// 서비스 다녀오기
		int result = new CartService().addCart(vo);

		// 화면 보여주기
		if(result == 1) {
			req.setAttribute("cartMsg", true);
		}else {
			req.setAttribute("errorMsg", "잠시 후 다시 이용해주세요");
		}
		
		
		
		
	}
	
}
