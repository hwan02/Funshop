package com.encore.funshop.vo;

import java.util.Date;

public class UserInfo {
	private String id; //회원 아이디
	private String pw; //패스워드
	private String name; //이름
	private String phone; //핸드폰
	private String email; //이메일
	private String addr; //주소
	private Date wdate; //회원 가입일
	private String question; //id,pw찾기 질문
	private String answer; //id,pw찾기 답변
	private String rank; //회원 등급 default 브론즈
	
	public UserInfo() {
		// TODO Auto-generated constructor stub
	}
	
	public UserInfo(String id, String pw, String name, String phone, String email, String addr, Date wdate,
			String question, String answer, String rank) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.addr = addr;
		this.wdate = wdate;
		this.question = question;
		this.answer = answer;
		this.rank = rank;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
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

	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", pw=" + pw + ", name=" + name + ", phone=" + phone + ", email=" + email
				+ ", addr=" + addr + ", wdate=" + wdate + ", question=" + question + ", answer=" + answer + ", rank="
				+ rank + "]";
	}
}