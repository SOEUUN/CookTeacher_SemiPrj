package com.kh.cook.order.vo;

public class OrderVo {
	
	public OrderVo() {

	}
	
	public OrderVo(String no, String memberNo, String point, String usePoint, String sum, String name, String addr,
			String phone) {
		this.no = no;
		this.memberNo = memberNo;
		this.point = point;
		this.usePoint = usePoint;
		this.sum = sum;
		this.name = name;
		this.addr = addr;
		this.phone = phone;
	}

	private String no;
	private String memberNo;
	private String point;
	private String usePoint;
	private String sum;
	private String name;
	private String addr;
	private String phone;
	
	public String getNo() {
		return no;
	}


	public void setNo(String no) {
		this.no = no;
	}


	public String getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}


	public String getPoint() {
		return point;
	}


	public void setPoint(String point) {
		this.point = point;
	}


	public String getUsePoint() {
		return usePoint;
	}


	public void setUsePoint(String usePoint) {
		this.usePoint = usePoint;
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


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "orderVo [no=" + no + ", memberNo=" + memberNo + ", point=" + point + ", usePoint=" + usePoint + ", sum="
				+ sum + ", name=" + name + ", addr=" + addr + ", phone=" + phone + "]";
	}
	
}
