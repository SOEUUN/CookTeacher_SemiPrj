package com.kh.cook.cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/cookTeacher/cart")
public class CartController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	
}

/* 상품 선택, 전체 선택, 상품 삭제, 전체 삭제, 선택된 상품 삭제
 * 
 * 1. 회원이 먼저 로그인을 한다
 * (로그인한 회원번호 가져오기)
 * 2. 상품 리스트 혹은 레시피를 보면서 원하는 상품을 장바구니에 담는다
 */
