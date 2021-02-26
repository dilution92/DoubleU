package com.doubleu.market.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.market.vo.MarketDibVo;
import com.doubleu.market.vo.MarketVo;


@Service
public class MarketDibDao {
	@Autowired
	MarketDibMapper mapper;

	public String updateDib(MarketVo vo) {
		String msg = null ;
		int cnt = 0;
		try {
			cnt = mapper.updateDib(vo);
			
			if (cnt>0) {
				msg="찜완료";
			}else {
				msg = "찜 오류";
			}
		} catch (Exception ex) {
			msg = ex.getMessage();
			//delFile(vo.getAttlist());
		} finally {
			return msg;
		}
	}

	public String insertDib(MarketDibVo dibvo) {
		String msg = null;
		int cnt = 0;
		try {
			cnt = mapper.insertDib(dibvo);
			
			if (cnt>0) {
				msg="찜완료";
			}else {
				msg="찜오류";
			}
		} catch (Exception e) {
			msg = e.getMessage();
		}
		return msg;
	}

	public int selectDib(MarketDibVo dibvo) {
		String msg = null;
		int cnt = 0;
		try {
			cnt = mapper.selectDib(dibvo);
			System.out.println("찜갯수 : " + cnt);
			if (cnt>0) {
				msg = "찜셀렉완료";
			}else {
				msg = "찜셀렉오류";
			}
		} catch (Exception e) {
			msg = e.getMessage();
		}
		return cnt;
	}

	public int deleteDib(MarketDibVo dibvo) {
		String msg = null;
		int cnt = 0;
		try {
			cnt = mapper.deleteDib(dibvo);
			System.out.println("삭제갯수 : " + cnt);
			if (cnt>0) {
				msg = "찜삭제완료";
			}else {
				msg = "찜삭제오류";
			}
		} catch (Exception e) {
			msg = e.getMessage();
		}
		return cnt;
	}


}
