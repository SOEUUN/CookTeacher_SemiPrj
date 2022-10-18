package com.kh.cook.cart;

public class CartVo {
	
	public CartVo() {
		
	}
	
	
	public CartVo(String no, String prodNo, String cnt, String paymentYN) {
		this.no = no;
		this.prodNo = prodNo;
		this.cnt = cnt;
		this.paymentYN = paymentYN;
	}

	private String no;
	private String prodNo;
	private String cnt;
	private String paymentYN;
	
	public String getNo() {
		return no;
	}


	public void setNo(String no) {
		this.no = no;
	}


	public String getProdNo() {
		return prodNo;
	}


	public void setProdNo(String prodNo) {
		this.prodNo = prodNo;
	}


	public String getCnt() {
		return cnt;
	}


	public void setCnt(String cnt) {
		this.cnt = cnt;
	}


	public String getPaymentYN() {
		return paymentYN;
	}


	public void setPaymentYN(String paymentYN) {
		this.paymentYN = paymentYN;
	}


	@Override
	public String toString() {
		return "CartVo [no=" + no + ", prodNo=" + prodNo + ", cnt=" + cnt + ", paymentYN=" + paymentYN + "]";
	}
	
	
	
}
