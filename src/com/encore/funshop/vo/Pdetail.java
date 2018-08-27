package com.encore.funshop.vo;

public class Pdetail { //상품옵션
	private int no;
	private String name;
	private String summary;
	private String description;
	private String pdImg;
	private int price;
	private int num;
	private int product_no;
	
	public Pdetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Pdetail(int no, String name, String summary, String description, String pdImg, int price, int num,
			int product_no) {
		super();
		this.no = no;
		this.name = name;
		this.summary = summary;
		this.description = description;
		this.pdImg = pdImg;
		this.price = price;
		this.num = num;
		this.product_no = product_no;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPdImg() {
		return pdImg;
	}
	public void setPdImg(String pdImg) {
		this.pdImg = pdImg;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	
	@Override
	public String toString() {
		return "Pdetail [no=" + no + ", name=" + name + ", summary=" + summary + ", description=" + description
				+ ", pdImg=" + pdImg + ", price=" + price + ", num=" + num + ", product_no=" + product_no + "]";
	}
}
