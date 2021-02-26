package com.doubleu.market.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doubleu.market.vo.MarketPage;
import com.doubleu.market.vo.MarketVo;

@Repository
@Mapper
public interface SortMapper {

	int totListSize(MarketPage page);

	List<MarketVo> selectLowprice(MarketPage page);

	List<MarketVo> selectLatest(MarketPage page);

}
