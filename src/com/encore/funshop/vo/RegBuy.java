package com.encore.funshop.vo;

import java.sql.Date;

public class RegBuy {
	private int regBuy_no; //장바구니번호
	private Date regBuy_date; //신청날짜
	private String member_id; //구매자아이디
	private int product_no; //물품번호
	
	public RegBuy() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RegBuy(int regBuy_no, Date regBuy_date, String member_id, int product_no) {
		super();
		this.regBuy_no = regBuy_no;
		this.regBuy_date = regBuy_date;
		this.member_id = member_id;
		this.product_no = product_no;
	}
	
	public int getRegBuy_no() {
		return regBuy_no;
	}
	public void setRegBuy_no(int regBuy_no) {
		this.regBuy_no = regBuy_no;
	}
	public Date getRegBuy_date() {
		return regBuy_date;
	}
	public void setRegBuy_date(Date regBuy_date) {
		this.regBuy_date = regBuy_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	
	@Override
	public String toString() {
		return "RegBuy [regBuy_no=" + regBuy_no + ", regBuy_date=" + regBuy_date + ", member_id=" + member_id
				+ ", product_no=" + product_no + "]";
	}
}
