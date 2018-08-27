package com.encore.funshop.vo;

public class Option {
	private int opNo;
	private String opName;
	private String opNum;
	private int opPrice;
	public Option() {
	}
	public Option(int opNo, String opName, String opNum, int opPrice) {
		super();
		this.opNo = opNo;
		this.opName = opName;
		this.opNum = opNum;
		this.opPrice = opPrice;
	}
	public int getOpNo() {
		return opNo;
	}
	public void setOpNo(int opNo) {
		this.opNo = opNo;
	}
	public String getOpName() {
		return opName;
	}
	public void setOpName(String opName) {
		this.opName = opName;
	}
	public String getOpNum() {
		return opNum;
	}
	public void setOpNum(String opNum) {
		this.opNum = opNum;
	}
	public int getOpPrice() {
		return opPrice;
	}
	public void setOpPrice(int opPrice) {
		this.opPrice = opPrice;
	}
	@Override
	public String toString() {
		return "Option [opNo=" + opNo + ", opName=" + opName + ", opNum=" + opNum + ", opPrice=" + opPrice + "]";
	}
	
}
