package com.doubleu.email.vo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class EmailPage {
	// tot -> total
	
	int totListSize; // 전체가 몇개 인지
	int totPage; // 총 페이지
	int startPage; // 1
	int endPage; // totpage
	int startNo;
	int endNo; 
	int nowPage;
	int listSize = 8;
	int blockSize = 3;
	
	String memberMid;
	String findStr;
	List<String> findStrList = new ArrayList<>();
	
	

	public EmailPage() {
		
	}
	
	public EmailPage(int tot, int now) {
		this.totListSize = tot;
		this.nowPage = now;
		pageCompute();
	}
	
	public void pageCompute() { // totListSize, nowPage가 기준이 된다.
		totPage = (int)Math.ceil(totListSize / (double)listSize);
		endNo = nowPage * listSize;
		startNo = endNo - listSize + 1;
		
		// 보정작업
		if(endNo > totListSize) {
			endNo = totListSize;
		}
		
		endPage = (int)(Math.ceil(nowPage/(double)blockSize))*blockSize;
		startPage = endPage-blockSize+1;
	
		// 보정작업
		if(endPage > totPage) { 
			endPage = totPage;
		}
		
	}
	
	public List<String> getFindStrList() {
		if(findStr != null) {
			String[] temp = findStr.split(" ");
			findStrList.addAll(Arrays.asList(temp));
		}
		return findStrList;
	}
	
	public int getTotListSize() {
		return totListSize;
	}

	public void setTotListSize(int totListSize) {
		this.totListSize = totListSize;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public String getFindStr() {
		return findStr;
	}

	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
	
	public String getMemberMid() {
		return memberMid;
	}

	public void setMemberMid(String memberMid) {
		this.memberMid = memberMid;
	}

	@Override
	public String toString() {
		return "EmailPage [totListSize=" + totListSize + ", totPage=" + totPage + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", startNo=" + startNo + ", endNo=" + endNo + ", nowPage=" + nowPage
				+ ", listSize=" + listSize + ", blockSize=" + blockSize + ", memberMid=" + memberMid + ", findStr="
				+ findStr + ", findStrList=" + findStrList + "]";
	}
}
