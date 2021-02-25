package com.doubleu.market.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ChartMapper {
		public int selectPrice(String findStr);
		public List<Map<String, Object>> selectPriceChart(String findStr);
		public int selectfindCnt(String findStr);
	}


