package com.doubleu.market.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.market.vo.MarketPage;
import com.doubleu.market.vo.MarketVo;

@Service
public class SortDao {
	
	@Autowired
	SortMapper mapper;

	public Map<String, Object> selectLowprice(MarketPage page) {

		Map<String, Object> map = new HashMap<String, Object>();
		List<MarketVo> list = null;
		try {
			int totListSize = mapper.totListSize(page);
			page.setTotListSize(totListSize);
			page.pageCompute();
		
			list = mapper.selectLowprice(page);
			map.put("page", page);
			map.put("list", list);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return map;
		}
	}

	public Map<String, Object> selectLatest(MarketPage page) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<MarketVo> list = null;
		try {
			int totListSize = mapper.totListSize(page);
			page.setTotListSize(totListSize);
			page.pageCompute();
		
			list = mapper.selectLatest(page);
			map.put("page", page);
			map.put("list", list);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return map;
		}
	}
}
