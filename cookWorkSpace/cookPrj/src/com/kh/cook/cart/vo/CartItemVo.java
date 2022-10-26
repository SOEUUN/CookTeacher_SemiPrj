package com.kh.cook.cart.vo;

public class CartItemVo {

	public CartItemVo() {
		
	}
	
	public CartItemVo(String prodNo, String imgPath, String name, String cnt, String price) {
		this.prodNo = prodNo;
		this.imgPath = imgPath;
		this.name = name;
		this.cnt = cnt;
		this.price = price;
	}

	private String prodNo;
	private String imgPath;
	private String name;
	private String cnt;
	private String price;
	
	public String getProdNo() {
		return prodNo;
	}


	public void setProdNo(String prodNo) {
		this.prodNo = prodNo;
	}


	public String getImgPath() {
		return imgPath;
	}


	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
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
		return "CartItemVo [prodNo=" + prodNo + ", imgPath=" + imgPath + ", name=" + name + ", cnt=" + cnt + ", price="
				+ price + "]";
	}
	
	
	
}
