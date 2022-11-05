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
	public int addCart(List<CartVo> list) {
		
		Connection conn = getConnection();
		
		int result = 0;
		
		// list의 길이 만큼 반복
		for(int i = 0; i < list.size(); i++) {
			// list i번째를 vo 담아주기
			CartVo vo = list.get(i);
			
			// 중복된게 있으면 이쪽으로 돌려줌
			CartVo checkCart = dao.checkCart(conn, vo);
			
			// 상품 하나를 조회해 온다
			ProductVo pv = new ProductService().selectProductOne(vo.getProdNo());
			
			// 중복된 상품이 있으면
			if(checkCart != null) {
				
				// 만약에 담으려는 제품의 수량이 재고 수량보다 적으면 (중복된 상품이 있으면)
				if(Integer.parseInt(pv.getStock()) >= (Integer.parseInt(checkCart.getCnt()) + Integer.parseInt(vo.getCnt()))) {
					// 수량 조절을 해서 담아주고
					result = dao.updateCnt(conn, vo);
					
				}
			}else {
				
				// 만약에 담으려는 제품의 수량이 재고 수량보다 적으면 (중복된 상품이 없으면)
				if(Integer.parseInt(pv.getStock()) >= Integer.parseInt(vo.getCnt())) {
					
					// 상품을 카트에 담아준다
					result = dao.addCart(conn, vo);
					
				}
			}
			// 실패했으면 롤백
			if(result == 0) {
				break;
			}
			
			// 재고 수량이 없으면 롤백
			if(Integer.parseInt(pv.getStock()) <= 0) {
				result = -1;
				break;
			}
			
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
		
		// 한 회원의 장바구니에 담을 정보 셀렉트 해오기
		cartList = dao.selectList(conn, no);
		
		close(conn);
		
		return cartList;
		
	}// selectList

	// 장바구니 삭제
	public void deleteList(String[] prodNo, String no) {
		
		Connection conn = getConnection();
		
		// proNo의 길이까지 돌면서
		for(int i = 0; i < prodNo.length; i++) {
			// 제품 하나씩 삭제
			int result = dao.deleteOne(conn, no, prodNo[i]);
		}
		
		commit(conn);
		close(conn);
		
		return;
		
	}// deleteList

	// 장바구니 수량 조절
	public int changeCnt(String no, String prodNo, String cnt) {
		
		Connection conn= getConnection();
		
		// 식재료 가져오기
		ProductVo pv = new ProductService().selectProductOne(prodNo);
		
		int result = 0;
		
		// 재고수량이 상품 수량보다 많으면
		if(Integer.parseInt(pv.getStock()) >= Integer.parseInt(cnt)) {
			
			// 장바구니 수량 조절 해줌(수량 조절 버튼)
			result = dao.changeCnt(conn, no, prodNo, cnt);
			
		}
		
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