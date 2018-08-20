package com.encore.funshop.vo;

public class Product {
	private int product_no;
	private String product_name;
	private String product_summary;
	private String product_description;
	private String product_mainImg;
	private String product_state;
	private String product_type;
	private String product_time;
	private String product_season;
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(int product_no, String product_name, String product_summary, String product_description,
			String product_mainImg, String product_state, String product_type, String product_time,
			String product_season) {
		super();
		this.product_no = product_no;
		this.product_name = product_name;
		this.product_summary = product_summary;
		this.product_description = product_description;
		this.product_mainImg = product_mainImg;
		this.product_state = product_state;
		this.product_type = product_type;
		this.product_time = product_time;
		this.product_season = product_season;
	}
	
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_summary() {
		return product_summary;
	}
	public void setProduct_summary(String product_summary) {
		this.product_summary = product_summary;
	}
	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	public String getProduct_mainImg() {
		return product_mainImg;
	}
	public void setProduct_mainImg(String product_mainImg) {
		this.product_mainImg = product_mainImg;
	}
	public String getProduct_state() {
		return product_state;
	}
	public void setProduct_state(String product_state) {
		this.product_state = product_state;
	}
	public String getProduct_type() {
		return product_type;
	}
	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}
	public String getProduct_time() {
		return product_time;
	}
	public void setProduct_time(String product_time) {
		this.product_time = product_time;
	}
	public String getProduct_season() {
		return product_season;
	}
	public void setProduct_season(String product_season) {
		this.product_season = product_season;
	}
	
	@Override
	public String toString() {
		return "Product [product_no=" + product_no + ", product_name=" + product_name + ", product_summary="
				+ product_summary + ", product_description=" + product_description + ", product_mainImg="
				+ product_mainImg + ", product_state=" + product_state + ", product_type=" + product_type
				+ ", product_time=" + product_time + ", product_season=" + product_season + "]";
	}
}
