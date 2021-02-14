//market게시물 vo
package com.doubleu.market.vo;

import java.util.ArrayList;
import java.util.List;



public class MarketVo {
	int marketNo ;
	int categoryNo ;
	String membersNo ;
	String marketSubject ;
	int marketPrice ;
	String marketAccount ;
	String marketDoc ;
	int marketHit ;
	String marketDate ;
	
	List<MarketAttVo> attlist = new ArrayList<MarketAttVo>();
	//erd photo->attlist
	
	
	public int getMarketNo() {
		return marketNo;
	}


	public List<MarketAttVo> getAttlist() {
		return attlist;
	}

	public void setAttlist(List<MarketAttVo> attlist) {
		this.attlist = attlist;
	}

	public void setMarketNo(int marketNo) {
		this.marketNo = marketNo;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
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
	public int getMarketPrice() {
		return marketPrice;
	}
	public void setMarketPrice(int marketPrice) {
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
	
}
