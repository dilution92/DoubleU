package com.doubleu.market.mybatis;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doubleu.market.vo.MarketVo;

@Repository
@Mapper
public interface MarketMapper {

	int insert(MarketVo vo);

}
