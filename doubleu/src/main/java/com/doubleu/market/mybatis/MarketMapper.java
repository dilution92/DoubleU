package com.doubleu.market.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doubleu.market.vo.MarketAttVo;
import com.doubleu.market.vo.MarketPage;
import com.doubleu.market.vo.MarketVo;

@Repository
@Mapper
public interface MarketMapper {
	public List<MarketVo> select(MarketPage page);
	public List<MarketAttVo> selectAtt(int marketNo);
	public int totListSize(MarketPage page);

	public int insert(MarketVo vo);
	public List<MarketVo> select2();
	public int selectCount();
	public int totalCount();
	public MarketVo view(int marketNo);
	public List<MarketAttVo> selectAttOne();
	
	public int update(MarketVo vo);
	public int insertAtt(MarketVo vo);
	public int deleteAtt(MarketVo vo);
	public int delete(MarketVo vo);
	public int deleteAttNo(int marketNo);


}
