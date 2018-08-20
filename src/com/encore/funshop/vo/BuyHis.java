package com.encore.funshop.vo;

import java.util.Date;

public class BuyHis {
	private int buyHis_no; //주문번호
	private Date buyHis_date; //날짜
	private String member_id; //구매자아이디
	private int pdetail_no; //옵션번호
	private int product_no; //상품번호
	private int buyHis_num; //주문수량
	private String buyHis_addr; //배송지주소
	private int buyHis_payment; //결제금액
	private String buyHis_payType; //결제종류
	private String buyHis_payInfo; //결제정보
	private int buyHis_discount; //할인금액
	private String buyHis_cond; //상태
	
	private String pdetail_name; //옵션이름 
	private String product_name; //상품이름 
	private String product_mainimg; //상품이미지 
	
	public BuyHis() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BuyHis(int buyHis_no, Date buyHis_date, String member_id, int pdetail_no, int product_no, int buyHis_num,
			String buyHis_addr, int buyHis_payment, String buyHis_payType, String buyHis_payInfo, int buyHis_discount,
			String buyHis_cond, String pdetail_name, String product_name, String product_mainimg) {
		super();
		this.buyHis_no = buyHis_no;
		this.buyHis_date = buyHis_date;
		this.member_id = member_id;
		this.pdetail_no = pdetail_no;
		this.product_no = product_no;
		this.buyHis_num = buyHis_num;
		this.buyHis_addr = buyHis_addr;
		this.buyHis_payment = buyHis_payment;
		this.buyHis_payType = buyHis_payType;
		this.buyHis_payInfo = buyHis_payInfo;
		this.buyHis_discount = buyHis_discount;
		this.buyHis_cond = buyHis_cond;
		this.pdetail_name = pdetail_name;
		this.product_name = product_name;
		this.product_mainimg = product_mainimg;
	}
	
	public int getBuyHis_no() {
		return buyHis_no;
	}
	public void setBuyHis_no(int buyHis_no) {
		this.buyHis_no = buyHis_no;
	}
	public Date getBuyHis_date() {
		return buyHis_date;
	}
	public void setBuyHis_date(Date buyHis_date) {
		this.buyHis_date = buyHis_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getPdetail_no() {
		return pdetail_no;
	}
	public void setPdetail_no(int pdetail_no) {
		this.pdetail_no = pdetail_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getBuyHis_num() {
		return buyHis_num;
	}
	public void setBuyHis_num(int buyHis_num) {
		this.buyHis_num = buyHis_num;
	}
	public String getBuyHis_addr() {
		return buyHis_addr;
	}
	public void setBuyHis_addr(String buyHis_addr) {
		this.buyHis_addr = buyHis_addr;
	}
	public int getBuyHis_payment() {
		return buyHis_payment;
	}
	public void setBuyHis_payment(int buyHis_payment) {
		this.buyHis_payment = buyHis_payment;
	}
	public String getBuyHis_payType() {
		return buyHis_payType;
	}
	public void setBuyHis_payType(String buyHis_payType) {
		this.buyHis_payType = buyHis_payType;
	}
	public String getBuyHis_payInfo() {
		return buyHis_payInfo;
	}
	public void setBuyHis_payInfo(String buyHis_payInfo) {
		this.buyHis_payInfo = buyHis_payInfo;
	}
	public int getBuyHis_discount() {
		return buyHis_discount;
	}
	public void setBuyHis_discount(int buyHis_discount) {
		this.buyHis_discount = buyHis_discount;
	}
	public String getBuyHis_cond() {
		return buyHis_cond;
	}
	public void setBuyHis_cond(String buyHis_cond) {
		this.buyHis_cond = buyHis_cond;
	}
	public String getPdetail_name() {
		return pdetail_name;
	}
	public void setPdetail_name(String pdetail_name) {
		this.pdetail_name = pdetail_name;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_mainimg() {
		return product_mainimg;
	}
	public void setProduct_mainimg(String product_mainimg) {
		this.product_mainimg = product_mainimg;
	}
	
	@Override
	public String toString() {
		return "BuyHis [buyHis_no=" + buyHis_no + ", buyHis_date=" + buyHis_date + ", member_id=" + member_id
				+ ", pdetail_no=" + pdetail_no + ", product_no=" + product_no + ", buyHis_num=" + buyHis_num
				+ ", buyHis_addr=" + buyHis_addr + ", buyHis_payment=" + buyHis_payment + ", buyHis_payType="
				+ buyHis_payType + ", buyHis_payInfo=" + buyHis_payInfo + ", buyHis_discount=" + buyHis_discount
				+ ", buyHis_cond=" + buyHis_cond + ", pdetail_name=" + pdetail_name + ", product_name=" + product_name
				+ ", product_mainimg=" + product_mainimg + "]";
	}
}
