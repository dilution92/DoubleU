package com.doubleu.market.mybatis;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doubleu.market.vo.MarketDibVo;
import com.doubleu.market.vo.MarketVo;

@Repository
@Mapper
public interface MarketDibMapper {

	int updateDib(MarketVo vo);

	int insertDib(MarketDibVo dibvo);

	int selectDib(MarketDibVo dibvo);

	int deleteDib(MarketDibVo dibvo);

}
