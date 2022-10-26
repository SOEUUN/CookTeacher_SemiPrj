package com.kh.cook.order.vo;

public class OrderDetailVo {
	
	public OrderDetailVo() {
	
	}
	
	public OrderDetailVo(String no, String prod_no, String order_no, String cnt, String price) {
		this.no = no;
		this.prod_no = prod_no;
		this.order_no = order_no;
		this.cnt = cnt;
		this.price = price;
	}

	private String no;
	private String prod_no;
	private String order_no;
	private String cnt;
	private String price;
	
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getProd_no() {
		return prod_no;
	}

	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}

	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "oderDetailVo [no=" + no + ", prod_no=" + prod_no + ", order_no=" + order_no + ", cnt=" + cnt
				+ ", price=" + price + "]";
	}
	
}
