package com.kh.cook.cart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.cook.cart.vo.CartItemVo;
import com.kh.cook.cart.vo.CartVo;

import static com.kh.cook.common.JDBCTemplate.*;

public class CartDao {

	// 장바구니 담기
	public int addCart(Connection conn, CartVo vo) {
		
		String sql ="INSERT INTO CART (NO, PROD_NO, CNT) VALUES (?, ?, ?)";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getNo());
			pstmt.setString(2, vo.getProdNo());
			pstmt.setString(3, vo.getCnt());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	// 장바구니 리스트 
	public List<CartItemVo> selectList(Connection conn, String no) {
		
		String sql = "SELECT P.PROD_NO, C.CNT, P.NAME, P.PRICE, P.IMG_PATH FROM CART C JOIN PRODUCT P ON P.PROD_NO = C.PROD_NO WHERE C.PAYMENT_YN = 'N' AND C.NO = ? ORDER BY ADD_DATE DESC";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CartItemVo> list = new ArrayList<CartItemVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				String prodNo = rs.getString("PROD_NO");
				String cnt = rs.getString("CNT");
				String name = rs.getString("NAME");
				String price = rs.getString("PRICE");
				String imgPath = rs.getString("IMG_PATH");
				
				CartItemVo vo = new CartItemVo();
				
				vo.setProdNo(prodNo);
				vo.setCnt(cnt);
				vo.setName(name);
				vo.setPrice(price);
				vo.setImgPath(imgPath);
				
				list.add(vo);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	
		
	}

	// 장바구니 제품 한개 삭제하기
	public int deleteOne(Connection conn, String no, String prodNo) {
		
		String sql ="DELETE CART WHERE NO = ? AND PROD_NO = ? AND PAYMENT_YN = 'N'";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			pstmt.setString(2, prodNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	// 제품 수량 변경
	public int changeCnt(Connection conn, String no, String prodNo, String cnt) {
		
		String sql = "UPDATE CART SET CNT = ? WHERE NO = ? AND PROD_NO = ? AND PAYMENT_YN = 'N'";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cnt);
			pstmt.setString(2, no);
			pstmt.setString(3, prodNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	// 장바구니에 있는 상품이 중복 되어 있는지 체크
	public CartVo checkCart(Connection conn, CartVo vo) {
		
		String sql = "SELECT NO, PROD_NO, CNT FROM CART WHERE NO = ? AND PROD_NO = ? AND PAYMENT_YN = 'N'";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CartVo cv = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getNo());
			pstmt.setString(2, vo.getProdNo());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String cnt = rs.getString("CNT");
	
				cv = new CartVo();
				
				cv.setNo(vo.getNo());
				cv.setProdNo(vo.getProdNo());
				cv.setCnt(cnt);
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return cv;
		
		
	}

	// 장바구니 중복 제품 개수 수정
	public int updateCnt(Connection conn,  CartVo vo) {
		
		String sql = "UPDATE CART SET CNT=CNT+? WHERE NO = ? AND PROD_NO = ? AND PAYMENT_YN = 'N'";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getCnt());
			pstmt.setString(2, vo.getNo());
			pstmt.setString(3, vo.getProdNo());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
}
