package com.kh.cook.order.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.cook.cart.vo.CartItemVo;
import com.kh.cook.member.vo.MemberVo;

import static com.kh.cook.common.JDBCTemplate.*;

public class OrderDao {

	// 장바구니 상품 하나 조회하기
	public CartItemVo selectCartOne(Connection conn, String no, String prodNo) {
		
		String sql = "SELECT P.PROD_NO, C.CNT, P.NAME, P.PRICE, P.IMG_PATH FROM CART C JOIN PRODUCT P ON P.PROD_NO = C.PROD_NO WHERE C.PAYMENT_YN = 'N' AND C.NO = ? AND P.PROD_NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CartItemVo vo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			pstmt.setString(2, prodNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				String cnt= rs.getString("CNT");
				String name= rs.getString("NAME");
				String price= rs.getString("PRICE");
				String imgPath = rs.getString("IMG_PATH");
				
				vo = new CartItemVo();
				vo.setProdNo(prodNo);
				vo.setCnt(cnt);
				vo.setName(name);
				vo.setPrice(price);
				vo.setImgPath(imgPath);
						
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return vo;
	}
	
	public MemberVo selectMemberByNo(Connection conn, String no) {
		
		String sql ="SELECT NO, GRADE, EMAIL, NAME, PHONE, ADDR, POINT FROM MEMBER WHERE NO = ?";
		
		PreparedStatement pstmt = null;
		MemberVo member = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String grade = rs.getString("GRADE");
				String email = rs.getString("EMAIL");
				String name = rs.getString("NAME");
				String phone = rs.getString("PHONE");
				String dataAddr = rs.getString("ADDR");
				String point = rs.getString("POINT");
				
				int idx = dataAddr.indexOf(",");
				
				String addr = dataAddr.substring(0, idx);
				String detailAddr = dataAddr.substring(idx+1);
				
				
				member = new MemberVo();
				member.setNo(no);
				member.setGrade(grade);
				member.setEmail(email);
				member.setName(name);
				member.setPhone(phone);
				member.setAddr(addr);
				member.setDetailAddr(detailAddr);
				member.setPoint(point);

				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return member;
		
	}

	public int insertOrder(Connection conn, MemberVo cartMember, String point, int totalPrice, int earn) {

		String sql = "INSERT INTO \"ORDER\" (NO, MEMBER_NO, POINT, USE_POINT, SUM, NAME, ADDR, PHONE) VALUES (SEQ_ORDER_NO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cartMember.getNo());
			pstmt.setString(2, Integer.toString(earn));
			pstmt.setString(3, point);
			pstmt.setString(4, Integer.toString(totalPrice));
			pstmt.setString(5, cartMember.getName());
			pstmt.setString(6, cartMember.getAddr());
			pstmt.setString(7, cartMember.getPhone());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public String selectSeq(Connection conn) {
		
		String sql ="SELECT SEQ_ORDER_NO.CURRVAL NUM FROM \"ORDER\"";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String num = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getString("NUM");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return num;
	}

	public int insertOrderDetail(Connection conn, String num, CartItemVo item) {

		String sql = "INSERT INTO ORDER_DETAIL (NO, PROD_NO, ORDER_NO ,CNT , PRICE) VALUES (SEQ_ORDER_DETAIL_NO.NEXTVAL, ?, ?, ?, ?)";
		

		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, item.getProdNo());
			pstmt.setString(2, num);
			pstmt.setString(3, item.getCnt());
			pstmt.setString(4, item.getPrice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
		
	}


}
