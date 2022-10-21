package com.kh.cook.cart;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cook.member.vo.MemberVo;

@WebServlet(urlPatterns = "/cart/list")
public class CartListController extends HttpServlet{

	// 장바구니 담기 작성(화면)
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 회원 불러오기
		HttpSession member = req.getSession();
		MemberVo loginMember = (MemberVo) member.getAttribute("loginMember");

		if(loginMember == null) {
			resp.sendRedirect("/cookTeacher/member/login");
			return;
		}
		
		// 회원일 경우
		String no = loginMember.getNo();
		
		List<CartItemVo> cartList = new CartService().selectList(no);
		
		req.setAttribute("cartList", cartList);
		req.getRequestDispatcher("/views/cart/list.jsp").forward(req, resp);
		
		
		
	}// doGet
	
	
}//class

/* 상품 선택, 전체 선택, 상품 삭제, 전체 삭제, 선택된 상품 삭제
 * 
 * 1. 회원이 먼저 로그인을 한다
 * (로그인한 회원번호 가져오기)
 * 2. 상품 리스트 혹은 레시피를 보면서 원하는 상품을 장바구니에 담는다
 */
