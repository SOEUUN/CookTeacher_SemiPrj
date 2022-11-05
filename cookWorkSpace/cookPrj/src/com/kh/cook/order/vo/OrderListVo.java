package com.kh.cook.order.vo;

public class OrderListVo {
	
	public OrderListVo() {

	}
	
	

	public OrderListVo(String no, String sum, String name, String cnt, String imgPath, String payment, String payDate,
			String cancelYN) {
		this.no = no;
		this.sum = sum;
		this.name = name;
		this.cnt = cnt;
		this.imgPath = imgPath;
		this.payment = payment;
		this.payDate = payDate;
		this.cancelYN = cancelYN;
	}

	private String no;
	private String sum;
	private String name;
	private String cnt;
	private String imgPath;
	private String payment;
	private String payDate;
	private String cancelYN;
	
	public String getNo() {
		return no;
	}



	public void setNo(String no) {
		this.no = no;
	}



	public String getSum() {
		return sum;
	}



	public void setSum(String sum) {
		this.sum = sum;
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



	public String getImgPath() {
		return imgPath;
	}



	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}



	public String getPayment() {
		return payment;
	}



	public void setPayment(String payment) {
		this.payment = payment;
	}



	public String getPayDate() {
		return payDate;
	}



	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}



	public String getCancelYN() {
		return cancelYN;
	}



	public void setCancelYN(String cancelYN) {
		this.cancelYN = cancelYN;
	}



	@Override
	public String toString() {
		return "OrderListVo [no=" + no + ", sum=" + sum + ", name=" + name + ", cnt=" + cnt + ", imgPath=" + imgPath
				+ ", payment=" + payment + ", payDate=" + payDate + ", cancelYN=" + cancelYN + "]";
	}
	
	
	

}
