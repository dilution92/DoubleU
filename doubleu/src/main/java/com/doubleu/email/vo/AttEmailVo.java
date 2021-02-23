package com.doubleu.email.vo;

public class AttEmailVo {
	
	int filesNo;
	int emailNo;
	String sysFile;
	String oriFile;
	
	public int getFilesNo() {
		return filesNo;
	}
	public void setFilesNo(int filesNo) {
		this.filesNo = filesNo;
	}
	public int getEmailNo() {
		return emailNo;
	}
	public void setEmailNo(int emailNo) {
		this.emailNo = emailNo;
	}
	public String getSysFile() {
		return sysFile;
	}
	public void setSysFile(String sysFile) {
		this.sysFile = sysFile;
	}
	public String getOriFile() {
		return oriFile;
	}
	public void setOriFile(String oriFile) {
		this.oriFile = oriFile;
	}
	
	
	@Override
	public String toString() {
		return "AttEmailVo [filesNo=" + filesNo + ", emailNo=" + emailNo + ", sysFile=" + sysFile + ", oriFile="
				+ oriFile + "]";
	}

}
