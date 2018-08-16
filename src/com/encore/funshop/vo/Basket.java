package com.encore.funshop.vo;

public class Basket {
	private int basket_no; //장바구니번호
	private String member_id; //구매자아이디
	private int product_no; //물품번호
	
	public Basket() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Basket(int basket_no, String member_id, int product_no) {
		super();
		this.basket_no = basket_no;
		this.member_id = member_id;
		this.product_no = product_no;
	}
	
	public int getBasket_no() {
		return basket_no;
	}
	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
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
		return "Basket [basket_no=" + basket_no + ", member_id=" + member_id + ", product_no=" + product_no + "]";
	}
}
