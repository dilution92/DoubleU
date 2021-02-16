package com.doubleu.approval.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doubleu.approval.vo.FormVo;
import com.doubleu.approval.vo.IndexPage;
import com.doubleu.approval.vo.SelectPage;

@Repository
@Mapper
public interface ApprovalMapper {

	public Integer insert(FormVo vo);
	
	public List<FormVo> outgoingSelect(IndexPage page);
	public int outgoingTotalListSize(IndexPage page);
	
	public int chooseTotalListSize(SelectPage page);
	public List<FormVo> chooseSelect(SelectPage page);
	
}
