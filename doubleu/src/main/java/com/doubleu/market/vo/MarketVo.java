//market게시물 vo
package com.doubleu.market.vo;

import java.util.List;



public class MarketVo {
	int marketNo ;
	String marketCategory;
	String membersNo ;
	String marketSubject ;
	String marketPrice ;
	String marketAccount ;
	String marketBank ;
	String marketDoc ;
	int marketHit ;
	String marketDate ;
	
	
	List<MarketAttVo> attlist;
	//erd photo->attlist
	
	


	public List<MarketAttVo> getAttlist() {
		return attlist;
	}

	public void setAttlist(List<MarketAttVo> attlist) {
		this.attlist = attlist;
	}
	public int getMarketNo() {
		return marketNo;
	}

	public void setMarketNo(int marketNo) {
		this.marketNo = marketNo;
	}
	
	public String getMarketCategory() {
		return marketCategory;
	}

	public void setMarketCategory(String marketCategory) {
		this.marketCategory = marketCategory;
	}

	public String getMembersNo() {
		return membersNo;
	}
	public void setMembersNo(String membersNo) {
		this.membersNo = membersNo;
	}
	public String getMarketSubject() {
		return marketSubject;
	}
	public void setMarketSubject(String marketSubject) {
		this.marketSubject = marketSubject;
	}
	
	public String getMarketPrice() {
		return marketPrice;
	}

	public void setMarketPrice(String marketPrice) {
		this.marketPrice = marketPrice;
	}

	public String getMarketAccount() {
		return marketAccount;
	}
	public void setMarketAccount(String marketAccount) {
		this.marketAccount = marketAccount;
	}
	public String getMarketDoc() {
		return marketDoc;
	}
	public void setMarketDoc(String marketDoc) {
		this.marketDoc = marketDoc;
	}
	public int getMarketHit() {
		return marketHit;
	}
	public void setMarketHit(int marketHit) {
		this.marketHit = marketHit;
	}
	public String getMarketDate() {
		return marketDate;
	}
	public void setMarketDate(String marketDate) {
		this.marketDate = marketDate;
	}

	public String getMarketBank() {
		return marketBank;
	}

	public void setMarketBank(String marketBank) {
		this.marketBank = marketBank;
	}
	
}
