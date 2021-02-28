package com.doubleu.market.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doubleu.market.vo.MarketReplVo;
import com.doubleu.market.vo.MarketVo;

@Repository
@Mapper
public interface MarketReplMapper {

	public int insert(MarketReplVo rvo);

	public List<MarketVo> select(int marketNo);

	public int update(MarketReplVo rvo);

	public int delete(MarketReplVo rvo);

}
