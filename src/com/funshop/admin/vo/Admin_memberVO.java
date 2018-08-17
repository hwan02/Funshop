package com.funshop.admin.vo;

import java.sql.Date;

public class Admin_memberVO {
	int no;
	String id;
	String pass;
	String name;
	String tel;
	String email;
	String addr;
	Date wdate;
	
	public Admin_memberVO() {
		// TODO Auto-generated constructor stub
	}

	public Admin_memberVO(int no, String id, String pass, String name, String tel, String email, String addr,
			Date wdate) {
		super();
		this.no = no;
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.addr = addr;
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "Admin_memberVO [no=" + no + ", id=" + id + ", pass=" + pass + ", name=" + name + ", tel=" + tel
				+ ", email=" + email + ", addr=" + addr + ", wdate=" + wdate + "]";
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
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

	  
	
	
}
