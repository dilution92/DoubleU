package com.doubleu.approval.mybatis;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doubleu.approval.vo.ApprovalFormVo;

@Repository
@Mapper
public interface ApprovalMapper {

	public Integer insert(ApprovalFormVo vo);
}
