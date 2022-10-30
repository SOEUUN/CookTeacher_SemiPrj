package com.kh.cook.order.vo;

public class PaymentVo {
	
	public PaymentVo() {

	}
	
	public PaymentVo(String payNo, String orderNo, String payment, String payDate, String cancelYn, String cancelDate) {
		this.payNo = payNo;
		this.orderNo = orderNo;
		this.payment = payment;
		this.payDate = payDate;
		this.cancelYn = cancelYn;
		this.cancelDate = cancelDate;
	}

	private String payNo;
	private String orderNo;
	private String payment;
	private String payDate;
	private String cancelYn;
	private String cancelDate;
	
	public String getPayNo() {
		return payNo;
	}

	public void setPayNo(String payNo) {
		this.payNo = payNo;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
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

	public String getCancelYn() {
		return cancelYn;
	}

	public void setCancelYn(String cancelYn) {
		this.cancelYn = cancelYn;
	}

	public String getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(String cancelDate) {
		this.cancelDate = cancelDate;
	}

	@Override
	public String toString() {
		return "PaymentVo [payNo=" + payNo + ", orderNo=" + orderNo + ", payment=" + payment + ", payDate=" + payDate
				+ ", cancelYn=" + cancelYn + ", cancelDate=" + cancelDate + "]";
	}
	
	
}
