package com.funshop.admin.vo;

public class SalesVO {
	String buyHis_payment;
	String buyHis_discount;
	
	
	public SalesVO() {
		// TODO Auto-generated constructor stub
	}

	public SalesVO(String buyHis_payment, String buyHis_discount) {
		super();
		this.buyHis_payment = buyHis_payment;
		this.buyHis_discount = buyHis_discount;
	}

	@Override
	public String toString() {
		return "SalesVO [buyHis_payment=" + buyHis_payment + ", buyHis_discount=" + buyHis_discount + "]";
	}

	public String getBuyHis_payment() {
		return buyHis_payment;
	}

	public void setBuyHis_payment(String buyHis_payment) {
		this.buyHis_payment = buyHis_payment;
	}

	public String getBuyHis_discount() {
		return buyHis_discount;
	}

	public void setBuyHis_discount(String buyHis_discount) {
		this.buyHis_discount = buyHis_discount;
	}
	
	
}
