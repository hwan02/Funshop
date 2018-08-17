package com.funshop.admin.vo;

import java.sql.Date;

public class NoticeVO {
	private int no;
	private String write;
	private String contents;
	private Date wdate;

	public NoticeVO() {
		// TODO Auto-generated constructor stub
	}

	public NoticeVO(int no, String write, String contents, Date wdate) {
		super();
		this.no = no;
		this.write = write;
		this.contents = contents;
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "NoticeVO [no=" + no + ", write=" + write + ", contents=" + contents + ", wdate=" + wdate + "]";
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getWrite() {
		return write;
	}

	public void setWrite(String write) {
		this.write = write;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	
	
	
}
