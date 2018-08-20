package com.encore.funshop.vo;

public class Pdetail { //상품옵션
	private int pdetail_no;
	private String pdetail_name;
	private String pdetail_summary;
	private String pdetail_description;
	private String pdetail_pdImg;
	private int pdetail_price;
	private int pdetail_num;
	private int product_no;
	
	public Pdetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Pdetail(int pdetail_no, String pdetail_name, String pdetail_summary, String pdetail_description,
			String pdetail_pdImg, int pdetail_price, int pdetail_num, int product_no) {
		super();
		this.pdetail_no = pdetail_no;
		this.pdetail_name = pdetail_name;
		this.pdetail_summary = pdetail_summary;
		this.pdetail_description = pdetail_description;
		this.pdetail_pdImg = pdetail_pdImg;
		this.pdetail_price = pdetail_price;
		this.pdetail_num = pdetail_num;
		this.product_no = product_no;
	}
	
	public int getPdetail_no() {
		return pdetail_no;
	}
	public void setPdetail_no(int pdetail_no) {
		this.pdetail_no = pdetail_no;
	}
	public String getPdetail_name() {
		return pdetail_name;
	}
	public void setPdetail_name(String pdetail_name) {
		this.pdetail_name = pdetail_name;
	}
	public String getPdetail_summary() {
		return pdetail_summary;
	}
	public void setPdetail_summary(String pdetail_summary) {
		this.pdetail_summary = pdetail_summary;
	}
	public String getPdetail_description() {
		return pdetail_description;
	}
	public void setPdetail_description(String pdetail_description) {
		this.pdetail_description = pdetail_description;
	}
	public String getPdetail_pdImg() {
		return pdetail_pdImg;
	}
	public void setPdetail_pdImg(String pdetail_pdImg) {
		this.pdetail_pdImg = pdetail_pdImg;
	}
	public int getPdetail_price() {
		return pdetail_price;
	}
	public void setPdetail_price(int pdetail_price) {
		this.pdetail_price = pdetail_price;
	}
	public int getPdetail_num() {
		return pdetail_num;
	}
	public void setPdetail_num(int pdetail_num) {
		this.pdetail_num = pdetail_num;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	
	@Override
	public String toString() {
		return "Pdetail [pdetail_no=" + pdetail_no + ", pdetail_name=" + pdetail_name + ", pdetail_summary="
				+ pdetail_summary + ", pdetail_description=" + pdetail_description + ", pdetail_pdImg=" + pdetail_pdImg
				+ ", pdetail_price=" + pdetail_price + ", pdetail_num=" + pdetail_num + ", product_no=" + product_no
				+ "]";
	}
}
