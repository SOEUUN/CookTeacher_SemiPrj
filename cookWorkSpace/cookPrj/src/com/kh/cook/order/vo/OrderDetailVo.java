package com.kh.cook.order.vo;

public class OrderDetailVo {
	
	public OrderDetailVo() {
	
	}

	public OrderDetailVo(String no, String prodNo, String orderNo, String cnt, String price, String name,
			String imgPath) {
		this.no = no;
		this.prodNo = prodNo;
		this.orderNo = orderNo;
		this.cnt = cnt;
		this.price = price;
		this.name = name;
		this.imgPath = imgPath;
	}

	private String no;
	private String prodNo;
	private String orderNo;
	private String cnt;
	private String price;
	private String name;
	private String imgPath;
	
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

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	@Override
	public String toString() {
		return "OrderDetailVo [no=" + no + ", prodNo=" + prodNo + ", orderNo=" + orderNo + ", cnt=" + cnt + ", price="
				+ price + ", name=" + name + ", imgPath=" + imgPath + "]";
	}

	
	
}
