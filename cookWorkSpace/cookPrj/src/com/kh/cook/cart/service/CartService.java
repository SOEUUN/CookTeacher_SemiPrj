package com.kh.cook.cart.service;

import java.sql.Array;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.w3c.dom.ls.LSInput;

import static com.kh.cook.common.JDBCTemplate.*;

import com.kh.cook.cart.dao.CartDao;
import com.kh.cook.cart.vo.CartItemVo;
import com.kh.cook.cart.vo.CartVo;
import com.kh.cook.product.service.ProductService;
import com.kh.cook.product.vo.ProductVo;

public class CartService {
	
	private final CartDao dao = new CartDao();
	
	// 장바구니 담기
	public int addCart(CartVo vo) {
		
		Connection conn = getConnection();
		
		CartVo checkCart = dao.checkCart(conn, vo);
		int result = 0;
		
		if(checkCart != null) {
			result = dao.updateCnt(conn, vo);
		}else {
			
			result = dao.addCart(conn, vo);
		}
		
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}// addCart

	// 장바구니 목록
	public List<CartItemVo> selectList(String no) {
		
		Connection conn = null;
		List<CartItemVo> cartList = null;
		
		// 커넥션 가져오기
		conn = getConnection();
		
		cartList = dao.selectList(conn, no);
		
		close(conn);
		
		return cartList;
		
	}// selectList

	// 장바구니 삭제
	public void deleteList(String[] prodNo, String no) {
		
		Connection conn = getConnection();
		
		for(int i = 0; i < prodNo.length; i++) {
			int result = dao.deleteOne(conn, no, prodNo[i]);
		}
		
		commit(conn);
		close(conn);
		
		return;
		
	}// deleteList

	// 장바구니 수량 조절
	public int changeCnt(String no, String prodNo, String cnt) {
		
		Connection conn= getConnection();
		
		int result = dao.changeCnt(conn, no, prodNo, cnt);
		
		commit(conn);
		close(conn);
		
		return result;
		
		
	}// changeCnt

	
}

//		//식재료 조회
//		String prodNo = vo.getProdNo();
//		ProductVo prodVo = new ProductService().selectOneByNum();
//		
//		//조회된 식재료 정보로 가격을 가져와서
//		String price = prodVo.getPrice();



// CartVo에 넣어주고

// 실제로 addCart하는 Dao에 다녀옴