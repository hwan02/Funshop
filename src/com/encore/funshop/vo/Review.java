package com.encore.funshop.vo;

import java.sql.Date;

public class Review {
	private int review_no; //리뷰번호
	private String review_name; //제목
	private String review_content; //내용
	private String review_img; //이미지
	private Date review_date; //날짜
	private String member_id; //작성자아이디
	
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Review(int review_no, String review_name, String review_content, String review_img, Date review_date,
			String member_id) {
		super();
		this.review_no = review_no;
		this.review_name = review_name;
		this.review_content = review_content;
		this.review_img = review_img;
		this.review_date = review_date;
		this.member_id = member_id;
	}
	
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getReview_name() {
		return review_name;
	}
	public void setReview_name(String review_name) {
		this.review_name = review_name;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	@Override
	public String toString() {
		return "Review [review_no=" + review_no + ", review_name=" + review_name + ", review_content=" + review_content
				+ ", review_img=" + review_img + ", review_date=" + review_date + ", member_id=" + member_id + "]";
	}
}
