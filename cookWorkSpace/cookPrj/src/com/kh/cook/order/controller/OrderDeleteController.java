package com.kh.cook.order.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.order.service.OrderService;

@WebServlet(urlPatterns = "/order/delete")
public class OrderDeleteController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 주문번호 가져오기
		String orderNo = req.getParameter("orderNo");

		// 주문 취소 여부 변경하기
		int result = new OrderService().deleteOrder(orderNo);

		// 성공이면
		if (result == 1) {
			// 요청에 대한 응답 해주기
			PrintWriter writer = resp.getWriter();
			writer.write(result);
		} 

	}

}
