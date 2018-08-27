package com.encore.funshop.vo;

public class Product {
	private int no;
	private String name;
	private String summary;
	private String description;
	private String mainImg;
	private String state;
	private String type;
	private String time;
	private String season;
	public Product(int no, String name, String summary, String description, String mainImg, String state, String type,
			String time, String season) {
		super();
		this.no = no;
		this.name = name;
		this.summary = summary;
		this.description = description;
		this.mainImg = mainImg;
		this.state = state;
		this.type = type;
		this.time = time;
		this.season = season;
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
	public String getMainImg() {
		return mainImg;
	}
	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	@Override
	public String toString() {
		return "Product [no=" + no + ", name=" + name + ", summary=" + summary + ", description=" + description
				+ ", mainImg=" + mainImg + ", state=" + state + ", type=" + type + ", time=" + time + ", season="
				+ season + "]";
	}
	public Product() {
	}
}
