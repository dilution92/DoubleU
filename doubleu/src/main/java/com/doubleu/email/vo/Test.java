package com.doubleu.email.vo;

public class Test {
	int no;
	String name;
	
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
	
	@Override
	public String toString() {
		return "Test [no=" + no + ", name=" + name + "]";
	}
}
