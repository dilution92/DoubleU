//첨부파일 vo
package com.doubleu.market.vo;

public class MarketAttVo {
		int filesNo;
		int MarketNo;
		String sysFile;
		String oriFile;
		int filesMain;
		
		
		public int getFilesMain() {
			return filesMain;
		}
		public void setFilesMain(int filesMain) {
			this.filesMain = filesMain;
		}
		public int getFilesNo() {
			return filesNo;
		}
		public void setFilesNo(int filesNo) {
			this.filesNo = filesNo;
		}
		
		public int getMarketNo() {
			return MarketNo;
		}
		public void setMarketNo(int marketNo) {
			MarketNo = marketNo;
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
	
	
}
