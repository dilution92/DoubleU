package com.doubleu.market.mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ChartDao {
	
	@Autowired
	ChartMapper mapper;
	
	public int selectPrice(String findStr) {
		int price = mapper.selectPrice(findStr);
		System.out.println("dao가격: "+price);
		
		return price;
	}
	
	public List<Map<String, Object>> selectPriceChart(String findStr) {
		List<Map<String, Object>> map = new ArrayList<>();
		try {
			map = mapper.selectPriceChart(findStr);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return map;
	}

	public int selectfindCnt(String findStr) {
		int cnt = 0;
		try {
			cnt = mapper.selectfindCnt(findStr);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return cnt;
	}

}
