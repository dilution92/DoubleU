package com.doubleu.approval.vo;

public class SelectPage {
	int totalListSize;
	int totPage;
	int startPage;
	int endPage;
	int startNo;
	int endNo;
	int nowPage;
	int listSize = 10;
	int blockSize = 3;
	int memberNo;
	
	
	String findStr;
	String findType;
	String findState;
	
	public SelectPage() {}
	
	public SelectPage(int totalListSize, int nowPage) {
		this.totalListSize = totalListSize;
		this.nowPage = nowPage;
		pageCompute();
	}
	
	public void pageCompute() {
		totPage = (int) (Math.ceil(totalListSize/(double)listSize));
		endNo = nowPage * listSize;
		startNo = endNo - listSize + 1;
		
		if(endNo > totalListSize) {
			endNo = totalListSize;
		}
		
		endPage = (int) (Math.ceil(nowPage/(double)blockSize)) * blockSize;
		startPage = endPage - blockSize + 1;
		if(endPage > totPage) {
			endPage = totPage;
		}
	}
	
	public int getTotalListSize() {
		return totalListSize;
	}

	public void setTotalListSize(int totalListSize) {
		this.totalListSize = totalListSize;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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

	public String getFindType() {
		return findType;
	}

	public void setFindType(String findType) {
		this.findType = findType;
	}
	public String getFindState() {
		return findState;
	}
	public void setFindState(String findState) {
		this.findState = findState;
	}
}
