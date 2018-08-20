package com.funshop.admin.vo;

import java.sql.Date;

public class MemberVO {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	private String addr;
	private String question;
	private String answer;
	private String rank;
	private Date wdate;

	public MemberVO() {
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String id, String pw, String name, String email, String phone, String addr, String question,
			String answer, String rank, Date wdate) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.addr = addr;
		this.question = question;
		this.answer = answer;
		this.rank = rank;
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email + ", phone=" + phone
				+ ", addr=" + addr + ", question=" + question + ", answer=" + answer + ", rank=" + rank + ", wdate="
				+ wdate + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	
	
	
	

}
